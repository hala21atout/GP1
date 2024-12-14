import 'package:flutter/material.dart';
import 'package:gp1/screens/LoginScreen/login.dart'; // Ensure this import path is correct

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  void _handleForgotPassword(BuildContext context) {
    // Handle forgot password logic here (e.g., sending email)
    final email = emailController.text;
    if (email.isNotEmpty) {
      // Check if email exists in the system
      // If it does, send reset password link to the email
      // Simulate sending an email
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password reset link sent to $email')),
      );
      // Navigate to the login page after sending the link
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => Login(), // استدعاء صفحة الهوم
        ),
        (Route<dynamic> route) => false, // إزالة الصفحات السابقة
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE8C3BA),
        title: const Text(
          'Forgot Password',
          style: TextStyle(color: Colors.black38),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Enter your email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _handleForgotPassword(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE8C3BA),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Send Reset Link',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Please ensure you are signed in first. After confirmation, please check your email.',
              style: TextStyle(
                color: Colors.black38,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
