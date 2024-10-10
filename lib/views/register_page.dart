import 'package:flutter/material.dart';
import 'package:pagination/components/custom_button.dart';
import 'package:pagination/components/custom_input.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          children: [
            const Text(
              "Register",
              style: TextStyle(fontSize: 24),
            ),
            CustomInput(
              labelText: "Name",
              icon: const Icon(Icons.person),
            ),
            CustomInput(
              labelText: "Phone",
              icon: const Icon(Icons.phone_android),
            ),
            CustomInput(
              labelText: "Email",
              icon: const Icon(Icons.email),
            ),
            CustomInput(
              labelText: "Password",
              icon: const Icon(Icons.visibility),
            ),
            CustomInput(
              labelText: "Repite Password",
              icon: const Icon(Icons.visibility),
            ),
            CustomButton(titleButton: "Register")
          ],
        ),
      ),
    );
  }
}
