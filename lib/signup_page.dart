import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(color: Colors.black.withOpacity(0.7)),

          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Create your account",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

                const SizedBox(height: 30),

                _field("Full Name"),
                const SizedBox(height: 15),
                _field("Email"),
                const SizedBox(height: 15),
                _field("Password", isPass: true),
                const SizedBox(height: 15),
                _field("Re-enter Password", isPass: true),

                const SizedBox(height: 25),

                _button("SIGN UP"),

                const SizedBox(height: 20),

                const Text(
                  "Already have an account? Log in",
                  style: TextStyle(color: Colors.greenAccent),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _field(String hint, {bool isPass = false}) {
    return TextField(
      obscureText: isPass,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  Widget _button(String text) {
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
        child: Text(text,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );
  }
}