import 'package:flutter/material.dart';
import 'package:m2_lesson9/screens/home/anim_page.dart';
import 'package:m2_lesson9/screens/home/login_page.dart';
import 'package:m2_lesson9/screens/home/splash_page.dart';
import 'package:m2_lesson9/screens/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
     // home: MainPage(),
      home: AnimPage(),
    );
  }
}
