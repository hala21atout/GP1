import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_page.dart';
import 'CustomerCommunity.dart';
import 'CustomerProfile.dart';
import 'CustomerChat.dart';
import 'ShoppingcartPage.dart';

class MakeupPage extends StatefulWidget {
  const MakeupPage({super.key});

  @override
  _CustomerChatState createState() => _CustomerChatState();
}

class _CustomerChatState extends State<MakeupPage>
    with TickerProviderStateMixin {
  int _selectedIconIndex = -1;
  String _selectedBottomMenu = "";

  final List<Map<String, dynamic>> _makeupProducts = [
    {
      "name": "Lipstick",
      "image": "assets/lipstick.png",
      "price": 50.0,
      "description": "A beautiful and smooth lipstick to enhance your smile.",
      "skinType": "All skin types",
      "warnings": "Avoid direct contact with eyes.",
      "allergens": "May contain beeswax and fragrance."
    },
    {
      "name": "Foundation",
      "image": "assets/foundation.png",
      "price": 100.0,
      "description": "Perfect coverage for a flawless complexion.",
      "skinType": "Dry, Normal, Combination",
      "warnings": "For external use only.",
      "allergens": "Contains parabens."
    },
    {
      "name": "Eyeliner",
      "image": "assets/eyeliner.png",
      "price": 30.0,
      "description": "Get sharp and defined eyes with this eyeliner.",
      "skinType": "All skin types",
      "warnings": "Avoid contact with eyes.",
      "allergens": "May contain synthetic dyes."
    },
    {
      "name": "Blush",
      "image": "assets/blush.png",
      "price": 40.0,
      "description": "A soft blush that gives you a natural, rosy glow.",
      "skinType": "All skin types",
      "warnings": "Store in a cool, dry place.",
      "allergens": "Contains mica and fragrance."
    },
    {
      "name": "Mascara",
      "image": "assets/mascara.png",
      "price": 60.0,
      "description": "Lash elongation and volume in one stroke.",
      "skinType": "Sensitive eyes",
      "warnings": "Remove before sleeping to avoid irritation.",
      "allergens": "Contains formaldehyde releasers."
    },
    {
      "name": "Nail Polish",
      "image": "assets/nail_polish.png",
      "price": 20.0,
      "description": "A variety of vibrant colors to choose from.",
      "skinType": "Not applicable",
      "warnings": "Keep away from children.",
      "allergens": "May contain toluene and formaldehyde."
    },
    {
      "name": "Highlighter",
      "image": "assets/highlighter.png",
      "price": 80.0,
      "description": "Add a subtle glow with this radiant highlighter.",
      "skinType": "All skin types",
      "warnings": "Avoid using on broken skin.",
      "allergens": "Contains bismuth oxychloride."
    },
    {
      "name": "Concealer",
      "image": "assets/concealer.png",
      "price": 50.0,
      "description": "A concealer to hide imperfections with ease.",
      "skinType": "All skin types",
      "warnings": "Test on a small skin patch first.",
      "allergens": "Contains talc and parabens."
    },
    {
      "name": "Setting Spray",
      "image": "assets/setting_spray.png",
      "price": 70.0,
      "description": "Keep your makeup in place all day long.",
      "skinType": "Oily, Combination",
      "warnings": "Avoid spraying directly into eyes.",
      "allergens": "Contains alcohol and fragrance."
    },
    {
      "name": "Brush Set",
      "image": "assets/brush_set.png",
      "price": 120.0,
      "description":
          "A complete set of brushes for perfect makeup application.",
      "skinType": "Not applicable",
      "warnings": "Clean brushes regularly.",
      "allergens": "Not applicable."
    },
  ];
  void _handleIconTap(int iconIndex) {
    setState(() {
      if (iconIndex == 1) {
        // إذا كانت أيقونة الإشعارات
      } else {
        _selectedIconIndex = _selectedIconIndex == iconIndex ? -1 : iconIndex;
      }
    });
  }

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
      if (menuItem == "Chat") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CustomerChat()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: const Color(0xFFE8C3BA),
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: const Padding(
            padding: EdgeInsets.only(top: 70.0, left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Makeup Corner', // هنا يتم تغيير اللوغو إلى نص
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShoppingcartPage()),
                );
              },
              padding: const EdgeInsets.only(top: 20.0),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "You don’t need makeup, makeup needs you ♡", // Modified text
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23, // Slightly larger font size
                fontWeight:
                    FontWeight.w600, // Change to a more elegant font weight
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: _makeupProducts.length,
              itemBuilder: (context, index) {
                final product = _makeupProducts[index];

                // تعديل القيم هنا باستخدام التحقق من null
                String productName = product["name"] ?? "Unknown Product";
               
                return GestureDetector(
                  onTap: () {
                    // عرض تفاصيل المنتج عند الضغط عليه
                    showDialog(
                      context: context,
                      builder: (context) {
                        // الحصول على القيم مع التأكد من وجودها
                        String productName =
                            product["name"] ?? "Unknown Product";
                        String productDescription = product["description"] ??
                            "No description available";
                        String productSkinType = (product["skinType"] != null &&
                                product["skinType"].isNotEmpty)
                            ? product["skinType"]
                            : "Not specified";
                        String productWarnings = (product["warnings"] != null &&
                                product["warnings"].isNotEmpty)
                            ? product["warnings"]
                            : "No warnings";
                        String productAllergens =
                            product["allergens"] ?? "No allergens listed.";

                        return AlertDialog(
                          title: Text(productName),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                product["image"] ??
                                    "assets/default_image.png", // صورة افتراضية إذا كانت null
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Description: $productDescription",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                              Text(
                                "Warnings: $productWarnings",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                              Text(
                                "Skin Type: $productSkinType",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                              Text(
                                "Allergens: $productAllergens",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Close"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            product["image"],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productName,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "₪${product["price"]}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 5),
                              ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "$productName added to cart!",
                                      ),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFE8C3BA),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.shoppingCart,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "Add to Cart",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          _buildBottomMenu(),
        ],
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
