import 'package:flutter/material.dart';

class SigninBody extends StatefulWidget {
  @override
  _SigninBodyState createState() => _SigninBodyState();
}

class _SigninBodyState extends State<SigninBody> {
  String _selectedRole = 'Company';  // القيمة الافتراضية هي 'Company'
  String? _selectedSkinType;  // المتغير لتخزين نوع البشرة (عند اختيار "Customer")
  TextEditingController _contactDermatitisController = TextEditingController();  // المتغير للتحكم في حقل Contact Dermatitis

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            Text(
              'Create your account',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(236, 172, 164, 1),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'User Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: DropdownButtonFormField<String>(
                    value: _selectedRole,  // القيمة الافتراضية هنا هي 'Company'
                    items: [
                      DropdownMenuItem<String>(
                        value: 'Doctor',
                        child: Text('Doctor'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Customer',
                        child: Text('Customer'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Company',
                        child: Text('Company'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedRole = value!;
                        // Reset skin type and contact dermatitis when changing role
                        if (_selectedRole != 'Customer') {
                          _selectedSkinType = null;
                          _contactDermatitisController.clear();  // Clear Contact Dermatitis field
                        }
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Sign as',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                if (_selectedRole == 'Customer') ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: DropdownButtonFormField<String>(
                      value: _selectedSkinType,  // عرض نوع البشرة إذا كان محدداً
                      items: [
                        DropdownMenuItem<String>(
                          value: 'Normal skin',
                          child: Text('Normal skin'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Oily skin',
                          child: Text('Oily skin'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Dry skin',
                          child: Text('Dry skin'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Combination skin',
                          child: Text('Combination skin'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Sensitive skin',
                          child: Text('Sensitive skin'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedSkinType = value!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Skin Type',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: TextFormField(
                      controller: _contactDermatitisController,  // التحكم في الحقل
                      decoration: InputDecoration(
                        labelText: 'Contact Dermatitis',  // الاسم المعروض للحقل
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ],
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: Color.fromRGBO(236, 172, 164, 1),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      // Handle sign up button press
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    // Handle login button press
                  },
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Already have an account? '),
                        TextSpan(
                          text: 'Log in',
                          style: TextStyle(
                            color: Color.fromRGBO(236, 172, 164, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
