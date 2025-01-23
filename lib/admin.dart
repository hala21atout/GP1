import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> with TickerProviderStateMixin {
  int _currentIndex = 0; // Index for bottom navigation bar

  final List<Widget> _pages = [
    const DashboardPage(),
    UserListPage(type: 'Customer', key: ValueKey('Customer')),
    UserListPage(type: 'Doctor', key: ValueKey('Doctor')),
    UserListPage(type: 'Company', key: ValueKey('Company')),
    UserListPage(type: 'Product', key: ValueKey('Product')),
    UserListPage(type: 'Review', key: ValueKey('Review')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70), // Set AppBar height
        child: AppBar(
          backgroundColor: const Color(0xFFE8C3BA),
          elevation: 0,
          centerTitle: true,
          title: Text(
            _currentIndex == 0 ? "Dashboard" : "Admin Panel",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.brown[800],
              fontSize: 22,
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: const Color(0xFFE8C3BA), // Selected icon color
        unselectedItemColor: Colors.black38, // Unselected icon color
        backgroundColor: Colors.white, // Background color of the bar
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Customer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Doctor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Company',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.reviews),
            label: 'Reviews',
          ),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Dashboard Overview",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Statistics Grid
                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _buildStatCard(
                          "Total Orders",
                          "1,234",
                          Icons.shopping_bag,
                          Colors.blue,
                        ),
                        _buildStatCard(
                          "Total Sales",
                          "\$12,345",
                          Icons.attach_money,
                          Colors.green,
                        ),
                        _buildStatCard(
                          "Customers",
                          "150",
                          Icons.person,
                          Colors.orange,
                        ),
                        _buildStatCard(
                          "Doctors",
                          "45",
                          Icons.medical_services,
                          Colors.purple,
                        ),
                        _buildStatCard(
                          "Companies",
                          "30",
                          Icons.business,
                          Colors.teal,
                        ),
                        _buildStatCard(
                          "Products",
                          "200",
                          Icons.shopping_cart,
                          Colors.red,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Recent Activities
                    const Text(
                      "Recent Activities",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildRecentActivities(),
                    const SizedBox(height: 20),
                    // Quick Links
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
      String title, String value, IconData icon, Color color) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: color,
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivities() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            ListTile(
              leading: Icon(Icons.shopping_bag, color: Colors.blue),
              title: Text("New Order Placed"),
              subtitle: Text("Order #1234 - 2 hours ago"),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person_add, color: Colors.green),
              title: Text("New Customer Registered"),
              subtitle: Text("Hala Atout - 5 hours ago"),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.medical_services, color: Colors.purple),
              title: Text("New Doctor Added"),
              subtitle: Text("Dr. Smith - 1 day ago"),
            ),
          ],
        ),
      ),
    );
  }
}

class UserListPage extends StatefulWidget {
  final String type;

  const UserListPage({super.key, required this.type});

  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<Map<String, String>> items = [];

  @override
  void initState() {
    super.initState();
    items = _getDummyData(widget.type);
  }

  void _addItem(Map<String, String> newItem) {
    setState(() {
      items.add(newItem);
    });
  }

  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(" Confirm Deletion"),
          content: const Text("Are you sure you want to delete this item?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // إغلاق مربع الحوار
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                _deleteItem(index); // حذف العنصر
                Navigator.pop(context); // إغلاق مربع الحوار
              },
              child: const Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: items.isEmpty
          ? Center(
              child: Text(
                "No items found!",
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),
            )
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    title: Text(
                      item['name'] ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _buildSubtitle(item),
                    ),
                    trailing: widget.type != 'Review'
                        ? IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _confirmDelete(index); // تأكيد الحذف
                            },
                          )
                        : null, // لا يوجد زر حذف في صفحة الـ Review
                  ),
                );
              },
            ),
      floatingActionButton: widget.type != 'Product' && widget.type != 'Review'
          ? FloatingActionButton(
              onPressed: () {
                _showAddItemDialog(context); // عرض مربع حوار لإضافة عنصر جديد
              },
              backgroundColor: const Color(0xFFE8C3BA),
              child: const Icon(Icons.add, color: Colors.white),
            )
          : null, // لا يوجد زر إضافة في صفحة المنتجات أو الـ Reviews
    );
  }

  List<Widget> _buildSubtitle(Map<String, String> item) {
    List<Widget> widgets = [];
    if (widget.type == 'Review') {
      widgets.add(
        Row(
          children: List.generate(
            5,
            (index) => Icon(
              Icons.star,
              color: index < (int.tryParse(item['stars'] ?? '0') ?? 0)
                  ? Colors.amber
                  : Colors.grey,
            ),
          ),
        ),
      );
      widgets.add(const SizedBox(height: 5));
      widgets.add(
        Text(
          item['feedback'] ?? '',
          style: TextStyle(color: Colors.grey[700]),
        ),
      );
    } else {
      // عرض البيانات العادية للأقسام الأخرى
      item.forEach((key, value) {
        if (key != 'name') {
          widgets.add(
            Text(
              '$key: $value',
              style: TextStyle(color: Colors.grey[700]),
            ),
          );
        }
      });
    }
    return widgets;
  }

  List<Map<String, String>> _getDummyData(String type) {
    // تحديث البيانات ديناميكياً حسب النوع
    switch (type) {
      case 'Customer':
        return [
          {
            'name': 'Hala Atout',
            'email': 'Halaatout123@Gmail.com',
            'address': '123 Main St, City, Country',
            'phoneNumber': '+123 456 7890',
            'skinType': 'Dry',
            'allergies': 'Peanuts, Dust',
          },
          {
            'name': 'John Doe',
            'email': 'johndoe@example.com',
            'address': '456 Elm St, City, Country',
            'phoneNumber': '+987 654 3210',
            'skinType': 'Oily',
            'allergies': 'None',
          },
        ];
      case 'Doctor':
        return [
          {
            'name': 'Dr. Smith',
            'email': 'drsmith@example.com',
            'address': '789 Oak St, City, Country',
            'phoneNumber': '+111 222 3333',
            'experienceYears': '15',
            'qualifications': 'MD, Board Certified',
          },
        ];
      case 'Company':
        return [
          {
            'name': 'Glowy Co.',
            'email': 'info@glowy.com',
            'address': '101 Glowy St, City, Country',
            'phoneNumber': '+777 888 9999',
          },
        ];
      case 'Product':
        return [
          {
            'name': 'Sensitive Skin Cream',
            'price': '\$20',
            'description': 'For sensitive skin, hypoallergenic',
            'warnings': 'Avoid contact with eyes',
          },
        ];
      case 'Review':
        return [
          {
            'name': 'Hala Atout',
            'stars': '5',
            'feedback': 'Great app! Very user-friendly and helpful.',
          },
          {
            'name': 'John Doe',
            'stars': '4',
            'feedback': 'Good experience, but could use some improvements.',
          },
          {
            'name': 'Jane Smith',
            'stars': '3',
            'feedback': 'Average app, needs more features.',
          },
        ];
      default:
        return [];
    }
  }

  void _showAddItemDialog(BuildContext context) {
    final Map<String, TextEditingController> controllers = {};

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Text(
            "Add New Item",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: _buildInputFields(controllers),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                final newItem = <String, String>{};
                controllers.forEach((key, controller) {
                  newItem[key] = controller.text;
                });
                _addItem(newItem); // Add the new item
                Navigator.pop(context); // Close the dialog
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  List<Widget> _buildInputFields(
      Map<String, TextEditingController> controllers) {
    List<Widget> fields = [];
    switch (widget.type) {
      case 'Customer':
        fields.addAll([
          _buildTextField(controllers, 'name', 'Name'),
          _buildTextField(controllers, 'email', 'Email'),
          _buildTextField(controllers, 'address', 'Address'),
          _buildTextField(controllers, 'phoneNumber', 'Phone Number'),
          _buildTextField(controllers, 'skinType', 'Skin Type'),
          _buildTextField(controllers, 'allergies', 'Allergies'),
        ]);
        break;
      case 'Doctor':
        fields.addAll([
          _buildTextField(controllers, 'name', 'Name'),
          _buildTextField(controllers, 'email', 'Email'),
          _buildTextField(controllers, 'address', 'Address'),
          _buildTextField(controllers, 'phoneNumber', 'Phone Number'),
          _buildTextField(controllers, 'experienceYears', 'Experience Years'),
          _buildTextField(controllers, 'qualifications', 'Qualifications'),
        ]);
        break;
      case 'Company':
        fields.addAll([
          _buildTextField(controllers, 'name', 'Name'),
          _buildTextField(controllers, 'email', 'Email'),
          _buildTextField(controllers, 'address', 'Address'),
          _buildTextField(controllers, 'phoneNumber', 'Phone Number'),
        ]);
        break;
      case 'Product':
        fields.addAll([
          _buildTextField(controllers, 'name', 'Product Name'),
          _buildTextField(controllers, 'price', 'Price'),
          _buildTextField(controllers, 'description', 'Description'),
          _buildTextField(controllers, 'warnings', 'Warnings'),
        ]);
        break;
      case 'Review':
        fields.addAll([
          _buildTextField(controllers, 'name', 'User Name'),
          _buildTextField(controllers, 'stars', 'Stars (1-5)'),
          _buildTextField(controllers, 'feedback', 'Feedback'),
        ]);
        break;
    }
    return fields;
  }

  Widget _buildTextField(Map<String, TextEditingController> controllers,
      String key, String label) {
    controllers[key] = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controllers[key],
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
