import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_page.dart';
import 'CustomerCommunity.dart';
import 'CustomerProfile.dart';
import 'CustomerChat.dart';
import 'ShoppingcartPage.dart';

class SkinCarePage extends StatefulWidget {
  const SkinCarePage({super.key});

  @override
  _SkinCarePageState createState() => _SkinCarePageState();
}

class _SkinCarePageState extends State<SkinCarePage>
    with TickerProviderStateMixin {
  int _selectedIconIndex = -1;
  String _selectedBottomMenu = "";

  final List<Map<String, dynamic>> _skinCareProducts = [
    {
      "name": "Face Cream",
      "image": "assets/face_cream.png",
      "price": 80.0,
      "description":
          "A moisturizing face cream to keep your skin smooth and soft.",
      "skinType": "Dry & Normal Skin",
      "warning": "Avoid contact with eyes.",
      "allergens": "Fragrance, Parabens"
    },
    {
      "name": "Toner",
      "image": "assets/toner.png",
      "price": 50.0,
      "description": "A refreshing toner for clean and balanced skin.",
      "skinType": "All Skin Types",
      "warning": "Patch test before use.",
      "allergens": "Alcohol, Fragrance"
    },
    {
      "name": "Serum",
      "image": "assets/serum.png",
      "price": 100.0,
      "description": "An anti-aging serum to improve skin elasticity.",
      "skinType": "Mature Skin",
      "warning": "Use with sunscreen.",
      "allergens": "Fragrance, Alcohol"
    },
    {
      "name": "Moisturizer",
      "image": "assets/moisturizer.png",
      "price": 70.0,
      "description": "A rich moisturizer for deep hydration.",
      "skinType": "Dry & Sensitive Skin",
      "warning": "Avoid use on broken skin.",
      "allergens": "Fragrance, Parabens"
    },
    {
      "name": "Exfoliator",
      "image": "assets/exfoliator.png",
      "price": 40.0,
      "description":
          "An exfoliator to remove dead skin cells and refresh your face.",
      "skinType": "Oily Skin",
      "warning": "Do not over-exfoliate.",
      "allergens": "AHA, Fragrance"
    },
    {
      "name": "Face Mask",
      "image": "assets/face_mask.png",
      "price": 60.0,
      "description": "A deep-cleansing face mask for glowing skin.",
      "skinType": "Combination Skin",
      "warning": "Not recommended for sensitive skin.",
      "allergens": "Fragrance, Parabens"
    },
    {
      "name": "Sunscreen",
      "image": "assets/sunscreen.png",
      "price": 90.0,
      "description": "Broad-spectrum sunscreen to protect from UV rays.",
      "skinType": "All Skin Types",
      "warning": "Reapply every 2 hours.",
      "allergens": "Oxybenzone, Fragrance"
    },
    {
      "name": "Eye Cream",
      "image": "assets/eye_cream.png",
      "price": 55.0,
      "description": "An eye cream to reduce puffiness and dark circles.",
      "skinType": "All Skin Types",
      "warning": "Avoid contact with eyes.",
      "allergens": "Fragrance, Parabens"
    },
    {
      "name": "Lip Balm",
      "image": "assets/lip_balm.png",
      "price": 25.0,
      "description": "A nourishing lip balm for soft lips.",
      "skinType": "All Skin Types",
      "warning": "Keep away from heat.",
      "allergens": "Beeswax, Fragrance"
    },
    {
      "name": "Body Lotion",
      "image": "assets/body_lotion.png",
      "price": 45.0,
      "description": "A rich body lotion to keep your skin hydrated.",
      "skinType": "Dry Skin",
      "warning": "Use after a shower.",
      "allergens": "Fragrance, Parabens"
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
            padding: EdgeInsets.only(top: 70.0, left: 120.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Skin Care Corner', // هنا يتم تغيير اللوغو إلى نص
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
          ),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                _buildCategoryCircle("Face Cream", "assets/FaceCreamIcon.png"),
                _buildCategoryCircle("Tonar", "assets/TonerIcon.png"),
                _buildCategoryCircle("Serum", "assets/SerumIcon.png"),
                _buildCategoryCircle("Moisturizer", "assets/MoisturizerIcon.png"),
                _buildCategoryCircle("Mask", "assets/MaskIcon.png"),
                _buildCategoryCircle("Sun Screen", "assets/SunScreenIcon.png"),
                _buildCategoryCircle("Exfolistor", "assets/ExfolistorIcon.png"),
                _buildCategoryCircle("Eye Cream", "assets/EyeCreanIcon.png"),
                _buildCategoryCircle("Body Lotion", "assets/BodyLotionIcon.png"),
                _buildCategoryCircle("Lip Balm", "assets/LipBalmIcon.png"),
              ],
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
              itemCount: _skinCareProducts.length,
              itemBuilder: (context, index) {
                final product = _skinCareProducts[index];

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

  Widget _buildCategoryCircle(String label, String assetPath) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Image.asset(
              assetPath,
              fit: BoxFit.cover,
              width: 40,
              height: 40,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
      ],
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
