import 'package:flutter/material.dart';
import 'home_page.dart'; // استيراد صفحة الهوم

class PaymentSuccessfully extends StatelessWidget {
  const PaymentSuccessfully({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE8C3BA),
        toolbarHeight: 70,
        centerTitle: true,
        title: const Text(
          'Payment Status',
          style: TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 210),
            // أيقونة النجاح
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 120,
            ),
            const SizedBox(height: 20),
            // رسالة النجاح
            const Text(
              'Payment Successfully!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Thank you for your payment.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 50),
            // زر العودة إلى الصفحة الرئيسية
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(), // استدعاء صفحة الهوم
                  ),
                  (Route<dynamic> route) => false, // إزالة الصفحات السابقة
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE8C3BA),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Back to Home',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
