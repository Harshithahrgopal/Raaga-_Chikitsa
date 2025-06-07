import 'package:flutter/material.dart';
import 'melodylist.dart';
import 'favorite.dart';
import 'raagarelief.dart';
import 'searchtime.dart';
import 'package:provider/provider.dart';
import 'favorites_provider.dart';
import 'package:audioplayers/audioplayers.dart';
import 'settings.dart';
import 'about.dart';
import 'profile.dart';// Import the SettingsPage

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;

  Future<void> playRaaga() async {
    try {
      await audioPlayer.play(AssetSource('audio/M3/M3(4).wav'));
      setState(() {
        isPlaying = true;
      });
    } catch (e) {
      print('Error playing audio: $e');
      setState(() {
        isPlaying = false;
      });
    }
  }

  Future<void> stopRaaga() async {
    await audioPlayer.stop();
    setState(() {
      isPlaying = false;
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color brownColor = Color(0xFF5C0202);
    const Color lightBrownColor = Color(0xFF6A1805);
    const List<Color> orangeGradientColors = [
      Color(0xFFFFBC97),
      Color(0xFFFFF1DB),
    ];
    const TextStyle textStyle12 = TextStyle(
      color: brownColor,
      fontSize: 12,
      fontWeight: FontWeight.normal,
      height: 1,
    );
    const TextStyle textStyle13 = TextStyle(
      color: lightBrownColor,
      fontSize: 13,
      fontWeight: FontWeight.normal,
      height: 1,
    );
    const TextStyle textStyle16 = TextStyle(
      color: brownColor,
      fontSize: 16,
      fontWeight: FontWeight.normal,
      height: 1,
    );
    const TextStyle textStyle19 = TextStyle(
      color: Color(0xFF691705),
      fontSize: 19,
      fontWeight: FontWeight.normal,
      height: 1,
    );
    const TextStyle textStyle20 = TextStyle(
      color: brownColor,
      fontSize: 20,
      fontWeight: FontWeight.normal,
      height: 1,
    );
    const TextStyle textStyle36 = TextStyle(
      color: brownColor,
      fontSize: 36,
      fontWeight: FontWeight.normal,
      height: 1,
    );
    const TextStyle arrowTextStyle = TextStyle(
      color: lightBrownColor,
      fontSize: 15,
      fontWeight: FontWeight.normal,
      height: 1,
    );
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: screenSize.width,
            height: screenSize.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                begin: Alignment(6.123234262925839e-17, 1),
                end: Alignment(-1, 6.123234262925839e-17),
                colors: orangeGradientColors,
              ),
            ),
            child: Column(
              children: <Widget>[
                // Logo and Title Section
                Padding(
                  padding: const EdgeInsets.only(top: 41, left: 22, right: 22),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/ragachikitsalogo.png',
                          semanticLabel: 'ragachikitsalogo',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 13),
                      const Text(
                        'Raaga Chikitsa',
                        textAlign: TextAlign.left,
                        style: textStyle36,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 68, right: 68),
                  child: const Text(
                    'Where music meets wellness!',
                    textAlign: TextAlign.center,
                    style: textStyle19,
                  ),
                ),
                const SizedBox(height: 20),

                // Main Content Area
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Soothing Raaga of the Day', style: textStyle20),
                      const SizedBox(height: 21),
                      Container(
                        width: double.infinity,
                        height: 216,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: brownColor, width: 2),
                          image: const DecorationImage(
                            image: AssetImage('assets/Rectangle25.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 30),
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: playRaaga, // Call playRaaga when the image is tapped
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      margin: const EdgeInsets.only(right: 9),
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/Image2.png'),
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'Gaanamurthi Raaga',
                                    style: textStyle20,
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: isPlaying ? stopRaaga : playRaaga,
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      margin: const EdgeInsets.only(right: 20),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(isPlaying
                                              ? 'assets/Icons8stop50.png'
                                              : 'assets/Icons8play501.png'),
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Positioned(
                                top: 65,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 8),
                                    SizedBox(
                                      width: 300,
                                      child: Text(
                                        '> Reduces stress and calms the mind.',
                                        style: textStyle13,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    SizedBox(
                                      width: 300,
                                      child: Text(
                                        '> Lowers heart rate and blood pressure.',
                                        style: textStyle13,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    SizedBox(
                                      width: 300,
                                      child: Text(
                                        '> Promotes deep breathing and lung health.',
                                        style: textStyle13,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    SizedBox(
                                      width: 300,
                                      child: Text(
                                        '> Promotes emotional stability.',
                                        style: textStyle13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Wellness Tools Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      const Text('Wellness Tools', style: textStyle20),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildWellnessButton(
                            text1: 'Search Raagas ',
                            text2: 'by Time',
                            textStyle: textStyle16,
                            image: '',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SearchTimeScreen()),
                              );
                            },
                          ),
                          _buildWellnessButton(
                            text1: 'Melody List',
                            text2: '',
                            textStyle: textStyle16,
                            image: '',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const MelodyList()),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildWellnessButton(
                            text1: 'Favorite Raaga ',
                            text2: 'Playlist',
                            textStyle: textStyle16,
                            image: '',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Favoriteplaylist()),
                              );
                            },
                          ),
                          _buildWellnessButton(
                            text1: 'Get Raaga for',
                            text2: 'Relief',
                            textStyle: textStyle16,
                            image: '',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const RaagaRemediesScreen()),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Text(
                        'Traditional wisdom associates raagas with ',
                        textAlign: TextAlign.center,
                        style: textStyle12,
                      ),
                      Text(
                        'specific times for optimal benefits.',
                        textAlign: TextAlign.center,
                        style: textStyle12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bottom Navigation placed at the very bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomNavigation(),
          ),
        ],
      ),
    );
  }

  // Helper method for creating the wellness buttons
  Widget _buildWellnessButton(
      {required String text1,
        required String text2,
        required TextStyle textStyle,
        String image = '',
        VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 145,
        height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, 4),
                blurRadius: 4),
          ],
          color: const Color(0xFFD48D66),
          border: Border.all(color: const Color(0xFF691705), width: 1),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (image.isNotEmpty)
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              Text(text1, style: textStyle),
              if (text2.isNotEmpty) Text(text2, style: textStyle),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method for bottom navigation
  Widget _buildBottomNavigation() {
    const TextStyle textStyle12 = TextStyle(
      color: Color(0xFF5C0202),
      fontSize: 12,
      fontWeight: FontWeight.normal,
      height: 1,
    );
    return Container(
      height: 100,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavigationItem(
            icon: 'assets/Icons8home481.png',
            label: 'Home',
            textStyle: textStyle12,
          ),
          _buildNavigationItem(
            icon: 'assets/Icons8about241.png',
            label: 'About',
            textStyle: textStyle12,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutScreen()),
              );
            },
          ),
          _buildNavigationItem(
            icon: 'assets/Icons8settings5011.png',
            label: 'Settings',
            textStyle: textStyle12,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
          _buildNavigationItem(
            icon: 'assets/Icons8usericon241.png',
            label: 'Profile',
            textStyle: textStyle12,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
    );
  }

  // Helper method for building a navigation item
  Widget _buildNavigationItem(
      {required String icon, required String label, required TextStyle textStyle, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap, // Use the onTap callback here
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(icon),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Text(label, style: textStyle),
        ],
      ),
    );
  }
}
