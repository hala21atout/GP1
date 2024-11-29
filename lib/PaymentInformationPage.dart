// ignore: file_names
import 'package:flutter/material.dart';

class PaymentInformationPage extends StatefulWidget {
  const PaymentInformationPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaymentInformationPageState createState() => _PaymentInformationPageState();
}

class _PaymentInformationPageState extends State<PaymentInformationPage> {
  final _formKey = GlobalKey<FormState>();
  // String? _cardNumber;
  String? _expiryDate;
  // String? _cvv;
  String? _paymentMethod = 'Credit Card'; // Default payment method

  // String? _paypalEmail;
  // String? _googlePhone;
  // String? _appleId;

  // List of payment methods
  final List<String> _paymentMethods = [
    'Credit Card',
    'PayPal',
    'Google Pay',
    'Apple Pay',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Payment Information",
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
                "Enter your payment details",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),

              // Payment Method Dropdown
              DropdownButtonFormField<String>(
                value: _paymentMethod,
                items: _paymentMethods.map((String method) {
                  return DropdownMenuItem<String>(
                    value: method,
                    child: Row(
                      children: [
                        method == 'Credit Card'
                            ? const Icon(Icons.credit_card)
                            : method == 'PayPal'
                                ? const Icon(Icons.payments)
                                : method == 'Google Pay'
                                    ? const Icon(Icons.phone_android)
                                    : const Icon(Icons.apple),
                        const SizedBox(width: 8),
                        Text(method),
                      ],
                    ),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Payment Method',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _paymentMethod = value;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Credit Card Number (Only visible if 'Credit Card' is selected)
              if (_paymentMethod == 'Credit Card') ...[
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Card Number',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.credit_card),
                  ),
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    // _cardNumber = value;
                  },
                ),
                const SizedBox(height: 20),
              ],

              // Expiry Date
              Row(
                children: [
                  // Month
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'MM',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      onSaved: (value) {
                        _expiryDate = value ?? '';
                      },
                    ),
                  ),
                  const SizedBox(width: 8),

                  const SizedBox(width: 8),

                  // Year (YY)
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'YY',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      onSaved: (value) {
                        _expiryDate = (_expiryDate ?? '') + value!;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // CVV
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'CVV',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  // _cvv = value;
                },
              ),

              // PayPal Specific Details (Visible if PayPal is selected)
              if (_paymentMethod == 'PayPal') ...[
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'PayPal Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    // _paypalEmail = value;
                  },
                ),
              ],

              // Google Pay Specific Details (Visible if Google Pay is selected)
              if (_paymentMethod == 'Google Pay') ...[
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                  onSaved: (value) {
                    // _googlePhone = value;
                  },
                ),
              ],

              // Apple Pay Specific Details (Visible if Apple Pay is selected)
              if (_paymentMethod == 'Apple Pay') ...[
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Apple ID',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.account_circle),
                  ),
                  keyboardType: TextInputType.text,
                  onSaved: (value) {
                    // _appleId = value;
                  },
                ),
              ],

              const SizedBox(height: 30),

              // Save Payment Info Button
              // Save Payment Info Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Save form data
                      _formKey.currentState?.save();

                      // Proceed with payment process
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Payment Successful'),
                            content: Text(
                                'Your payment info for $_paymentMethod has been saved successfully.'),
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
                    'Save Payment Info',
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
