import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final String hint;
  final IconData icon;
  final bool isPassword;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.icon,
    required this.controller,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {

    return TextField(
      controller: controller,
      obscureText: isPassword,

      style: const TextStyle(
        color: Colors.white,
      ),

      decoration: InputDecoration(

        prefixIcon: Icon(
          icon,
          color: Colors.white70,
        ),

        hintText: hint,

        hintStyle: const TextStyle(
          color: Colors.white54,
        ),

        filled: true,

        fillColor: Colors.white10,

        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(15),

          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}