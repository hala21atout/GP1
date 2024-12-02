import 'package:flutter/material.dart';
import 'package:gp1/home_page.dart';
import 'CustomerCommunity.dart';
import 'CustomerProfile.dart';
import 'CustomerChat.dart';
import 'PaymentInformationPage.dart';


class ShoppingcartPage extends StatefulWidget {
  const ShoppingcartPage({super.key});

  @override
  _ShoppingcartPageState createState() => _ShoppingcartPageState();
}

class _ShoppingcartPageState extends State<ShoppingcartPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  String _selectedBottomMenu = "";

  // قائمة وهمية للعناصر الموجودة في عربة التسوق
  final List<Map<String, dynamic>> _cartItems = [
    {"name": "Face Cream", "price": 80.0, "image": "assets/face_cream.png"},
    {"name": "Toner", "price": 50.0, "image": "assets/toner.png"},
    {"name": "Serum", "price": 100.0, "image": "assets/serum.png"},
    {"name": "Eyeliner", "image": "assets/eyeliner.png", "price": 30.0},
    {"name": "Sunscreen", "price": 70.0, "image": "assets/sunscreen.png"},
    {"name": "Moisturizer", "price": 60.0, "image": "assets/moisturizer.png"},
    {"name": "Eyeliner", "image": "assets/eyeliner.png", "price": 30.0},
    {"name": "Lip Balm", "price": 20.0, "image": "assets/lip_balm.png"},
    {"name": "Lipstick", "image": "assets/lipstick.png", "price": 50.0},
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = _cartItems.fold(
        0,
        (sum, item) =>
            sum +
            ((item["price"] ?? 0.0) *
                (item["quantity"] ?? 1))); // القيمة الافتراضية 1
    double totalItems = _cartItems.fold(
        0, (sum, item) => sum + (item["quantity"] ?? 1)); // القيمة الافتراضية 1

    return Scaffold(
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
                'Cart',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    leading: Image.asset(
                      item["image"],
                      width: 70,
                      height: 75,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      item["name"],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          "₪${item["price"] ?? 0.0}",
                          style:
                              const TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          "Qty: ${item["quantity"] ?? 1}", // القيمة الافتراضية 1
                          style:
                              const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if ((item["quantity"] ?? 1) > 1) {
                                item["quantity"]--;
                              }
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              item["quantity"] = (item["quantity"] ?? 1) +
                                  1; // تعيين القيمة الافتراضية 1
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          color: Colors.black38,
                          onPressed: () async {
                            bool? shouldDelete = await showDialog<bool>(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Confirm Deletion'),
                                content: const Text(
                                    'Are you sure you want to delete this item?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    child: const Text('Delete'),
                                  ),
                                ],
                              ),
                            );
                            if (shouldDelete == true) {
                              setState(() {
                                _cartItems.removeAt(index);
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Items: $totalItems",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Total Price: ₪${totalPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // الانتقال إلى صفحة الـ Checkout
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentInformationPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE8C3BA),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 33, vertical: 14),
                  ),
                  child: const Text(
                    "Proceed to Checkout",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 5),
              ],
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
      onTap: () {
        setState(() {
          _selectedBottomMenu = label;
          if (_selectedBottomMenu == "Home") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else if (_selectedBottomMenu == "Community") {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CustomerCommunity()),
            );
          } else if (_selectedBottomMenu == "Chat") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CustomerChat()),
            );
          } else if (_selectedBottomMenu == "Profile") {
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
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
