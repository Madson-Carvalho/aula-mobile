import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  String labelText;
  bool obscure;
  Widget icon;

  CustomInput(
      {super.key, required this.labelText, this.obscure = false, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
            suffixIcon: icon,
            border: const OutlineInputBorder(),
            labelText: labelText
        ),
      ),
    );
  }
}
