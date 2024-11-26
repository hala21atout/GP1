import 'package:flutter/material.dart';
import 'package:gp1/screens/LoginScreen/login.dart';
import 'package:gp1/screens/SigninScreen/signin.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Changed background color to white
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 70), // Reduced space before the logo

            // Logo
            Image.asset(
              'assets/logo1.png',
              height: 350, // Logo size
            ),

            const SizedBox(height: 2), // Reduced space after logo

            // App description with custom font and black text
            const Text(
              'Welcome to DR Glowy, your go-to app for all things beauty!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black38, // Text in black
              ),
            ),

            const SizedBox(height: 40), // Reduced space between description and buttons

            // Login Button with increased size
            SizedBox(
              width: 250, // Increased width for the button
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Login()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE8C3BA), // Set color to (236, 172, 164, 1)
                  padding: const EdgeInsets.symmetric(vertical: 15), // Increased height for button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white, // White text for the button
                    fontWeight: FontWeight.w900, // Make text bolder
                    fontSize: 22, // Increased font size for the text
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20), // Space between buttons

            // Sign Up Button with increased size
            SizedBox(
              width: 250, // Increased width for the button
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signin()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE8C3BA), // Set color to (236, 172, 164, 1)
                  padding: const EdgeInsets.symmetric(vertical: 15), // Increased height for button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white, // White text for the button
                    fontWeight: FontWeight.w900, // Make text bolder
                    fontSize: 22, // Increased font size for the text
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Continue as Guest Button (Text Only) with increased font size
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Home Page')),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFFE8C3BA), // Set text color to (236, 172, 164, 1)
              ),
              child: const Text(
                'Continue as Guest',
                style: TextStyle(
                  fontSize: 18, // Increased font size for text
                  fontWeight: FontWeight.w600, // Make text bolder
                ),
              ),
            ),

            const Spacer(), // Push everything upwards to center the content
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
