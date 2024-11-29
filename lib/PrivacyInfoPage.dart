import 'package:flutter/material.dart';

class PrivacyInfoPage extends StatelessWidget {
  const PrivacyInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Privacy Info",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFE8C3BA),
        toolbarHeight: 70, // Increase AppBar height
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0), // Add padding for better layout
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
              children: [
                Text(
                  "Privacy Policy\n",
                  style: TextStyle(
                    fontSize: 30, // Title font size
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  "At Dr. Glowy, we prioritize your privacy and are committed to protecting your personal information. Below is a detailed explanation of how we collect, use, and protect your data.\n",
                  style: TextStyle(
                    fontSize: 18, // Body text font size
                    color: Colors.black87,
                    height: 1.5, // Line height for readability
                  ),
                  textAlign: TextAlign.left,
                ),
                
                Text(
                  "1. Data Collection:\n",
                  style: TextStyle(
                    fontSize: 20, // Subtitle font size
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  "We collect personal information such as your name, email address, and contact details when you sign up or use our services. Additionally, we collect information related to your skin care preferences, images for analysis, and other usage data from your interactions with the app.\n",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.left,
                ),
                
                Text(
                  "2. Use of Data:\n",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  "The information we collect is used to provide personalized skincare recommendations, facilitate communication between customers, doctors, and companies, and improve our services. We may also use your data to notify you of new products, updates, and special offers related to your interests.\n",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.left,
                ),
                
                Text(
                  "3. Data Protection:\n",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  "We take security seriously and implement measures to protect your personal data. This includes encrypting sensitive data and restricting access to authorized personnel only. However, please note that no method of transmission over the internet is 100% secure, and we cannot guarantee absolute security.\n",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.left,
                ),
                
                Text(
                  "4. Third-Party Sharing:\n",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  "We do not share your personal information with third parties except where necessary to provide our services (such as payment processing or communications). We ensure that any third-party service providers follow strict privacy standards.\n",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.left,
                ),
                
                Text(
                  "5. Your Rights:\n",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  "You have the right to access, update, or delete your personal information at any time. If you have any concerns about how we handle your data, please contact us directly.\n",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.left,
                ),
                
                Text(
                  "6. Changes to This Policy:\n",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  "We may update this Privacy Policy from time to time. Any changes will be posted on this page with the updated date. Please review this page periodically to stay informed.\n",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.left,
                ),
                
                Text(
                  "By using Dr. Glowy, you agree to the terms outlined in this Privacy Policy. If you have any questions or concerns, please don't hesitate to contact us.\n",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
