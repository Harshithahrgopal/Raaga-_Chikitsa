import 'package:flutter/material.dart';
import 'home.dart';
import 'signup.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginUser() async {
    var url = Uri.parse('http://192.168.0.101/login.php'); // change IP if needed

    final response = await http.post(url, body: {
      "email": emailController.text,
      "password": passwordController.text,
    });

    var data = json.decode(response.body);

    if (data['success']) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(data['message'])),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: double.infinity,
            height: constraints.maxHeight,
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
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 91),
                      const Text(
                        'Welcome Back!',
                        style: TextStyle(
                          color: Color(0xFF5C0202),
                          fontFamily: 'Inter',
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Reconnect with wellness',
                        style: TextStyle(
                          color: Color.fromRGBO(106, 24, 5, 0.79),
                          fontFamily: 'Inter',
                          fontSize: 19,
                        ),
                      ),
                      const SizedBox(height: 52),
                      // Email Input
                      inputField("Enter your Email", emailController, false),
                      const SizedBox(height: 12),
                      labelText("Email"),
                      const SizedBox(height: 32),
                      // Password Input
                      inputField("Enter your Password", passwordController, true),
                      const SizedBox(height: 12),
                      labelText("Password"),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Color(0xFF5C0202),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 47),
                      Center(
                        child: ElevatedButton(
                          onPressed: loginUser,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(212, 141, 102, 0.59),
                            foregroundColor: const Color(0xFF5c0202),
                            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 28, fontFamily: 'Inter'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don’t have an account? ',
                            style: TextStyle(fontSize: 19, color: Color(0xFF5C0202)),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignUpPage()),
                              );
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(color: Color(0xFF0509D2), fontSize: 21),
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
        },
      ),
    );
  }

  Widget inputField(String hint, TextEditingController controller, bool obscure) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        color: const Color(0xFFFFF1DB),
        border: Border.all(color: const Color(0xFF6A1805), width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 14.0),
        child: TextField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: const TextStyle(
              color: Color.fromRGBO(106, 24, 5, 0.79),
              fontFamily: 'Inter',
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }

  Widget labelText(String label) {
    return Text(
      label,
      style: const TextStyle(
        color: Color(0xFF5C0202),
        fontFamily: 'Inter',
        fontSize: 20,
      ),
    );
  }
}
