import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_page.dart'; // تأكد من أنك قد أضفت هذه الصفحة في مشروعك
import 'CustomerCommunity.dart'; // إضافة الاستيراد لصفحة الكومينتي
import 'CustomerChat.dart';
import 'WhatIsDrGlowyPage.dart';
import 'PrivacyInfoPage.dart';
import 'PaymentInformationPage.dart';
import 'FeedbackRatingPage.dart';
import 'screens/LoginScreen/login.dart';

class CustomerProfile extends StatefulWidget {
  const CustomerProfile({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomerProfileState createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile>
    with TickerProviderStateMixin {
  bool _isMenuVisible = false;
  int _selectedIconIndex = -1; // -1 means no icon is selected
  String _selectedBottomMenu =
      "Profile"; // Default selected menu item is "Profile"
  bool _isNotificationsVisible = false; // لتحديد ظهور خانة الإشعارات

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

  // Select a bottom menu item
  void _selectBottomMenu(String menuItem) {
    setState(() {
      _selectedBottomMenu = menuItem;
      // Navigate to "Home" page when "Home" is selected
      if (menuItem == "Home") {
         Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(), // استدعاء صفحة الهوم
              ),
              (Route<dynamic> route) => false, // إزالة الصفحات السابقة
            );
      }
      // Navigate to "Community" page when "Community" is selected
      else if (menuItem == "Community") {
         Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const CustomerCommunity(), // استدعاء صفحة الهوم
              ),
              (Route<dynamic> route) => false, // إزالة الصفحات السابقة
            );
      }
      // Navigate to "Chat" page when "Chat" is selected
      else if (menuItem == "Chat") {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const CustomerChat()), // Make sure CustomerChat is available
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
                  const SizedBox(height: 10), // Space for the profile picture
                  _buildProfilePicture(), // User profile picture
                  Expanded(child: Container()), // Empty space in the center
                  _buildBottomMenu(), // Bottom navigation menu
                ],
              ),
            ),

            if (_isNotificationsVisible)
              Align(
                alignment: Alignment.topRight,
                child: _buildNotificationsPanel(),
              ), // Side menu visibility check
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
                      _buildMenuItem("Payment Information"),
                      _buildMenuItem("Privacy Info"),
                      _buildMenuItem("Rating & Feedback"),
                      _buildMenuItem("Log Out"),

                      const Padding(
                        padding: EdgeInsets.only(top: 377.0),
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

          if (text == "Log Out") {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => Login(), // استدعاء صفحة الهوم
              ),
              (Route<dynamic> route) => false, // إزالة الصفحات السابقة
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

  // Create social media icon in the side menu
  Widget _buildSocialIcon(IconData icon) {
    return Icon(
      icon,
      size: 40,
      color: Colors.black38,
    );
  }

  Widget _buildNotificationsPanel() {
    // قائمة ديناميكية للإشعارات
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

  Widget _buildProfilePicture() {
    // Sample values that can be modified in the code
    String name = "Hala Atout";
    String email = "Halaatout123@Gmail.com";
    String address = "123 Main St, City, Country";
    String phoneNumber = "+123 456 7890";
    String skinType = "Dry";
    String allergies = "Peanuts, Dust";

    // Controllers for text fields
    TextEditingController nameController = TextEditingController(text: name);
    TextEditingController emailController = TextEditingController(text: email);
    TextEditingController addressController =
        TextEditingController(text: address);
    TextEditingController phoneController =
        TextEditingController(text: phoneNumber);
    TextEditingController skinController =
        TextEditingController(text: skinType);
    TextEditingController allergiesController =
        TextEditingController(text: allergies);

    void showEditDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Edit Profile"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Name",
                  ),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                  ),
                ),
                TextField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    labelText: "Address",
                  ),
                ),
                TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    labelText: "Phone Number",
                  ),
                ),
                TextField(
                  controller: skinController,
                  decoration: const InputDecoration(
                    labelText: "Skin Type",
                  ),
                ),
                TextField(
                  controller: allergiesController,
                  decoration: const InputDecoration(
                    labelText: "Allergies",
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text("Save"),
                onPressed: () {
                  setState(() {
                    // Update the fields based on the controller values
                    name = nameController.text;
                    email = emailController.text;
                    address = addressController.text;
                    phoneNumber = phoneController.text;
                    skinType = skinController.text;
                    allergies = allergiesController.text;
                  });
                  Navigator.of(context).pop(); // Close the dialog after saving
                },
              ),
            ],
          );
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 50.0), // Adjust horizontal padding
      child: Align(
        alignment: Alignment
            .topCenter, // Align the image towards the top of the container
        child: Column(
          children: [
            const CircleAvatar(
              radius: 125, // Set radius for the circular image
              backgroundImage: AssetImage(
                  'assets/user.jpg'), // Replace with the user's image
              backgroundColor: Colors.transparent,
            ),
            // Increased space between the profile picture and the name
            Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 12.0, horizontal: 20.0), // Increased padding
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(25), // Larger rounded corners
                border: Border.all(
                    color: Colors.black12,
                    width: 1), // Border around the container
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align text to the start
                children: [
                  // Name Section
                  const Row(
                    children: [
                      Icon(
                        Icons
                            .person_outline, // User icon (شخصي) من Material Icons
                        size: 24, // Icon size
                        color: Colors.black54, // Icon color
                      ),
                      SizedBox(width: 15), // Space between icon and text
                      Text(
                        'Name', // Label text
                        style: TextStyle(
                          fontSize: 20, // Font size for the label
                          color:
                              Colors.black87, // Light gray color for the label
                          fontWeight:
                              FontWeight.w500, // Medium weight for the label
                        ),
                      ),
                      Spacer(), // Pushes the Edit button to the right
                    ],
                  ),
                  const SizedBox(
                      height: 0), // Space between the label and the name
                  Row(
                    children: [
                      const SizedBox(
                          width:
                              40), // Align name under the label with space from the icon
                      Text(
                        name, // Name text
                        style: const TextStyle(
                          fontSize: 19, // Increased text size
                          fontWeight: FontWeight.bold,
                          color: Colors.black54, // Text color
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),

                  // Email Section
                  const Row(
                    children: [
                      Icon(
                        Icons
                            .email_outlined, // Email icon (البريد الالكتروني) من Material Icons
                        size: 24, // Icon size
                        color: Colors.black54, // Icon color
                      ),
                      SizedBox(width: 15), // Space between icon and text
                      Text(
                        'Email', // Label text
                        style: TextStyle(
                          fontSize: 20, // Font size for the label
                          color:
                              Colors.black87, // Light gray color for the label
                          fontWeight:
                              FontWeight.w500, // Medium weight for the label
                        ),
                      ),
                      Spacer(), // Pushes the Edit button to the right
                    ],
                  ),
                  const SizedBox(
                      height: 0), // Space between the label and the email
                  Row(
                    children: [
                      const SizedBox(
                          width:
                              40), // Align email under the label with space from the icon
                      Text(
                        email, // Email text
                        style: const TextStyle(
                          fontSize: 19, // Text size
                          fontWeight: FontWeight.bold,
                          color: Colors.black54, // Text color
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),

                  // Address Section
                  const Row(
                    children: [
                      Icon(
                        Icons
                            .location_on_outlined, // Address icon (الموقع) من Material Icons
                        size: 24, // Icon size
                        color: Colors.black54, // Icon color
                      ),
                      SizedBox(width: 15), // Space between icon and text
                      Text(
                        'Address', // Label text
                        style: TextStyle(
                          fontSize: 20, // Font size for the label
                          color:
                              Colors.black87, // Light gray color for the label
                          fontWeight:
                              FontWeight.w500, // Medium weight for the label
                        ),
                      ),
                      Spacer(), // Pushes the Edit button to the right
                    ],
                  ),
                  const SizedBox(
                      height: 0), // Space between the label and the address
                  Row(
                    children: [
                      const SizedBox(
                          width:
                              40), // Align address under the label with space from the icon
                      Text(
                        address, // Address text
                        style: const TextStyle(
                          fontSize: 19, // Text size
                          fontWeight: FontWeight.bold,
                          color: Colors.black54, // Text color
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),

                  // Phone Number Section
                  const Row(
                    children: [
                      Icon(
                        Icons
                            .phone_in_talk_outlined, // Phone icon (الهاتف) من Material Icons
                        size: 24, // Icon size
                        color: Colors.black54, // Icon color
                      ),
                      SizedBox(width: 15), // Space between icon and text
                      Text(
                        'Phone Number', // Label text
                        style: TextStyle(
                          fontSize: 20, // Font size for the label
                          color:
                              Colors.black87, // Light gray color for the label
                          fontWeight:
                              FontWeight.w500, // Medium weight for the label
                        ),
                      ),
                      Spacer(), // Pushes the Edit button to the right
                    ],
                  ),
                  const SizedBox(
                      height:
                          0), // Space between the label and the phone number
                  Row(
                    children: [
                      const SizedBox(
                          width:
                              40), // Align phone number under the label with space from the icon
                      Text(
                        phoneNumber, // Phone number text
                        style: const TextStyle(
                          fontSize: 19, // Text size
                          fontWeight: FontWeight.bold,
                          color: Colors.black54, // Text color
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),

                  // Skin Type Section
                  const Row(
                    children: [
                      Icon(
                        Icons
                            .face_outlined, // Skin type icon (البشرة) من Material Icons
                        size: 24, // Icon size
                        color: Colors.black54, // Icon color
                      ),
                      SizedBox(width: 15), // Space between icon and text
                      Text(
                        'Skin Type', // Label text
                        style: TextStyle(
                          fontSize: 20, // Font size for the label
                          color:
                              Colors.black87, // Light gray color for the label
                          fontWeight:
                              FontWeight.w500, // Medium weight for the label
                        ),
                      ),
                      Spacer(), // Pushes the Edit button to the right
                    ],
                  ),
                  const SizedBox(
                      height: 0), // Space between the label and the skin type
                  Row(
                    children: [
                      const SizedBox(
                          width:
                              40), // Align skin type under the label with space from the icon
                      Text(
                        skinType, // Skin type text
                        style: const TextStyle(
                          fontSize: 19, // Text size
                          fontWeight: FontWeight.bold,
                          color: Colors.black54, // Text color
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),

                  // Allergies Section
                  const Row(
                    children: [
                      Icon(
                        Icons
                            .warning_amber_outlined, // Allergies icon (تحذير) من Material Icons
                        size: 24, // Icon size
                        color: Colors.black54, // Icon color
                      ),
                      SizedBox(width: 15), // Space between icon and text
                      Text(
                        'Allergies', // Label text
                        style: TextStyle(
                          fontSize: 20, // Font size for the label
                          color:
                              Colors.black87, // Light gray color for the label
                          fontWeight:
                              FontWeight.w500, // Medium weight for the label
                        ),
                      ),
                      Spacer(), // Pushes the Edit button to the right
                    ],
                  ),
                  const SizedBox(
                      height: 0), // Space between the label and the allergies
                  Row(
                    children: [
                      const SizedBox(
                          width:
                              40), // Align allergies under the label with space from the icon
                      Text(
                        allergies, // Allergies text
                        style: const TextStyle(
                          fontSize: 19, // Text size
                          fontWeight: FontWeight.bold,
                          color: Colors.black54, // Text color
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  const SizedBox(height: 10),

                  // Edit Profile Button
                  Center(
                    // Center the button
                    child: ElevatedButton(
                      onPressed: () {
                        showEditDialog();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            255, 118, 119, 118), // Change the button color
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 40.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        "Edit Profile",
                        style: TextStyle(
                          fontSize: 16, // Text size
                          color: Colors
                              .white, // Change the text color inside the button
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
