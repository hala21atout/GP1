import 'package:flutter/material.dart';

class Ordermanagement extends StatefulWidget {
  const Ordermanagement({super.key});

  @override
  State<Ordermanagement> createState() => _OrderManagementState();
}

class _OrderManagementState extends State<Ordermanagement> {
  // Sample order data with customer details
  final List<Map<String, dynamic>> orders = [
    {
      'customerName': 'John Doe',
      'products': 'Product A, Product B',
      'totalPrice': 150.0,
      'orderDate': '2024-12-14',
      'status': 'Pending',
      'location': 'Ramallah',
      'phone': '0591234567', // Added customer phone number
    },
    {
      'customerName': 'Jane Smith',
      'products': 'Product C',
      'totalPrice': 70.0,
      'orderDate': '2024-12-13',
      'status': 'Completed',
      'location': 'Gaza Strip',
      'phone': '0592345678', // Added customer phone number
    },
    {
      'customerName': 'Alice Brown',
      'products': 'Product D, Product E, Product F',
      'totalPrice': 220.0,
      'orderDate': '2024-12-12',
      'status': 'Pending',
      'location': 'Nablus',
      'phone': '0593456789', // Added customer phone number
    },
    {
      'customerName': 'Default Customer',
      'products': 'Product X, Product Y',
      'totalPrice': 100.0,
      'orderDate': '2024-12-11',
      'status': 'Pending',
      'location': 'Bethlehem',
      'phone': '0594567890', // Added customer phone number
    },
  ];

  // Possible statuses: Pending or Completed
  final List<String> statuses = ['Pending', 'Completed'];

  @override
  Widget build(BuildContext context) {
    // Separate orders into pending and completed
    List<Map<String, dynamic>> pendingOrders =
        orders.where((order) => order['status'] == 'Pending').toList();
    List<Map<String, dynamic>> completedOrders =
        orders.where((order) => order['status'] == 'Completed').toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Order Management",
          style: TextStyle(
            fontSize: 26,
            color: Colors.black38,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFE8C3BA),
        toolbarHeight: 70, // Increase AppBar height
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ...pendingOrders.map((order) => buildOrderCard(order)).toList(),
            ...completedOrders
                .map((order) => buildOrderCard(order, isCompleted: true))
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget buildOrderCard(Map<String, dynamic> order,
      {bool isCompleted = false}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      color: isCompleted ? Colors.green[50] : Colors.white, // Background color change for completed orders
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Customer name
            Text(
              'Customer: ${order['customerName']}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isCompleted ? Colors.green : Colors.black, // Different color for completed orders
              ),
            ),
            const SizedBox(height: 8),

            // Customer location
            Text(
              'Location: ${order['location']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),

            // Customer phone number
            Text(
              'Phone: ${order['phone']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),

            // Products purchased
            Text(
              'Products: ${order['products']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),

            // Total price
            Text(
              'Total Price: ₪${order['totalPrice'].toStringAsFixed(1)}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),

            // Order date
            Text(
              'Order Date: ${order['orderDate']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            // Status dropdown
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Status:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DropdownButton<String>(
                  value: order['status'],
                  items: statuses.map((status) {
                    return DropdownMenuItem<String>(
                      value: status,
                      child: Text(status),
                    );
                  }).toList(),
                  onChanged: (newStatus) {
                    setState(() {
                      order['status'] = newStatus!;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
