import 'package:flutter/material.dart';
import 'components/login_body.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // جعل خلفية شريط التطبيق بيضاء
        elevation: 0, // إزالة الظل لجعلها متناسقة مع الخلفية
        iconTheme: IconThemeData(color: Colors.black), // لون الأيقونات
        titleTextStyle: TextStyle(
          color: Colors.black, // لون النص
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white, // خلفية الجسم بيضاء
      body: LoginBody(),
    );
  }
}