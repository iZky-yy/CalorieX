import 'package:flutter/material.dart';
import 'package:caloriex_app/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CalorieX',
      // Gunakan Poppins jika sudah kamu install di pubspec.yaml
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
      home: const ProfilePage(),
    );
  }
}