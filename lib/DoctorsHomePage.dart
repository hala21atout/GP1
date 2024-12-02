import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'CustomerCommunity.dart'; // إضافة الاستيراد لصفحة الكومينتي
import 'CustomerProfile.dart'; // إضافة الاستيراد لصفحة الكومينتي
import 'CustomerChat.dart'; // إضافة الاستيراد لصفحة الكومينتي
import 'WhatIsDrGlowyPage.dart';
import 'PrivacyInfoPage.dart';
import 'FeedbackRatingPage.dart';
import 'DoctorsPage.dart';
import 'screens/LoginScreen/login.dart';

class DoctorsHomePage extends StatefulWidget {
  const DoctorsHomePage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<DoctorsHomePage>
    with TickerProviderStateMixin {
  bool _isMenuVisible = false;
  int _selectedIconIndex = -1; // -1 means no icon is selected
  late AnimationController _controller;
  late Animation<double> _textAnimation;
  String _selectedBottomMenu = "Home"; // Default selected menu item
  bool _isNotificationsVisible = false; // لتحديد ظهور خانة الإشعارات

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _textAnimation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    setState(() {
      _isMenuVisible = !_isMenuVisible;
    });
  }

  void _toggleNotifications() {
    setState(() {
      _isNotificationsVisible = !_isNotificationsVisible;
    });
  }

  void _handleIconTap(int iconIndex) {
    setState(() {
      if (iconIndex == 1) {
        // إذا كانت أيقونة الإشعارات
        _toggleNotifications();
      } else {
        _selectedIconIndex = _selectedIconIndex == iconIndex ? -1 : iconIndex;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(70), // Increase the height of the AppBar
        child: AppBar(
          backgroundColor: const Color(0xFFE8C3BA),
          elevation: 0,
          automaticallyImplyLeading:
              false, // Remove the default leading behavior
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(
                top: 30.0, left: 5.0), // Adjust the padding
            child: Align(
              alignment: Alignment.topLeft, // Position it to the left
              child: SizedBox(
                width: 100, // Set the exact width for the logo
                height: 100, // Set the exact height for the logo
                child: Image.asset(
                  'assets/logo1.png',
                  fit: BoxFit
                      .contain, // Ensure the image scales without stretching
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                FontAwesomeIcons.bell,
                size: 30,
                color: _selectedIconIndex == 1 ? Colors.white : Colors.black38,
              ),
              onPressed: () {
                _handleIconTap(1);
              },
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
          // Reset icons and menu state when clicking in the middle
          setState(() {
            _selectedIconIndex = -1;
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 125),
                  _buildButtonWithAnimation("Makeup",
                      imagePath: "assets/makeup.jpg"),
                  const SizedBox(height: 50),
                  _buildButtonWithAnimation("Skin Care",
                      imagePath: "assets/skincare.jpg"),
                  const SizedBox(height: 50),
                  _buildButtonWithAnimation("Scheduling",
                      imagePath: "assets/scheduling.png"),
                  Expanded(child: Container()),
                  _buildBottomMenu(),
                ],
              ),
            ),
            if (_isNotificationsVisible)
              Align(
                alignment: Alignment.topRight,
                child: _buildNotificationsPanel(),
              ),
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
                      const SizedBox(
                          height:
                              30), // Reduced the height here to move "Menu" upwards
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
                      _buildMenuItem("Privacy Info"),
                      _buildMenuItem("Rating & Feedback"),
                      _buildMenuItem("Log Out"),

                      const Padding(
                        padding: EdgeInsets.only(top: 436.0),
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
                            _buildSocialIcon(FontAwesomeIcons.instagram),
                            const SizedBox(width: 20),
                            _buildSocialIcon(FontAwesomeIcons.facebook),
                            const SizedBox(width: 20),
                            _buildSocialIcon(FontAwesomeIcons.twitter),
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

  Widget _buildButtonWithAnimation(String text, {String? imagePath}) {
    return GestureDetector(
      onTap: () {
        if (text == "Makeup") {
        } else if (text == "Skin Care") {
        } else if (text == "Doctors") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const DoctorsPage()), // الانتقال لصفحة Doctors
          );
        }
      },
      child: SizedBox(
        width: 320,
        height: 100,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: imagePath != null
                    ? DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      )
                    : null,
                borderRadius: BorderRadius.circular(12),
              ),
              foregroundDecoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, _textAnimation.value),
                        child: Text(
                          text,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.arrow_forward,
                      color: Colors.white, size: 26),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomMenu() {
    return Container(
      color: const Color(0xFFE8C3BA), // Changed to the new color
      padding:
          const EdgeInsets.symmetric(vertical: 8), // Reduced vertical padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildBottomIcon(Icons.home, "Home",
              isSelected: _selectedBottomMenu == "Home"),
          _buildBottomIcon(Icons.people, "Community",
              isSelected: _selectedBottomMenu == "Community"),
          _buildBottomIcon(Icons.chat_bubble, "Chat",
              isSelected: _selectedBottomMenu == "Chat"),
          _buildBottomIcon(Icons.person, "Profile",
              isSelected: _selectedBottomMenu == "Profile"),
        ],
      ),
    );
  }

  Widget _buildBottomIcon(IconData icon, String label,
      {required bool isSelected}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedBottomMenu = label;
          if (_selectedBottomMenu == "Community") {
            // الانتقال إلى صفحة الكومينتي عند الضغط على زر "Community"
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CustomerCommunity()),
            );
          } else if (_selectedBottomMenu == "Chat") {
            // الانتقال إلى صفحة الشات عند الضغط على زر "Chat"
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CustomerChat()),
            );
          } else if (_selectedBottomMenu == "Profile") {
            // الانتقال إلى صفحة البروفايل عند الضغط على زر "Profile"
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CustomerProfile()),
            );
          }
        });
      },
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
              fontSize: 16, // Increased font size for better visibility
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
                  builder: (context) =>
                      const WhatIsDrGlowyPage()), // تأكد من تعريف الصفحة
            );
          }
          if (text == "Privacy Info") {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const PrivacyInfoPage()), // تأكد من تعريف الصفحة
            );
          }
          if (text == "Rating & Feedback") {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const FeedbackRatingPage()), // تأكد من تعريف الصفحة
            );
          }
          if (text == "Log Out") {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Login()), // تأكد من تعريف الصفحة
            );
          }
        },
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black38),
        ),
      ),
    );
  }

  Widget _buildNotificationsPanel() {
    final List<Map<String, String>> notifications = [
      {
        "type": "like",
        "message": "John liked your post.",
      },
      {
        "type": "comment",
        "message": "Emily commented on your post: 'Nice one!'",
      },
      {
        "type": "chat",
        "message": "You have a new chat from Dr.laila.",
      },
    ];

    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 239, 239, 239), // لون أغمق قليلاً
        border: Border.all(
          color: Colors.black38, // لون الحافة
          width: 1, // سماكة الحافة
        ),
        borderRadius: BorderRadius.circular(8), // زوايا دائرية
      ),
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            "Notifications",
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black38),
          ),
          const SizedBox(height: 10),
          // عرض الإشعارات الديناميكية
          ...notifications.map((notification) {
            IconData icon;
            switch (notification["type"]) {
              case "like":
                icon = Icons.thumb_up;
                break;
              case "comment":
                icon = Icons.comment;
                break;
              case "reminder":
                icon = Icons.calendar_today;
                break;
              case "chat":
                icon = Icons.mail;
                break;
              default:
                icon = Icons.notification_important;
            }
            return ListTile(
              leading: Icon(icon, color: Colors.black38),
              title: Text(notification["message"] ?? ""),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Icon(
      icon,
      size: 40,
      color: Colors.black38,
    );
  }
}
