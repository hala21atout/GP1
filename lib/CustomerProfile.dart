import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_page.dart'; // تأكد من أنك قد أضفت هذه الصفحة في مشروعك
import 'CustomerCommunity.dart'; // إضافة الاستيراد لصفحة الكومينتي
import 'CustomerChat.dart';
import 'WhatIsDrGlowyPage.dart';
import 'PrivacyInfoPage.dart';
import 'PaymentInformationPage.dart';
import 'FeedbackRatingPage.dart';


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
      }
      // Navigate to "Community" page when "Community" is selected
      else if (menuItem == "Community") {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const CustomerCommunity()), // Make sure CustomerCommunity is available
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
                  const SizedBox(height: 10), // Space for the profile picture
                  _buildProfilePicture(), // User profile picture
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

    void showEditDialog(String field, TextEditingController controller) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Edit $field"),
            content: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Enter new $field",
              ),
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
                    // Update the field based on the controller value
                    if (field == 'Name') {
                      name = controller.text;
                    } else if (field == 'Email') {
                      email = controller.text;
                    } else if (field == 'Address') {
                      address = controller.text;
                    } else if (field == 'Phone Number') {
                      phoneNumber = controller.text;
                    } else if (field == 'Skin Type') {
                      skinType = controller.text;
                    } else if (field == 'Allergies') {
                      allergies = controller.text;
                    }
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
              radius: 118, // Set radius for the circular image
              backgroundImage: AssetImage(
                  'assets/user.jpg'), // Replace with the user's image
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(
                height:
                    0), // Increased space between the profile picture and the name
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
                  Row(
                    children: [
                      const Icon(
                        Icons
                            .person_outline, // User icon (شخصي) من Material Icons
                        size: 24, // Icon size
                        color: Colors.black54, // Icon color
                      ),
                      const SizedBox(width: 15), // Space between icon and text
                      const Text(
                        'Name', // Label text
                        style: TextStyle(
                          fontSize: 20, // Font size for the label
                          color:
                              Colors.black87, // Light gray color for the label
                          fontWeight:
                              FontWeight.w500, // Medium weight for the label
                        ),
                      ),
                      const Spacer(), // Pushes the Edit button to the right
                      IconButton(
                        icon: const Icon(Icons.edit,
                            size: 16,
                            color: Colors.black54), // Smaller icon size
                        onPressed: () {
                          showEditDialog('Name', nameController);
                        },
                      ),
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
                  const SizedBox(height: 5), // Space after the name

                  // Email Section
                  Row(
                    children: [
                      const Icon(
                        Icons
                            .email_outlined, // Email icon (البريد الالكتروني) من Material Icons
                        size: 24, // Icon size
                        color: Colors.black54, // Icon color
                      ),
                      const SizedBox(width: 15), // Space between icon and text
                      const Text(
                        'Email', // Label text
                        style: TextStyle(
                          fontSize: 20, // Font size for the label
                          color:
                              Colors.black87, // Light gray color for the label
                          fontWeight:
                              FontWeight.w500, // Medium weight for the label
                        ),
                      ),
                      const Spacer(), // Pushes the Edit button to the right
                      IconButton(
                        icon: const Icon(Icons.edit,
                            size: 16,
                            color: Colors.black54), // Smaller icon size
                        onPressed: () {
                          showEditDialog('Email', emailController);
                        },
                      ),
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
                  const SizedBox(height: 5), // Space after the email

                  // Address Section
                  Row(
                    children: [
                      const Icon(
                        Icons
                            .location_on_outlined, // Address icon (الموقع) من Material Icons
                        size: 24, // Icon size
                        color: Colors.black54, // Icon color
                      ),
                      const SizedBox(width: 15), // Space between icon and text
                      const Text(
                        'Address', // Label text
                        style: TextStyle(
                          fontSize: 20, // Font size for the label
                          color:
                              Colors.black87, // Light gray color for the label
                          fontWeight:
                              FontWeight.w500, // Medium weight for the label
                        ),
                      ),
                      const Spacer(), // Pushes the Edit button to the right
                      IconButton(
                        icon: const Icon(Icons.edit,
                            size: 16,
                            color: Colors.black54), // Smaller icon size
                        onPressed: () {
                          showEditDialog('Address', addressController);
                        },
                      ),
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
                  const SizedBox(height: 5), // Space after the address

                  // Phone Number Section
                  Row(
                    children: [
                      const Icon(
                        Icons
                            .phone_in_talk_outlined, // Phone icon (الهاتف) من Material Icons
                        size: 24, // Icon size
                        color: Colors.black54, // Icon color
                      ),
                      const SizedBox(width: 15), // Space between icon and text
                      const Text(
                        'Phone Number', // Label text
                        style: TextStyle(
                          fontSize: 20, // Font size for the label
                          color:
                              Colors.black87, // Light gray color for the label
                          fontWeight:
                              FontWeight.w500, // Medium weight for the label
                        ),
                      ),
                      const Spacer(), // Pushes the Edit button to the right
                      IconButton(
                        icon: const Icon(Icons.edit,
                            size: 16,
                            color: Colors.black54), // Smaller icon size
                        onPressed: () {
                          showEditDialog('Phone Number', phoneController);
                        },
                      ),
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
                  const SizedBox(height: 5), // Space after the phone number

                  // Skin Type Section
                  Row(
                    children: [
                      const Icon(
                        Icons
                            .face_outlined, // Skin type icon (البشرة) من Material Icons
                        size: 24, // Icon size
                        color: Colors.black54, // Icon color
                      ),
                      const SizedBox(width: 15), // Space between icon and text
                      const Text(
                        'Skin Type', // Label text
                        style: TextStyle(
                          fontSize: 20, // Font size for the label
                          color:
                              Colors.black87, // Light gray color for the label
                          fontWeight:
                              FontWeight.w500, // Medium weight for the label
                        ),
                      ),
                      const Spacer(), // Pushes the Edit button to the right
                      IconButton(
                        icon: const Icon(Icons.edit,
                            size: 16,
                            color: Colors.black54), // Smaller icon size
                        onPressed: () {
                          showEditDialog('Skin Type', skinController);
                        },
                      ),
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
                  const SizedBox(height: 5), // Space after the skin type

                  // Allergies Section
                  Row(
                    children: [
                      const Icon(
                        Icons
                            .warning_amber_outlined, // Allergies icon (تحذير) من Material Icons
                        size: 24, // Icon size
                        color: Colors.black54, // Icon color
                      ),
                      const SizedBox(width: 15), // Space between icon and text
                      const Text(
                        'Allergies', // Label text
                        style: TextStyle(
                          fontSize: 20, // Font size for the label
                          color:
                              Colors.black87, // Light gray color for the label
                          fontWeight:
                              FontWeight.w500, // Medium weight for the label
                        ),
                      ),
                      const Spacer(), // Pushes the Edit button to the right
                      IconButton(
                        icon: const Icon(Icons.edit,
                            size: 16,
                            color: Colors.black54), // Smaller icon size
                        onPressed: () {
                          showEditDialog('Allergies', allergiesController);
                        },
                      ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
