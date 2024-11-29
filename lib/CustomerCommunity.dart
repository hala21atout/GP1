// ignore: file_names
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_page.dart'; // تأكد من أنك قد أضفت هذه الصفحة في مشروعك
import 'CustomerProfile.dart'; // إضافة الاستيراد لصفحة البروفايل
import 'CustomerChat.dart'; // إضافة الاستيراد لصفحة الشات
import 'WhatIsDrGlowyPage.dart';
import 'PrivacyInfoPage.dart';
import 'PaymentInformationPage.dart';
import 'FeedbackRatingPage.dart';

class CustomerCommunity extends StatefulWidget {
  const CustomerCommunity({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomerCommunityState createState() => _CustomerCommunityState();
}

class _CustomerCommunityState extends State<CustomerCommunity>
    with TickerProviderStateMixin {
  bool _isMenuVisible = false;
  int _selectedIconIndex = -1; // -1 means no icon is selected
  String _selectedBottomMenu =
      "Community"; // Default selected menu item is "Community"
  final TextEditingController _postController = TextEditingController();
  final List<String> _posts = []; // List to store posts
  final List<bool> _likedPosts = []; // List to store like states for each post
  final List<int> _commentCounts = []; // قائمة لتخزين عدد التعليقات لكل منشور
  final List<List<String>> _comments = []; // قائمة تحتوي على تعليقات لكل بوست

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
          MaterialPageRoute(
              builder: (context) =>
                  const HomePage()), // تأكد من أن HomePage موجودة
        );
      } else if (menuItem == "Chat") {
        // الانتقال إلى صفحة الشات عند الضغط على زر "Chat"
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CustomerChat()),
        );
      } else if (menuItem == "Profile") {
        // الانتقال إلى صفحة البروفايل عند الضغط على زر "Profile"
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
        preferredSize: const Size.fromHeight(70), // Set AppBar height
        child: AppBar(
          backgroundColor: const Color(0xFFE8C3BA),
          elevation: 0,
          automaticallyImplyLeading: false, // Remove default leading icon
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(
                top: 30.0, left: 5.0), // Adjust logo padding
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
                // ignore: deprecated_member_use
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
                  // Add the "Dr. Glowy" text here
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Dr. Glowy",
                        style: TextStyle(
                          fontSize: 40, // Increased font size
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFE8C3BA),
                          fontFamily: 'Cursive', // Use a fancy font here
                        ),
                      ),
                    ),
                  ),
                  // Display posts under "Dr. Glowy"
                  // عرض المنشورات تحت "Dr. Glowy"
                  Expanded(
                    child: ListView.builder(
                      itemCount: _posts.length,
                      itemBuilder: (context, index) {
                        // تأكد من وجود قائمة التعليقات لكل بوست
                        if (_comments.length <= index) {
                          _comments
                              .add([]); // إضافة قائمة فارغة إذا لم تكن موجودة
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          child: Card(
                            color: Colors.grey[200],
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundImage: NetworkImage(
                                          'https://th.bing.com/th/id/OIP.O3NIP6WvBuO6NfT3HlQeegAAAA?rs=1&pid=ImgDetMain',
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Hala Atout',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  const Divider(
                                    // هذا هو الخط الرفيع قبل نص البوست
                                    color: Colors.black38,
                                    thickness: 1,
                                  ),
                                  Text(
                                    _posts[index],
                                    style: const TextStyle(
                                        fontSize: 17, color: Colors.black87),
                                  ),

                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          _likedPosts[index]
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: _likedPosts[index]
                                              ? Colors.red
                                              : Colors.black38,
                                          size: 33,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _likedPosts[index] =
                                                !_likedPosts[index];
                                          });
                                        },
                                      ),
                                      const Text("Like"),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: IconButton(
                                          icon: const Icon(
                                            FontAwesomeIcons
                                                // ignore: deprecated_member_use
                                                .commentAlt, // أيقونة التعليق
                                            color: Colors.black38,
                                            size: 28,
                                          ),
                                          onPressed: () {
                                            _showCommentDialog(
                                                index); // فتح مربع الحوار لإضافة تعليق
                                          },
                                        ),
                                      ),
                                      Text(
                                          "${_commentCounts[index]} Comment(s)"),
                                    ],
                                  ),
                                  // عرض التعليقات أسفل الأيقونات
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: _comments[index].map((comment) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0),
                                          child: Row(
                                            children: [
                                              const CircleAvatar(
                                                radius: 15,
                                                backgroundImage: NetworkImage(
                                                  'https://th.bing.com/th/id/OIP.O3NIP6WvBuO6NfT3HlQeegAAAA?rs=1&pid=ImgDetMain',
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              const Text(
                                                'User Name', // اسم المستخدم سيكون هنا
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                child: Text(
                                                  comment,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  _buildPostInputField(), // Post input field
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
                        padding: EdgeInsets.only(top: 443.0),
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

// add comment
  void _showCommentDialog(int postIndex) {
    TextEditingController commentController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a Comment'), // تم تغييره من "أضف تعليق"
          content: TextField(
            controller: commentController,
            decoration: const InputDecoration(
                hintText:
                    'Write your comment here...'), // تم تغييره من "اكتب تعليقك هنا..."
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'), // لم يتم تغييره
              onPressed: () {
                Navigator.of(context).pop(); // إغلاق مربع الحوار
              },
            ),
            TextButton(
              child: const Text('Add'), // تم تغييره من "إضافة"
              onPressed: () {
                setState(() {
                  if (commentController.text.isNotEmpty) {
                    // إضافة التعليق إلى قائمة التعليقات الخاصة بالبوست
                    if (_comments.length <= postIndex) {
                      _comments.add(
                          []); // إضافة قائمة فارغة لتعليقات البوست إذا لم تكن موجودة
                    }
                    _comments[postIndex]
                        .add(commentController.text); // إضافة التعليق
                    _commentCounts[postIndex]++; // زيادة عدد التعليقات
                  }
                });

                Navigator.of(context).pop(); // إغلاق مربع الحوار
              },
            ),
          ],
        );
      },
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

          if (text == "Payment Information") {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const PaymentInformationPage()), // تأكد من تعريف الصفحة
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
        },
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black38),
        ),
      ),
    );
  }

  // Build the input field for adding a post
  Widget _buildPostInputField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              maxLines: 4,
              minLines: 1,
              controller: _postController,
              decoration: InputDecoration(
                hintText: "Write a post...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _addPost,
          ),
        ],
      ),
    );
  }

  void _addPost() {
    if (_postController.text.isNotEmpty) {
      setState(() {
        // إضافة البوست الجديد مع قائمة فارغة من التعليقات وعدد التعليقات 0
        _posts.insert(0, _postController.text);
        _likedPosts.insert(0, false);
        _commentCounts.insert(0, 0); // إضافة عدد التعليقات كـ 0
        _comments.insert(0, []); // إضافة قائمة فارغة للتعليقات الخاصة بالبوست
      });
      _postController.clear();
    } else {
      // إظهار تحذير إذا كان النص فارغًا
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please write something before posting!')),
      );
    }
  }

  // Social media icon in the side menu
  Widget _buildSocialIcon(IconData icon) {
    return Icon(
      icon,
      size: 40,
      color: const Color.fromARGB(95, 58, 56, 56),
    );
  }
}
