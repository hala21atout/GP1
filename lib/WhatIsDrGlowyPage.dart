import 'package:flutter/material.dart';

class WhatIsDrGlowyPage extends StatelessWidget {
  const WhatIsDrGlowyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dr. Glowy",
          style: TextStyle(
              fontSize: 26,
              color: Colors.black87, // Text color
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFE8C3BA),
        toolbarHeight: 70, // Increase AppBar height
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0), // Add padding for better layout
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align content to the left
              children: [
                Text(
                  "What Is Dr Glowy ? ", // Title text
                  style: TextStyle(
                    fontSize: 30, // Increase font size
                    fontWeight: FontWeight.bold, // Make the text bold
                    color: Colors.black87, // Text color
                  ),
                  textAlign: TextAlign.left, // Align the title to the left
                ),
                Text(
                  "\n\t Dr. Glowy is a comprehensive platform designed to enhance skincare and beauty experiences by connecting customers with doctors and companies seamlessly. The application provides a variety of features tailored to meet the needs of all users:\n",
                  style: TextStyle(
                    fontSize: 18, // Adjust font size for body text
                    color: Colors.black87,
                    height: 1.5, // Line height for readability
                  ),
                  textAlign: TextAlign.left, // Justify the body text
                ),
                Text(
                  "For Customers:",
                  style: TextStyle(
                    fontSize: 20, // Adjust font size for body text
                    color: Colors.black87,
                    height: 1.5, // Line height for readability
                  ),
                  textAlign: TextAlign.left, // Justify the body text
                ),
                Text(
                  "\t - Purchase a wide range of makeup and skincare products.\n"
                  "\t - Book appointments with certified doctors specialized in skincare.\n"
                  "\t - Chat directly with doctors and product companies for personalized advice.\n"
                  "\t - Upload facial images to receive customized skincare recommendations using advanced image processing technologies.\n",
                  style: TextStyle(
                    fontSize: 18, // Adjust font size for body text
                    color: Colors.black87,
                    height: 1.5, // Line height for readability
                  ),
                  textAlign: TextAlign.left, // Justify the body text
                ),
                Text(
                  "For Doctors:",
                  style: TextStyle(
                    fontSize: 20, // Adjust font size for body text
                    color: Colors.black87,
                    height: 1.5, // Line height for readability
                  ),
                  textAlign: TextAlign.left, // Justify the body text
                ),
                Text(
                  "\t - Communicate with customers to offer consultations and advice.\n"
                  "\t - Manage appointments efficiently within the app.\n",
                  style: TextStyle(
                    fontSize: 18, // Adjust font size for body text
                    color: Colors.black87,
                    height: 1.5, // Line height for readability
                  ),
                  textAlign: TextAlign.left, // Justify the body text
                ),
                Text(
                  "For Companies:",
                  style: TextStyle(
                    fontSize: 20, // Adjust font size for body text
                    color: Colors.black87,
                    height: 1.5, // Line height for readability
                  ),
                  textAlign: TextAlign.left, // Justify the body text
                ),
                Text(
                  "\t - Showcase and sell products directly to customers.\n"
                  "\t - Interact with both customers and doctors for product feedback and marketing.\n"
                  "\n Dr. Glowy brings together cutting-edge technology and personalized care to ensure an unparalleled experience for everyone.",
                  style: TextStyle(
                    fontSize: 18, // Adjust font size for body text
                    color: Colors.black87,
                    height: 1.5, // Line height for readability
                  ),
                  textAlign: TextAlign.left, // Justify the body text
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
