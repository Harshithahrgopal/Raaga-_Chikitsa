import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Define constants
    const Color brownColor = Color(0xFF5C0202);
    const Color lightBrownColor = Color(0xFF6A1805);
    const List<Color> orangeGradientColors = [
      Color(0xFFFFF1DB),
      Color(0xFFFFBC97)
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
      color: Color(0xFF691705), // Changed from RGBA
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
      body: Container(
        width: screenSize.width, // Use screen width
        height: screenSize.height, // Use screen height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            begin: Alignment(
                6.123234262925839e-17, 1), // Alignment.centerLeft
            end: Alignment(
                -1, 6.123234262925839e-17), // Alignment.centerRight
            colors: orangeGradientColors,
          ),
        ),
        child: Stack(
          children: <Widget>[
            // Logo and Title Section
            Positioned(
              top: 41,
              left: 28,
              child: Image.asset(
                'assets/ragachikitsalogo.png',
                semanticLabel: 'ragachikitsalogo',
                width: 69, // Set width as in original
                height: 40, // Set height as in original
              ),
            ),
            Positioned(
              top: 41,
              left: 97,
              child: const Text(
                'Raaga Chikitsa',
                textAlign: TextAlign.left,
                style: textStyle36,
              ),
            ),
            Positioned(
              top: 91,
              left: 80,
              child: const Text(
                ' Where music meets wellness!',
                textAlign: TextAlign.left,
                style: textStyle19,
              ),
            ),

            // Main Content Area
            Positioned(
              top: 160,
              left: 32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align text left
                children: [
                  const Text('Soothing Raaga of the Day', style: textStyle20),
                  const SizedBox(height: 21),
                  Container(
                    width: 331,
                    height: 216,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: brownColor, width: 2),
                      image: const DecorationImage(
                        image: AssetImage(
                            'assets/Rectangle25.png'), // Use the provided image
                        fit: BoxFit.fill, // Use BoxFit.fill to match the design
                      ),
                    ),
                    child: Stack( // Use Stack to position the play button
                      children: [
                        Positioned(
                          top: 10, // Adjusted from 78 to better fit image.
                          left: 15,  // Adjusted from 49 to better fit image.
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Gaanamurthi Raaga',
                                  style: textStyle20),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: 200, // added a width constraint
                                child: const Text(
                                  '> Reduces stress and calms the mind.',
                                  style: textStyle13,
                                ),
                              ),
                              SizedBox(
                                width: 200, // added a width constraint
                                child: const Text(
                                  '> Lowers heart rate and blood pressure.',
                                  style: textStyle13,
                                ),
                              ),
                              SizedBox(
                                width: 200, // added a width constraint
                                child: const Text(
                                    '> Promotes deep breathing and lung health.',
                                    style: textStyle13),
                              ),
                              SizedBox(
                                width: 200, // added a width constraint
                                child: const Text('> Promotes emotional stability.',
                                    style: textStyle13),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 150, // Adjusted from 77
                          left: 261,
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/Icons8play501.png'), // Use AssetImage
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Wellness Tools Section
            Positioned(
              top: 440,
              left: 32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align text left.
                children: [
                  const Text('Wellness Tools', style: textStyle20),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildWellnessButton(
                        text1: 'Search Raagas ',
                        text2: 'by Time',
                        textStyle: textStyle16,
                        image: 'assets/Icons8play501.png',
                      ),
                      _buildWellnessButton(
                        text1: 'Melody List',
                        text2: '',
                        textStyle: textStyle16,
                        image: '', // No image for this button
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildWellnessButton(
                        text1: 'Favorite Raaga ',
                        text2: 'Playlist',
                        textStyle: textStyle16,
                        image: '', // No image
                      ),
                      _buildWellnessButton(
                        text1: 'Get Raaga for',
                        text2: 'Relief',
                        textStyle: textStyle16,
                        image: '', // No image
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Bottom Navigation
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildBottomNavigation(),
            ),
            Positioned(
              top: 734,
              left: 0, // changed from 69
              right: 0, // added right
              child: const Text(
                'Traditional wisdom associates raagas with ',
                textAlign: TextAlign.center,
                style: textStyle12,
              ),
            ),
            Positioned(
              top: 749,
              left: 0, // changed from 93.
              right: 0,
              child: const Text(
                'specific times for optimal benefits.',
                textAlign: TextAlign.center,
                style: textStyle12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for creating the wellness buttons
  Widget _buildWellnessButton(
      {required String text1,
        required String text2,
        required TextStyle textStyle,
        String image = ''}) {
    return Container(
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
        color: const Color(0xFFD48D66), // Changed from RGBA
        border: Border.all(color: const Color(0xFF691705), width: 1),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image.isNotEmpty)
            //checks if the image string is empty or not.
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image), // Use AssetImage
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            Text(text1, style: textStyle),
            if (text2.isNotEmpty) Text(text2, style: textStyle),
          ],
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
      height: 100, // Increased height
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
          ),
          _buildNavigationItem(
            icon: 'assets/Icons8settings5011.png',
            label: 'Settings',
            textStyle: textStyle12,
          ),
          _buildNavigationItem(
            icon: 'assets/Icons8usericon241.png',
            label: 'Profile',
            textStyle: textStyle12,
          ),
        ],
      ),
    );
  }

  // Helper method for building a navigation item
  Widget _buildNavigationItem(
      {required String icon, required String label, required TextStyle textStyle}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(icon), // Use AssetImage
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Text(label, style: textStyle),
      ],
    );
  }
}

