import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // Use LayoutBuilder to get the available height
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: double.infinity, // Use full width
            height: constraints.maxHeight, // Use full height
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFFF1DB), Color(0xFFFFBC97)],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView( // Make the content scrollable
                child: ConstrainedBox( // Constrain the box to min height
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
                          fontWeight: FontWeight.normal,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Reconnect with wellness',
                        style: TextStyle(
                          color: Color.fromRGBO(106, 24, 5, 0.79),
                          fontFamily: 'Inter',
                          fontSize: 19,
                          fontWeight: FontWeight.normal,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 52),
                      // Email Input
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
                        child: const Padding(
                          padding: EdgeInsets.only(left: 14.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your Email',
                              hintStyle: TextStyle(
                                color: Color.fromRGBO(106, 24, 5, 0.79),
                                fontFamily: 'Inter',
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Email',
                        style: TextStyle(
                          color: Color(0xFF5C0202),
                          fontFamily: 'Inter',
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Password Input
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
                        child: const Padding(
                          padding: EdgeInsets.only(left: 14.0),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your Password',
                              hintStyle: TextStyle(
                                color: Color.fromRGBO(106, 24, 5, 0.79),
                                fontFamily: 'Inter',
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Password',
                        style: TextStyle(
                          color: Color(0xFF5C0202),
                          fontFamily: 'Inter',
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            //  Handle forgot password
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Color(0xFF5C0202),
                              fontFamily: 'Inter',
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 47),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            //  Handle Login
                          },
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
                              // Navigate to sign up
                            },
                            child: const Text(
                              'Sign Up',
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
        },
      ),
    );
  }
}

