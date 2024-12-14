import 'package:flutter/material.dart';
import 'Companyhomepage.dart';

class Addproduct extends StatefulWidget {
  const Addproduct({super.key});

  @override
  State<Addproduct> createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {
  // Variables for category and sub-category
  String? selectedCategory;
  String? selectedSubCategory;

  // Sub-category options based on category
  final Map<String, List<String>> subCategoryOptions = {
    'Makeup': [
      'Eye brows',
      'Eye shadow',
      'Foundation',
      'Highlighter',
      'Eye liner',
      'Lip stick',
      'Nail Powder',
      'Prsh',
      'Mascara',
      'Blush'
    ],
    'Skin Care': [
      'Face Cream',
      'Toner',
      'Serum',
      'Moisturizer',
      'Mask',
      'Sun Screen',
      'Exfoliator',
      'Eye Cream',
      'Body Lotion',
      'Lip Balm'
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Product",
          style: TextStyle(
            fontSize: 26,
            color: Colors.black38,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFE8C3BA),
        toolbarHeight: 70,
      ),
      backgroundColor: Colors.white, // Set the background to white
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Name Field
              const Text(
                "Product Name",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: 'Enter product name',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16),

              // Product Image Upload
              const Text(
                "Product Image",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: () {
                  // Image upload logic here
                },
                icon: const Icon(
                  Icons.add_photo_alternate,
                  color: Colors.white, // جعل الأيقونة بيضاء
                ),
                label: const Text(
                  "Upload Image",
                  style: TextStyle(color: Colors.white), // جعل النص أبيض
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE8C3BA),
                  minimumSize:
                      const Size(double.infinity, 50), // Full-width button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Product Price Field
              const Text(
                "Price",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: 'Enter product price',
                  prefixText: '₪',
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              // Product Description Field
              const Text(
                "Description",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: 'Enter product description',
                  filled: true,
                  fillColor: Colors.white,
                ),
                minLines: 3,
                maxLines: 4,
              ),
              const SizedBox(height: 16),

              // Sensitive Warnings Field
              const Text(
                "Sensitive Warnings",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: 'Enter warnings if applicable',
                  filled: true,
                  fillColor: Colors.white,
                ),
                minLines: 1,
                maxLines: 3,
              ),
              const SizedBox(height: 16),

              // Product Category Dropdown
              const Text(
                "Category",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                items: subCategoryOptions.keys
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value;
                    selectedSubCategory = null; // Reset sub-category
                  });
                },
                value: selectedCategory,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                hint: const Text('Select a category'),
              ),
              const SizedBox(height: 16),

              // Sub-category Dropdown
              if (selectedCategory != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sub-Category",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      items: subCategoryOptions[selectedCategory]!
                          .map(
                            (subCategory) => DropdownMenuItem(
                              value: subCategory,
                              child: Text(subCategory),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedSubCategory = value;
                        });
                      },
                      value: selectedSubCategory,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      hint: const Text('Select a sub-category'),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),

              // Product Quantity Field
              const Text(
                "Quantity",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: 'Enter product quantity',
                  prefixIcon: const Icon(Icons.numbers),
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 32),

              // Save Product Button
              ElevatedButton(
                onPressed: () {
                  // Save product logic here
                },
                child: const Text(
                  "Save Product",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE8C3BA),
                  minimumSize:
                      const Size(double.infinity, 50), // Full-width button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Cancel Button
              TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const Companyhomepage(), // استدعاء صفحة الهوم
                    ),
                    (Route<dynamic> route) => false, // إزالة الصفحات السابقة
                  );
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
