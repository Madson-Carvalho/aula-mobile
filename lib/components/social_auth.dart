import 'package:flutter/material.dart';

class SocialAuth extends StatelessWidget {
  String imgLink;

  SocialAuth({super.key, required this.imgLink});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.network(imgLink),
    );
  }
}
