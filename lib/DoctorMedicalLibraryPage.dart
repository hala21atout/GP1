import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart'; // إضافة الاستيراد للحزمة

// ignore: camel_case_types
class DoctorMedicalLibraryPage extends StatefulWidget {
  const DoctorMedicalLibraryPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _doctorMedicalLibraryState createState() => _doctorMedicalLibraryState();
}

// ignore: camel_case_types
class _doctorMedicalLibraryState extends State<DoctorMedicalLibraryPage> {
  String selectedContentType = 'Book'; // الافتراضي هو الكتاب

  // متغيرات لتخزين المدخلات
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // تغيير الخلفية إلى الأبيض
    appBar: AppBar(
        title: const Text(
          "Medical Library",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFE8C3BA), // لون مريح وأنيق
        toolbarHeight: 70,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // قسم الكتب
            const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                "Specialized Medical Books ",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildLibraryCard(
                    "Dermatology Essentials",
                    "An in-depth guide to skin diseases.",
                    Icons.book,
                  ),
                  _buildLibraryCard(
                    "Skin Cancer Management",
                    "Latest techniques in treating skin cancer.",
                    Icons.book,
                  ),
                  _buildLibraryCard(
                    "Cosmetic Dermatology",
                    "Focus on aesthetic treatments for the skin.",
                    Icons.book,
                  ),
                  _buildLibraryCard(
                    "Pediatric Dermatology",
                    "Focuses on skin conditions in children.",
                    Icons.book,
                  ),
                  _buildLibraryCard(
                    "Advanced Skin Surgery",
                    "Techniques in advanced skin surgeries.",
                    Icons.book,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // قسم المقالات البحثية
            const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                "Recent Research Articles ",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildLibraryCard(
                    "Impact of UV Exposure on Skin Aging",
                    "Study on skin aging caused by UV exposure.",
                    Icons.article,
                  ),
                  _buildLibraryCard(
                    "Skin Regeneration Research",
                    "The latest on skin regeneration techniques.",
                    Icons.article,
                  ),
                  _buildLibraryCard(
                    "New Approaches in Acne Treatment",
                    "Research on acne treatment advancements.",
                    Icons.article,
                  ),
                  _buildLibraryCard(
                    "Breakthroughs in Psoriasis Treatment",
                    "Recent advancements in psoriasis therapies.",
                    Icons.article,
                  ),
                  _buildLibraryCard(
                    "Genetics in Skin Disease",
                    "How genetics contribute to skin conditions.",
                    Icons.article,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // قسم الفيديوهات التعليمية
            const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                "Educational Videos ",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildLibraryCard(
                    "Skin Biopsy Procedure",
                    "Learn the correct method for performing a skin biopsy.",
                    Icons.play_circle_fill,
                    "https://www.youtube.com/watch?v=UWNreLJ54AU", // رابط فيديو يوتيوب
                  ),
                  _buildLibraryCard(
                    "Laser Treatments for Skin Rejuvenation",
                    "Step-by-step guide for laser skin treatments.",
                    Icons.play_circle_fill,
                    "https://www.youtube.com/watch?v=-G5hjmNT21s", // رابط فيديو يوتيوب
                  ),
                  _buildLibraryCard(
                    "Dermatological Surgery Basics",
                    "Watch detailed tutorials on basic skin surgery procedures.",
                    Icons.play_circle_fill,
                    "https://www.youtube.com/watch?v=UWNreLJ54AU", // رابط فيديو يوتيوب
                  ),
                  _buildLibraryCard(
                    "Eczema Treatment Strategies",
                    "Learn about the latest treatments for eczema.",
                    Icons.play_circle_fill,
                    "https://www.youtube.com/watch?v=UWNreLJ54AU", // رابط فيديو يوتيوب
                  ),
                  _buildLibraryCard(
                    "Acne Scar Removal Techniques",
                    "Understand methods for effective acne scar removal.",
                    Icons.play_circle_fill,
                    "https://www.youtube.com/watch?v=UWNreLJ54AU", // رابط فيديو يوتيوب
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70, // تغيير العرض
        height: 70, // تغيير الارتفاع
        child: FloatingActionButton(
          onPressed: () {
            // عند الضغط على الزر العائم، يظهر نافذة لإضافة محتوى جديد
            _showAddContentDialog(context);
          },
          backgroundColor: const Color(0xFFE8C3BA),
          child: const Icon(
            Icons.add,
            size: 40, // تكبير الأيقونة
          ),
        ),
      ),
    );
  }

  // Helper function to build cards for each content type
  Widget _buildLibraryCard(String title, String description, IconData icon,
      [String? url]) {
    return GestureDetector(
      onTap: () {
        if (url != null) {
          // _launchURL(url); // فتح الرابط إذا كان موجود
        }
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.white,
        shadowColor: const Color(0xFFE8C3BA),
        child: Container(
          width: 220,
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 50, color: const Color(0xFFE8C3BA)),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> _launchURL(String url) async {
  //   final Uri uri = Uri.parse(url);
  //   if (await canLaunch(uri.toString())) {
  //     await launch(uri.toString());
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  // Show a dialog to add new content
  void _showAddContentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Content'),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Dropdown for content type selection
                  DropdownButton<String>(
                    value: selectedContentType,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedContentType = newValue!;
                      });
                    },
                    items: <String>['Book', 'Research Article', 'Video']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                  ),
                  TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                    ),
                  ),
                  TextField(
                    controller: linkController,
                    decoration: const InputDecoration(
                      labelText: 'Link',
                    ),
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // تحقق من الحقول المدخلة
                if (titleController.text.isEmpty ||
                    descriptionController.text.isEmpty ||
                    linkController.text.isEmpty) {
                  // عرض رسالة إذا كانت الحقول فارغة
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill all fields before adding.'),
                    ),
                  );
                } else {
                  // إضافة المحتوى هنا
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
