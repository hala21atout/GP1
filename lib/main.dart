import 'package:flutter/material.dart';
import 'screens/LoginScreen/login.dart';
import 'screens/SigninScreen/signin.dart';
import 'CustomerCommunity.dart';
import 'home_page.dart';
import 'welcome_page.dart';
import 'home_page.dart';
import 'CustomerProfile.dart';
import 'MakeupPage.dart';
import 'ShoppingcartPage.dart';
import 'DoctorsPage.dart';
import 'DoctorsHomePage.dart';
import 'DoctorProfilePage.dart';
import 'DoctorMedicalLibraryPage.dart';
import 'DoctorSchedulingPage.dart';
import 'DoctorChatPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DoctorsHomePage(),
    );
  }
}
