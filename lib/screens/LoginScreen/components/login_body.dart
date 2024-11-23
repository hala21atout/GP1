import 'package:flutter/material.dart';

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  // متغير لحفظ حالة إخفاء النص
  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // تعيين خلفية بيضاء
      child: SingleChildScrollView(
        child: Column(
          children: [
            // "Welcome Back" Text
            SizedBox(height: 20),
            Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Hi, good to see you again',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(236, 172, 164, 1),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10), // Space between text and logo

            // Display Logo Image
            Image.asset(
              'assets/logo1.png',
              width: 250, // تعديل العرض
              height: 250, // تعديل الارتفاع
            ),
            SizedBox(height: 10), // Space after logo

            // Email Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Password Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: TextFormField(
                obscureText: _isPasswordHidden, // استخدام حالة الإخفاء
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordHidden
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordHidden = !_isPasswordHidden; // تبديل الحالة
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Login Button with increased size
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Color.fromRGBO(236, 172, 164, 1),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  // Handle login button press
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            // Forgot Password Button (Color changed to black)
            TextButton(
              onPressed: () {
                // Handle forgot password button press
              },
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.black, // لون النص الأسود
                ),
              ),
            ),
            SizedBox(height: 10),

            // Sign Up Button with custom color for 'Sign Up'
            TextButton(
              onPressed: () {
                // Handle sign up button press
              },
              child: Text.rich(
                TextSpan(
                  text: 'Don\'t have an account? ',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        color: Color.fromRGBO(236, 172, 164, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
