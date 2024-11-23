import 'package:flutter/material.dart';
import 'components/signin_body.dart';

class Signin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: PreferredSize(
          preferredSize: Size.fromHeight(50), 
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 22),
              child: Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 32, 
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SigninBody(),
    );
  }
}
