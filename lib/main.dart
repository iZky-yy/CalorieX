import 'package:flutter/material.dart';

import 'screens/auth/login_page.dart';
import 'screens/home/home_screen.dart';

import 'services/shared_pref_service.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final token =
      await SharedPrefService.getToken();

  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {

  final String? token;

  const MyApp({
    super.key,
    this.token,
  });

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: token != null
          ? const HomeScreen()
          : const LoginPage(),
    );
  }
}