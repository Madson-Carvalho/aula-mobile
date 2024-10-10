import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Map user;

  const DetailPage({super.key, required this.user});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user["firstName"]),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Back to Homepage."),
        ),
      ),
    );
  }
}
