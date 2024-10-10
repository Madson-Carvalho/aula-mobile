import 'package:flutter/material.dart';
import 'package:pagination/services/auth_service.dart';
import 'package:pagination/views/home_page.dart';

class CustomButton extends StatelessWidget {
  String titleButton;

  CustomButton({super.key, required this.titleButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          try {
            await FirebaseAuthService().login();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ));
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Usuário ou senha incorreta seu burro..."),
            ));
          }
        },
        child: Text(titleButton),
      ),
    );
  }
}
