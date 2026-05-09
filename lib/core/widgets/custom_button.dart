import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      width: double.infinity,

      decoration: BoxDecoration(

        gradient: const LinearGradient(
          colors: [
            Colors.greenAccent,
            Colors.green,
          ],
        ),

        borderRadius:
            BorderRadius.circular(15),
      ),

      child: MaterialButton(

        padding:
            const EdgeInsets.symmetric(
          vertical: 15,
        ),

        onPressed: onPressed,

        child: Text(
          text,

          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}