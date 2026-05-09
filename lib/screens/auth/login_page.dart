import 'package:flutter/material.dart';

import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../../../services/auth_service.dart';
import '../home/home_screen.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() =>
      _LoginPageState();
}

class _LoginPageState
    extends State<LoginPage> {

  final emailController =
      TextEditingController();

  final passwordController =
      TextEditingController();

  bool _isLoading = false;

  final _authService = AuthService();

  Future<void> _handleLogin() async {

    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email dan password tidak boleh kosong'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final result = await _authService.login(
        emailController.text.trim(),
        passwordController.text,
      );

      if (!mounted) return;

      if (result['status'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login berhasil!'),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const HomeScreen(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              result['message'] ?? 'Login gagal',
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Stack(
        children: [

          // background
          Container(
            decoration:
                const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/bg.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // overlay
          Container(
            color:
                Colors.black.withOpacity(0.7),
          ),

          // content
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.all(24),

              child: SingleChildScrollView(
                child: Column(

                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: [

                    const SizedBox(height: 80),

                    // logo
                    const Icon(
                      Icons.restaurant,
                      color: Colors.greenAccent,
                      size: 60,
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "CalorieX",

                      style: TextStyle(
                        fontSize: 30,
                        fontWeight:
                            FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Control your calories\nUnlock your X",

                      textAlign:
                          TextAlign.center,

                      style: TextStyle(
                        color:
                            Colors.white70,
                      ),
                    ),

                    const SizedBox(height: 40),

                    // email
                    CustomTextField(
                      hint:
                          "Username or Email",

                      icon: Icons.person,

                      controller:
                          emailController,
                    ),

                    const SizedBox(height: 15),

                    // password
                    CustomTextField(
                      hint: "Password",

                      icon: Icons.lock,

                      isPassword: true,

                      controller:
                          passwordController,
                    ),

                    const SizedBox(height: 10),

                    // remember
                    const Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,

                      children: [

                        Row(
                          children: [

                            Icon(
                              Icons.check_box,

                              size: 18,

                              color:
                                  Colors.greenAccent,
                            ),

                            SizedBox(width: 5),

                            Text(
                              "Remember me",

                              style: TextStyle(
                                color:
                                    Colors.white,
                              ),
                            ),
                          ],
                        ),

                        Text(
                          "Forgot password?",

                          style: TextStyle(
                            color:
                                Colors.greenAccent,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // login button
                    _isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.greenAccent,
                          )
                        : CustomButton(
                            text: "LOG IN",
                            onPressed: _handleLogin,
                          ),

                    const SizedBox(height: 20),

                    // social
                    const Row(

                      mainAxisAlignment:
                          MainAxisAlignment
                              .center,

                      children: [

                        Icon(
                          Icons.g_mobiledata,

                          size: 40,

                          color: Colors.white,
                        ),

                        SizedBox(width: 10),

                        Icon(
                          Icons.apple,

                          size: 30,

                          color: Colors.white,
                        ),

                        SizedBox(width: 10),

                        Icon(
                          Icons.facebook,

                          size: 30,

                          color: Colors.white,
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Track your meals. Plan your workouts.\nBecome your best version.",

                      textAlign:
                          TextAlign.center,

                      style: TextStyle(
                        color:
                            Colors.white60,
                      ),
                    ),

                    const SizedBox(height: 20),

                    GestureDetector(

                      onTap: () {

                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) =>
                                const SignupPage(),
                          ),
                        );
                      },

                      child: const Text(
                        "Don't have an account? SIGN UP",

                        style: TextStyle(
                          color:
                              Colors.greenAccent,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
