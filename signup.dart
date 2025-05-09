import 'package:flutter/material.dart';
import 'login.dart'; // Import the LoginPage
import 'home.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Use full screen width
        height: double.infinity, // Use full screen height
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFF1DB), Color(0xFFFFBC97)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            // Use SingleChildScrollView for scrollable content
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 80),
                const Text(
                  'Create an account',
                  style: TextStyle(
                    color: Color(0xFF5C0202),
                    fontFamily: 'Inter',
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Start your healing journey!',
                  style: TextStyle(
                    color: Color.fromRGBO(106, 24, 5, 0.79),
                    fontFamily: 'Inter',
                    fontSize: 19,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 30),
                // Username Input
                _buildInputField(
                  hintText: 'Enter your Username',
                  label: 'Username',
                ),
                const SizedBox(height: 20),
                // Email Input
                _buildInputField(
                  hintText: 'Enter your Email',
                  label: 'Email',
                ),
                const SizedBox(height: 20),
                // Phone Number Input
                _buildInputField(
                  hintText: 'Enter your Phone Number',
                  label: 'Phone Number',
                ),
                const SizedBox(height: 20),
                // Password Input
                _buildInputField(
                  hintText: 'Enter your Password',
                  label: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                // Confirm Password Input
                _buildInputField(
                  hintText: 'Confirm Password',
                  label: 'Confirm Password',
                  obscureText: true,
                ),
                const SizedBox(height: 40),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HomePage()), // Navigate to HomePage
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      const Color.fromRGBO(212, 141, 102, 0.59),
                      foregroundColor: const Color(0xFF5c0202),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 15), // Adjusted padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      elevation: 4,
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 28, fontFamily: 'Inter'),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(
                        color: Color(0xFF5C0202),
                        fontFamily: 'Inter',
                        fontSize: 19,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  LoginPage()), // Navigate to Login
                        );
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xFF0509D2),
                          fontFamily: 'Inter',
                          fontSize: 21,
                          fontWeight: FontWeight.normal,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Refactored Input Field Widget
  Widget _buildInputField({
    required String hintText,
    required String label,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: const Color(0xFFFFF1DB),
            border: Border.all(
              color: const Color(0xFF6A1805),
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: TextField(
              obscureText: obscureText,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Color.fromRGBO(106, 24, 5, 0.79),
                  fontFamily: 'Inter',
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF5C0202),
            fontFamily: 'Inter',
            fontSize: 20,
            fontWeight: FontWeight.normal,
            height: 1,
          ),
        ),
      ],
    );
  }
}

