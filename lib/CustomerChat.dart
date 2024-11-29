import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_page.dart'; // تأكد من أنك قد أضفت هذه الصفحة في مشروعك
import 'CustomerCommunity.dart'; // إضافة الاستيراد لصفحة الكومينتي
import 'CustomerProfile.dart';
import 'WhatIsDrGlowyPage.dart';
import 'PrivacyInfoPage.dart';
import 'PaymentInformationPage.dart';
import 'FeedbackRatingPage.dart';

class CustomerChat extends StatefulWidget {
  const CustomerChat({super.key});

  @override
  _CustomerChatState createState() => _CustomerChatState();
}

class _CustomerChatState extends State<CustomerChat> with TickerProviderStateMixin {
  bool _isMenuVisible = false;
  int _selectedIconIndex = -1; // -1 means no icon is selected
  String _selectedBottomMenu = "Chat"; // Default selected menu item is "Chat"

  // Toggle the side menu visibility
  void _toggleMenu() {
    setState(() {
      _isMenuVisible = !_isMenuVisible;
    });
  }

  // Handle icon taps in the AppBar
  void _handleIconTap(int iconIndex) {
    setState(() {
      _selectedIconIndex = _selectedIconIndex == iconIndex ? -1 : iconIndex;
    });
  }

  // Select a bottom menu item
  void _selectBottomMenu(String menuItem) {
    setState(() {
      _selectedBottomMenu = menuItem;
      // Navigate to "Home" page when "Home" is selected
      if (menuItem == "Home") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()), // تأكد من أن HomePage موجودة
        );
      }
      // Navigate to "Community" page when "Community" is selected
      if (menuItem == "Community") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CustomerCommunity()), // تأكد من أن CustomerCommunity موجودة
        );
      }
      // Navigate to "Profile" page when "Profile" is selected
      if (menuItem == "Profile") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CustomerProfile()), // تأكد من أن CustomerProfile موجودة
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70), // Set AppBar height
        child: AppBar(
          backgroundColor: const Color(0xFFE8C3BA),
          elevation: 0,
          automaticallyImplyLeading: false, // Remove default leading icon
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 5.0), // Adjust logo padding
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: 100, // Logo width
                height: 100, // Logo height
                child: Image.asset(
                  'assets/logo1.png',
                  fit: BoxFit.contain, // Ensure the logo scales properly
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                FontAwesomeIcons.shoppingCart,
                size: 28,
                color: _selectedIconIndex == 0 ? Colors.white : Colors.black38,
              ),
              onPressed: () => _handleIconTap(0),
              padding: const EdgeInsets.only(top: 20.0),
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.bell,
                size: 30,
                color: _selectedIconIndex == 1 ? Colors.white : Colors.black38,
              ),
              onPressed: () => _handleIconTap(1),
              padding: const EdgeInsets.only(top: 20.0),
            ),
            IconButton(
              icon: Icon(
                Icons.menu,
                size: 35,
                color: _selectedIconIndex == 2 ? Colors.white : Colors.black38,
              ),
              onPressed: () {
                _handleIconTap(2);
                _toggleMenu();
              },
              padding: const EdgeInsets.only(top: 20.0),
            ),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIconIndex = -1; // Reset icons when tapping outside
            if (_isMenuVisible) {
              _toggleMenu();
            }
          });
        },
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(child: Container()), // Empty space in the center
                  _buildBottomMenu(), // Bottom navigation menu
                ],
              ),
            ),
            // Side menu visibility check
            if (_isMenuVisible)
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Menu",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black38),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildMenuItem("Dr. Glowy"),
                      _buildMenuItem("Payment Information"),
                      _buildMenuItem("Privacy Info"),
                      _buildMenuItem("Rating & Feedback"),
                      const Padding(
                        padding: EdgeInsets.only(top: 435.0),
                        child: Divider(
                          thickness: 1,
                          color: Colors.black38,
                        ),
                      ),
                      Expanded(child: Container()),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildSocialIcon(FontAwesomeIcons.instagram, 'https://www.instagram.com/yourprofile'),
                            const SizedBox(width: 20),
                            _buildSocialIcon(FontAwesomeIcons.facebook, 'https://www.facebook.com/yourprofile'), // رابط الفيسبوك
                            const SizedBox(width: 20),
                            _buildSocialIcon(FontAwesomeIcons.twitter, 'https://www.twitter.com/yourprofile'),
                          ],
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

  // Build the bottom navigation menu
  Widget _buildBottomMenu() {
    return Container(
      color: const Color(0xFFE8C3BA),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildBottomIcon(Icons.home, "Home",
              isSelected: _selectedBottomMenu == "Home"),
          _buildBottomIcon(Icons.people, "Community",
              isSelected: _selectedBottomMenu == "Community"),
          _buildBottomIcon(Icons.camera_alt, "Camera",
              isSelected: _selectedBottomMenu == "Camera"),
          _buildBottomIcon(Icons.chat_bubble, "Chat",
              isSelected: _selectedBottomMenu == "Chat"),
          _buildBottomIcon(Icons.person, "Profile",
              isSelected: _selectedBottomMenu == "Profile"),
        ],
      ),
    );
  }

  // Create a single bottom menu item with icon and label
  Widget _buildBottomIcon(IconData icon, String label,
      {required bool isSelected}) {
    return GestureDetector(
      onTap: () => _selectBottomMenu(label),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : const Color(0xFFE8C3BA),
              borderRadius: BorderRadius.circular(12),
              boxShadow: isSelected
                  ? [
                      const BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4),
                        blurRadius: 6,
                      )
                    ]
                  : [],
            ),
            child: Icon(
              icon,
              size: 30,
              color: isSelected ? const Color(0xFFE8C3BA) : Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? const Color(0xFFE8C3BA) : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  // Create a menu item for the side menu
  Widget _buildMenuItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          if (text == "Dr. Glowy") {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const WhatIsDrGlowyPage()), // تأكد من تعريف الصفحة
            );
          }

          if (text == "Privacy Info") {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const PrivacyInfoPage()), // تأكد من تعريف الصفحة
            );
          }

          if (text == "Payment Information") {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const PaymentInformationPage()), // تأكد من تعريف الصفحة
            );
          }

          if (text == "Rating & Feedback") {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const FeedbackRatingPage()), // تأكد من تعريف الصفحة
            );
          }
        },
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black38,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // Create social media icon in the side menu
  Widget _buildSocialIcon(IconData icon, String url) {
    return IconButton(
      icon: Icon(
        icon,
        size: 40,
        color: Colors.black38,
      ), onPressed: () {  },
    );
  }


}
