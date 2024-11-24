import 'package:flutter/material.dart';
import 'package:gp1/home_page.dart';
import 'package:gp1/screens/LoginScreen/login.dart';
import 'package:gp1/screens/SigninScreen/signin.dart';
import 'package:gp1/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DR Glowy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomePage(), // تحديد صفحة الترحيب كصفحة رئيسية
    );
  }
}