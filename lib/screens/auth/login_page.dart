import 'package:flutter/material.dart';
import 'signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Dark Overlay
          Container(
            color: Colors.black.withOpacity(0.7),
          ),

          /// Content
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Logo
                Column(
                  children: const [
                    Icon(Icons.restaurant, color: Colors.greenAccent, size: 60),
                    SizedBox(height: 10),
                    Text(
                      "CalorieX",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Control your calories\nUnlock your X",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                /// Input Email
                _buildTextField("Username or Email", Icons.person),

                const SizedBox(height: 15),

                /// Password
                _buildTextField("Password", Icons.lock, isPassword: true),

                const SizedBox(height: 10),

                /// Remember + Forgot
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Row(
                      children: [
                        Icon(Icons.check_box, size: 18, color: Colors.greenAccent),
                        SizedBox(width: 5),
                        Text("Remember me"),
                      ],
                    ),
                    Text("Forgot password?", style: TextStyle(color: Colors.greenAccent))
                  ],
                ),

                const SizedBox(height: 20),

                /// Login Button
                _buildButton("LOG IN"),

                const SizedBox(height: 20),

                /// Social Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.g_mobiledata, size: 40),
                    SizedBox(width: 10),
                    Icon(Icons.apple, size: 30),
                    SizedBox(width: 10),
                    Icon(Icons.facebook, size: 30),
                  ],
                ),

                const SizedBox(height: 20),

                /// Footer Text
                const Text(
                  "Track your meals. Plan your workouts.\nBecome your best version.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white60),
                ),

                const SizedBox(height: 20),

                /// Go to Signup
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignupPage()),
                    );
                  },
                  child: const Text(
                    "Don't have an account? SIGN UP",
                    style: TextStyle(color: Colors.greenAccent),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// TextField Style
  Widget _buildTextField(String hint, IconData icon,
      {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  /// Button Style
  Widget _buildButton(String text) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.greenAccent, Colors.green],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 15),
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}