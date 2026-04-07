import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login_page.dart';
import 'sign_up_page.dart'; // or your first screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(); // 👈 THIS IS THE FIX

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}