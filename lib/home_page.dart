import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool _isMenuVisible = false;
  int _selectedIconIndex = -1; // -1 means no icon is selected
  late AnimationController _controller;
  late Animation<double> _textAnimation;
  String _selectedMenuItem = "";
  String _selectedBottomMenu = "Home"; // Default selected menu item

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

  void _handleIconTap(int iconIndex) {
    setState(() {
      if (_selectedIconIndex == iconIndex) {
        _selectedIconIndex = -1; // Reset if the same icon is tapped again
      } else {
        _selectedIconIndex = iconIndex; // Select the tapped icon
      }
    });
  }

  void _selectBottomMenu(String menuItem) {
    setState(() {
      _selectedBottomMenu = menuItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80), // Increase the height of the AppBar
        child: AppBar(
          backgroundColor: const Color(0xFFE8C3BA),
          elevation: 0,
          automaticallyImplyLeading: false, // Remove the default leading behavior
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 5.0), // Adjust the padding
            child: Align(
              alignment: Alignment.topLeft, // Position it to the left
              child: SizedBox(
                width: 80, // Set the exact width for the logo
                height: 80, // Set the exact height for the logo
                child: Image.asset(
                  'assets/logo1.png',
                  fit: BoxFit.contain, // Ensure the image scales without stretching
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
              onPressed: () {
                _handleIconTap(0);
              },
              padding: const EdgeInsets.only(top: 20.0),
            ),
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
                  _buildAnimatedButton("Makeup", imagePath: "assets/makeup.jpg"),
                  const SizedBox(height: 50),
                  _buildAnimatedButton("Skin Care", imagePath: "assets/skincare.jpg"),
                  const SizedBox(height: 50),
                  _buildAnimatedButton("Doctors", imagePath: "assets/doctors.jpg"),
                  Expanded(child: Container()),
                  _buildBottomMenu(),
                ],
              ),
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
                      const SizedBox(height: 50),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Menu",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black38),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildMenuItem("What is Dr. Glowy"),
                      _buildMenuItem("Payment Information"),
                      _buildMenuItem("Privacy Info"),
                      _buildMenuItem("Send Feedback"),
                      Padding(
                        padding: const EdgeInsets.only(top: 300.0),
                        child: const Divider(
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
                            _buildAnimatedSocialIcon(FontAwesomeIcons.instagram),
                            const SizedBox(width: 20),
                            _buildAnimatedSocialIcon(FontAwesomeIcons.facebook),
                            const SizedBox(width: 20),
                            _buildAnimatedSocialIcon(FontAwesomeIcons.twitter),
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

  Widget _buildAnimatedButton(String text, {String? imagePath}) {
    return SizedBox(
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
            child: AnimatedBuilder(
              animation: _textAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, -_textAnimation.value),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.arrow_forward, color: Colors.white, size: 26),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomMenu() {
    return Container(
      color: const Color(0xFFE8C3BA),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildBottomIcon(Icons.home, "Home"),
          _buildBottomIcon(Icons.people, "Community"),
          _buildBottomIcon(Icons.camera_alt, "Camera"),
          _buildBottomIcon(Icons.chat_bubble, "Chat"),
          _buildBottomIcon(Icons.person, "Profile"),
        ],
      ),
    );
  }

  Widget _buildBottomIcon(IconData icon, String label) {
    bool isSelected = _selectedBottomMenu == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedBottomMenu = label;
        });
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : Color(0xFFE8C3BA),
              borderRadius: BorderRadius.circular(12),
              boxShadow: isSelected
                  ? [
                BoxShadow(
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
              color: isSelected ? Color(0xFFE8C3BA) : Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Color(0xFFE8C3BA) : Colors.white,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedMenuItem = text;
          });
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: _selectedMenuItem == text ? const Color(0xFFE8C3BA) : Colors.black38,
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedSocialIcon(IconData icon) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -_textAnimation.value),
          child: IconButton(
            icon: Icon(
              icon,
              size: 40,
              color: _textAnimation.value > 5 ? const Color(0xFFE8C3BA) : Colors.black38,
            ),
            onPressed: () {},
          ),
        );
      },
    );
  }
}
