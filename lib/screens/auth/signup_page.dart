import 'package:flutter/material.dart';

import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../../../services/auth_service.dart';

class SignupPage extends StatefulWidget {

  const SignupPage({super.key});

  @override
  State<SignupPage> createState() =>
      _SignupPageState();
}

class _SignupPageState
    extends State<SignupPage> {

  final nameController =
      TextEditingController();

  final emailController =
      TextEditingController();

  final passwordController =
      TextEditingController();

  final confirmController =
      TextEditingController();

  bool _isLoading = false;

  final _authService = AuthService();

  Future<void> _handleRegister() async {

    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Semua field harus diisi'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (passwordController.text !=
        confirmController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password tidak cocok'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final result = await _authService.register(
        nameController.text.trim(),
        emailController.text.trim(),
        passwordController.text,
      );

      if (!mounted) return;

      if (result['status'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registrasi berhasil! Silakan login.'),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.pop(context); // kembali ke login
      } else {
        final msg = result['message'];
        final errorText = msg is Map
            ? msg.values.first.toString()
            : msg.toString();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorText),
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

          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.all(24),

              child: SingleChildScrollView(
                child: Column(

                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: [

                    const SizedBox(height: 100),

                    const Text(
                      "Create your account",

                      style: TextStyle(
                        fontSize: 24,
                        fontWeight:
                            FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 30),

                    CustomTextField(
                      hint: "Full Name",

                      icon: Icons.person,

                      controller:
                          nameController,
                    ),

                    const SizedBox(height: 15),

                    CustomTextField(
                      hint: "Email",

                      icon: Icons.email,

                      controller:
                          emailController,
                    ),

                    const SizedBox(height: 15),

                    CustomTextField(
                      hint: "Password",

                      icon: Icons.lock,

                      isPassword: true,

                      controller:
                          passwordController,
                    ),

                    const SizedBox(height: 15),

                    CustomTextField(
                      hint:
                          "Re-enter Password",

                      icon: Icons.lock,

                      isPassword: true,

                      controller:
                          confirmController,
                    ),

                    const SizedBox(height: 25),

                    _isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.greenAccent,
                          )
                        : CustomButton(
                            text: "SIGN UP",
                            onPressed: _handleRegister,
                          ),

                    const SizedBox(height: 20),

                    GestureDetector(

                      onTap: () {

                        Navigator.pop(
                          context,
                        );
                      },

                      child: const Text(
                        "Already have an account? Log in",

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
