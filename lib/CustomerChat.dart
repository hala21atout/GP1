import 'package:flutter/material.dart';
import 'home_page.dart';
import 'CustomerCommunity.dart';
import 'CustomerProfile.dart';

class CustomerChat extends StatefulWidget {
  const CustomerChat({super.key});

  @override
  _CustomerChatState createState() => _CustomerChatState();
}

class _CustomerChatState extends State<CustomerChat>
    with TickerProviderStateMixin {
  String _selectedBottomMenu = "Chat";

  void _selectBottomMenu(String menuItem) {
    setState(() {
      _selectedBottomMenu = menuItem;
      if (menuItem == "Home") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
      if (menuItem == "Community") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CustomerCommunity()),
        );
      }
      if (menuItem == "Profile") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CustomerProfile()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: const Color(0xFFE8C3BA),
          elevation: 0,
          automaticallyImplyLeading: false, // هذا لإيقاف الأيقونة الافتراضية
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 70.0, left: 5.0),
            child: Row(
              children: [
                // زر الرجوع
                IconButton(
                  // ignore: prefer_const_constructors
                  icon: Icon(Icons.arrow_back, size: 30, color: Colors.black38),
                  onPressed: () {
                    Navigator.pop(context); // العودة إلى الصفحة السابقة
                  },
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ),
      ),
      body: GestureDetector(
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(child: Container()),
                  _buildBottomMenu(),
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
                          blurRadius: 6)
                    ]
                  : [],
            ),
            child: Icon(icon,
                size: 30,
                color: isSelected ? const Color(0xFFE8C3BA) : Colors.white),
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
}
