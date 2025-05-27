import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Important for gradient to show
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.centerLeft,
            colors: [
              Color.fromRGBO(255, 188, 151, 1),
              Color.fromRGBO(255, 241, 219, 1),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Custom Header replaced with your Container style
              Container(
                height: 69,
                color: const Color.fromRGBO(212, 141, 102, 0.95),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/arrow_left.png',
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Profile',
                            style: TextStyle(
                              color: Color.fromRGBO(92, 2, 2, 1),
                              fontFamily: 'Inter',
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ClipOval(
                      child: Image.asset(
                        'assets/ragachikitsalogo.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),

              // Scrollable Profile Body
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile Header
                      Center(
                        child: Column(
                          children: [
                            const CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/user.png'),
                            ),
                            const SizedBox(height: 10),
                            const Text("Harshitha", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            const Text("harshitha@example.com", style: TextStyle(color: Colors.grey)),
                            TextButton(
                              onPressed: () {
                                // Edit profile function
                              },
                              child: const Text("Edit Profile"),
                            )
                          ],
                        ),
                      ),

                      const Divider(height: 40),

                      // Listening Stats
                      const Text("Listening Stats", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      _buildStatRow("Total Raagas Listened", "132"),
                      _buildStatRow("Most Played Raaga", "Bhairavi"),
                      _buildStatRow("Listening Streak", "6 days"),

                      const Divider(height: 40),

                      // Preferences
                      const Text("My Preferences", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      _buildStatRow("Preferred Language", "English"),
                      _buildStatRow("Focus Area", "Stress Relief"),
                      _buildStatRow("Best Listening Time", "Evening"),

                      const Divider(height: 40),

                      // Quick Access
                      const Text("Quick Access", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      ListTile(
                        leading: const Icon(Icons.favorite),
                        title: const Text("My Favorites"),
                        onTap: () {
                          // Navigate to favorites
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.history),
                        title: const Text("Listening History"),
                        onTap: () {
                          // Navigate to history
                        },
                      ),

                      const Divider(height: 40),

                      // App Actions
                      const Text("Account & Support", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ListTile(
                        leading: const Icon(Icons.feedback),
                        title: const Text("Send Feedback"),
                        onTap: () {
                          // Feedback screen
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.logout),
                        title: const Text("Logout"),
                        onTap: () {
                          // Logout logic
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
