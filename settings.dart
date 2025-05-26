import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  double fontSize = 16.0;
  bool notificationsEnabled = true;
  String selectedLanguage = 'English';
  bool sleepTimerEnabled = false;
  double playbackSpeed = 1.0;
  final TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD48D66),
        leading: IconButton(
          icon: Image.asset(
            'assets/arrow_left.png',
            width: 24,
            height: 24,
            color: const Color(0xFF5C0202),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Color(0xFF5C0202),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ClipOval(
              child: Image.asset(
                'assets/ragachikitsalogo.png',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFF1DB), Color(0xFFFFBC97)],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text("Appearance", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SwitchListTile(
              title: const Text("Dark Mode"),
              value: isDarkMode,
              onChanged: (val) {
                setState(() {
                  isDarkMode = val;
                });
              },
            ),
            ListTile(
              title: const Text("Font Size"),
              subtitle: Slider(
                value: fontSize,
                min: 12,
                max: 24,
                divisions: 6,
                label: "${fontSize.toInt()}",
                onChanged: (val) {
                  setState(() {
                    fontSize = val;
                  });
                },
              ),
            ),
            const Divider(),
            const Text("Playback", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SwitchListTile(
              title: const Text("Sleep Timer"),
              value: sleepTimerEnabled,
              onChanged: (val) {
                setState(() {
                  sleepTimerEnabled = val;
                });
              },
            ),
            ListTile(
              title: const Text("Playback Speed"),
              trailing: DropdownButton<double>(
                value: playbackSpeed,
                items: [1.0, 1.25, 1.5].map((speed) {
                  return DropdownMenuItem(value: speed, child: Text("${speed}x"));
                }).toList(),
                onChanged: (val) {
                  if (val != null) {
                    setState(() {
                      playbackSpeed = val;
                    });
                  }
                },
              ),
            ),
            const Divider(),
            const Text("Preferences", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SwitchListTile(
              title: const Text("Daily Raaga Reminder"),
              value: notificationsEnabled,
              onChanged: (val) {
                setState(() {
                  notificationsEnabled = val;
                });
              },
            ),
            ListTile(
              title: const Text("Language"),
              trailing: DropdownButton<String>(
                value: selectedLanguage,
                items: ['English', 'Kannada', 'Hindi'].map((lang) {
                  return DropdownMenuItem(value: lang, child: Text(lang));
                }).toList(),
                onChanged: (val) {
                  if (val != null) {
                    setState(() {
                      selectedLanguage = val;
                    });
                  }
                },
              ),
            ),
            const Divider(),
            const Text("Support", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: _feedbackController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Write your feedback here...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
            SizedBox(
              width: 70, // Adjust this value to control the button's width
              child: ElevatedButton(
                onPressed: () {
                  String feedback = _feedbackController.text;
                  print("Feedback submitted: $feedback");
                  _feedbackController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Feedback submitted!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD48D66),
                  foregroundColor: const Color(0xFF5C0202),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text("Submit Feedback"),
              ),
            ),
            ListTile(
              title: const Text("Privacy Policy"),
              onTap: () {
                // Navigate to policy page
              },
            ),
          ],
        ),
      ),
    );
  }
}
