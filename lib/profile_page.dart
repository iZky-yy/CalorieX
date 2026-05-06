import 'package:flutter/material.dart';
import 'edit_profile_page.dart';
import 'package:fl_chart/fl_chart.dart';

// ==========================================
// HALAMAN UTAMA PROFIL
// ==========================================
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String currentName = "Alexandra";
  String currentEmail = "alexandra@email.com";
  String currentPhone = "+62 812-3456-7890";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF081111),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.notifications_none, color: Colors.white),
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.white),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfilePage(
                    initialName: currentName,
                    initialEmail: currentEmail,
                  ),
                ),
              );

              if (result != null && result is Map<String, String>) {
                setState(() {
                  currentName = result['name']!;
                  currentEmail = result['email']!;
                  // Ambil data phone jika kamu mengirimnya dari EditProfilePage
                  if (result.containsKey('phone')) {
                    currentPhone = result['phone']!;
                  }
                });
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildHeader(currentName),
            const SizedBox(height: 24),
            _buildStats(),
            const SizedBox(height: 24),
            _buildPremiumCard(),
            const SizedBox(height: 24),
            _buildMyProgress(),
          ],
        ),
      ),
    );
  }
}

Widget _buildHeader(String name) {
  return Column(
    children: [
      // PAKAI ICON SUPAYA TIDAK ERROR ASSET
      CircleAvatar(
        radius: 40,
        backgroundColor: Colors.grey[800],
        child: const Icon(Icons.person, size: 40, color: Colors.white),
      ),
      const SizedBox(height: 12),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 5),
          const Icon(Icons.check_circle, color: Colors.greenAccent, size: 20),
        ],
      ),
      const Text('Level 12', style: TextStyle(color: Colors.grey)),
      const SizedBox(height: 15),
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: LinearProgressIndicator(
          value: 0.7,
          backgroundColor: Colors.grey[900],
          color: Colors.greenAccent,
          minHeight: 8,
        ),
      ),
      const SizedBox(height: 6),
      const Align(
        alignment: Alignment.centerRight,
        child: Text(
          '2.450 / 3.500 XP',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ),
    ],
  );
}

Widget _buildStats() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      _statItem('78', 'Workouts'),
      _statItem('128', 'Days Active'),
      _statItem('12.4 kg', 'Weight Lost'),
    ],
  );
}

Widget _statItem(String value, String label) {
  return Column(
    children: [
      Text(
        value,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
    ],
  );
}

Widget _buildPremiumCard() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFF132222),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.greenAccent.withOpacity(0.3)),
    ),
    child: Row(
      children: [
        const Icon(
          Icons.workspace_premium,
          color: Colors.greenAccent,
          size: 30,
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CalorieX Premium',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Unlock all features',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.greenAccent,
            foregroundColor: Colors.black,
            shape: const StadiumBorder(),
          ),
          child: const Text(
            'Go Premium',
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

Widget _buildMyProgress() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'My Progress',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'View All →',
            style: TextStyle(color: Colors.greenAccent, fontSize: 12),
          ),
        ],
      ),
      const SizedBox(height: 16),
      _buildProgressItem('Weight', '72.5 kg', '-1.2 kg this week', [
        4,
        3,
        5,
        2,
        4,
        3,
        4,
      ]),
      _buildProgressItem('Body Fat', '18.7 %', '-0.8 % this week', [
        2,
        4,
        3,
        5,
        4,
        6,
        5,
      ]),
      _buildProgressItem('Muscle Mass', '36.2 kg', '+0.6 kg this week', [
        3,
        2,
        4,
        3,
        5,
        4,
        6,
      ]),
    ],
  );
}

// Fungsi pembantu untuk membuat baris progress dengan grafik garis mini
Widget _buildProgressItem(
  String title,
  String value,
  String subtitle,
  List<double> points,
) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFF132222), // Warna gelap sesuai mockup
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.greenAccent, fontSize: 11),
              ),
            ],
          ),
        ),
        // Grafik Garis Melengkung (Line Chart)
        Expanded(
          flex: 3,
          child: SizedBox(
            height: 50,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: points
                        .asMap()
                        .entries
                        .map((e) => FlSpot(e.key.toDouble(), e.value))
                        .toList(),
                    isCurved: true, // Ini yang bikin garisnya melengkung halus
                    color: Colors.greenAccent,
                    barWidth: 2,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.greenAccent.withOpacity(0.3),
                          Colors.greenAccent.withOpacity(0.0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

// Helper function untuk membuat batang grafik
BarChartGroupData _makeBarGroup(int x, double y) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        toY: y,
        color: Colors.greenAccent,
        width: 12,
        borderRadius: BorderRadius.circular(4),
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          toY: 20,
          color: Colors.white10,
        ),
      ),
    ],
  );
}
