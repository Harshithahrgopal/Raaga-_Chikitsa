import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'login.dart'; // Import your LoginPage
import 'home.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Controllers for inputs
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _showSnackBar(String message, [Color color = Colors.red]) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: color),
    );
  }

  Future<void> _signUp() async {
    final username = usernameController.text.trim();
    final email = emailController.text.trim();
    final phone = phoneController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (username.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showSnackBar('Please fill all fields');
      return;
    }
    if (password != confirmPassword) {
      _showSnackBar('Passwords do not match');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Replace with your XAMPP IP or localhost IP if testing on emulator or device
      var url = Uri.parse('http://192.168.0.101/signup.php');

      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'username': username,
          'email': email,
          'phone': phone,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        _showSnackBar('Signup successful!', Colors.green);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginPage()));
      } else {
        var data = jsonDecode(response.body);
        _showSnackBar(data['error'] ?? 'Signup failed');
      }
    } catch (e) {
      _showSnackBar('Error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
                  controller: usernameController,
                  hintText: 'Enter your Username',
                  label: 'Username',
                ),
                const SizedBox(height: 20),
                // Email Input
                _buildInputField(
                  controller: emailController,
                  hintText: 'Enter your Email',
                  label: 'Email',
                ),
                const SizedBox(height: 20),
                // Phone Number Input
                _buildInputField(
                  controller: phoneController,
                  hintText: 'Enter your Phone Number',
                  label: 'Phone Number',
                ),
                const SizedBox(height: 20),
                // Password Input
                _buildInputField(
                  controller: passwordController,
                  hintText: 'Enter your Password',
                  label: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                // Confirm Password Input
                _buildInputField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  label: 'Confirm Password',
                  obscureText: true,
                ),
                const SizedBox(height: 40),

                Center(
                  child: _isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                    onPressed: _signUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(212, 141, 102, 0.59),
                      foregroundColor: const Color(0xFF5c0202),
                      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
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
                          MaterialPageRoute(builder: (context) => LoginPage()),
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

  // Modified _buildInputField with controller
  Widget _buildInputField({
    required TextEditingController controller,
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
              controller: controller,
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
