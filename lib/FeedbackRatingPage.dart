import 'package:flutter/material.dart';

class FeedbackRatingPage extends StatefulWidget {
  const FeedbackRatingPage({super.key});

  @override
  _FeedbackRatingPageState createState() => _FeedbackRatingPageState();
}

class _FeedbackRatingPageState extends State<FeedbackRatingPage> {
  final _formKey = GlobalKey<FormState>();
  double _rating = 0;
  String? _feedback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Feedback & Rating",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFE8C3BA),
        toolbarHeight: 70,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "We value your feedback!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),

              // Rating Section (Star Rating)
              const Text(
                "Rate your experience",
                style: TextStyle(fontSize: 19),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      index < _rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 40, // تغيير الحجم هنا
                    ),
                    onPressed: () {
                      setState(() {
                        _rating = index + 1.0;
                      });
                    },
                  );
                }),
              ),

              const SizedBox(height: 20),

              // Feedback Text Field
              const Text(
                "Leave a comment (optional)",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextFormField(
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: "Write your feedback here...",
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  _feedback = value;
                },
              ),
              const SizedBox(height: 20),

              // Submit Feedback Button
              Center( // إضافة Center هنا لتوسيط الزر
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Save form data
                      _formKey.currentState?.save();

                      // Proceed with saving or submitting feedback
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Feedback Submitted '),
                            content: Text(
                              'Thank you for your feedback! You rated $_rating stars.\n\nFeedback: $_feedback',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  // ignore: sort_child_properties_last
                  child: const Text(
                    'Submit Feedback & Rating',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19), // تغيير لون الكتابة إلى الأبيض
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 28), // تقليل البادينج
                    minimumSize: const Size(240, 65), // تحديد عرض الزر
                    backgroundColor: const Color(0xFFE8C3BA),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
