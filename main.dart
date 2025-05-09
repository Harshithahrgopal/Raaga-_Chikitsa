import 'package:flutter/material.dart';
import 'login.dart'; // Import the LoginPage
import 'signup.dart';// Import the SignUpPage
import 'home.dart';
import 'dart:math' as math;

void main() {
  runApp(RaagaChikitsaApp());
}

class RaagaChikitsaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raaga Chikitsa',
      debugShowCheckedModeBanner: false,
      home: RaagaChikitsaHomePage(),
    );
  }
}

class RaagaChikitsaHomePage extends StatefulWidget {
  @override
  _RaagaChikitsaHomePageState createState() => _RaagaChikitsaHomePageState();
}

class _RaagaChikitsaHomePageState extends State<RaagaChikitsaHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: Duration(seconds: 20))
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFF1DB), Color(0xFFFFBC97)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Raaga Chikitsa',
                  style: TextStyle(
                    color: Color(0xFF5C0202),
                    fontFamily: 'Architects Daughter',
                    fontSize: 48,
                  ),
                ),
                const SizedBox(height: 30),
                RotationTransition(
                  turns: _controller,
                  child: SizedBox(
                    // Added SizedBox for size control
                    width: 320,
                    height: 320,
                    child: Image.asset('assets/main_logo.png'), // Added Image
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LoginPage()), // Navigate to LoginPage
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    const Color.fromRGBO(212, 141, 102, 0.59),
                    foregroundColor: const Color(0xFF5c0202),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    elevation: 4,
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(fontSize: 28, fontFamily: 'Inter'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Your journey to peace begins with a raga',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF691705),
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

