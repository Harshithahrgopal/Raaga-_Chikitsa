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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
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
          ListTile(
            title: const Text("Feedback"),
            onTap: () {
              // Open feedback form
            },
          ),
          ListTile(
            title: const Text("Privacy Policy"),
            onTap: () {
              // Navigate to policy page
            },
          ),
        ],
      ),
    );
  }
}
