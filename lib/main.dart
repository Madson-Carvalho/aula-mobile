import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pagination/firebase_options.dart';
import 'package:pagination/views/feedback_page.dart';
import 'package:pagination/views/home_page.dart';
import 'package:pagination/views/login_page.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.raleway().fontFamily,
        useMaterial3: false,
      ),
      // home: const HomePage(),
      // home: const LoginPage(),
      home: FeedbackPage(),
    ),
  );
}
