import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_bottom_navbar.dart';
import '../../core/widgets/stat_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Welcome Back,\nAlexandra!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          AssetImage("assets/images/user.jpg"),
                    )
                  ],
                ),
                const SizedBox(height: 30),

                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Column(
                    children: [
                      Text(
                        "Calories Today",
                        style: TextStyle(color: Colors.white70),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "1,752",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                GridView.count(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 1.4,
                  children: const [
                    StatCard(
                      title: "Protein",
                      value: "120 g",
                      icon: Icons.egg_alt,
                    ),
                    StatCard(
                      title: "Carbs",
                      value: "220 g",
                      icon: Icons.rice_bowl,
                    ),
                    StatCard(
                      title: "Fat",
                      value: "65 g",
                      icon: Icons.water_drop,
                    ),
                    StatCard(
                      title: "Sleep",
                      value: "7.5 h",
                      icon: Icons.nightlight_round,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavbar(currentIndex: 0),
    );
  }
}