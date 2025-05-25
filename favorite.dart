// Figma Flutter Generator Favoriteplaylist - FRAME
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:provider/provider.dart'; // Import provider

import 'home.dart'; // Import the home.dart file
import 'favorites_provider.dart'; // Import the FavoritesProvider

class Favoriteplaylist extends StatelessWidget { // Changed to StatelessWidget
  final String commonImagePath = 'assets/Image4.png';

  const Favoriteplaylist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final favoriteRaagas = favoritesProvider.favoriteRaagas;

    // Define scaling factors based on the original design (390x844)
    final widthScaleFactor = screenWidth / 390;
    final heightScaleFactor = screenHeight / 844;
    final textScaleFactor = math.min(widthScaleFactor, heightScaleFactor); // Scale text conservatively

    return Scaffold( // Wrap with Scaffold to enable navigation
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15 * math.min(widthScaleFactor, heightScaleFactor)), // Scale rounded corners
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFFFFf1db), Color(0xFFFFbc97)],
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 390 * widthScaleFactor,
                height: 69 * heightScaleFactor,
                color: const Color(0xE0D48D66),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20 * heightScaleFactor),
              child: Row(
                children: [
                  SizedBox(width: 15 * widthScaleFactor), // Add some leading space
                  GestureDetector( // Wrap the arrow with GestureDetector
                    onTap: () {
                      Navigator.pop(context); // Go back to the previous page (Home)
                    },
                    child: Image.asset( // Removed the Transform.rotate widget
                      'assets/arrow_left.png',
                      width: 30 * widthScaleFactor,
                      height: 30 * heightScaleFactor,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: 20 * widthScaleFactor), // Add some space
                  Text(
                    'Favorite Raagas',
                    style: TextStyle(
                      color: const Color(0xFF5C0202),
                      fontFamily: 'Inter',
                      fontSize: 24 * textScaleFactor,
                    ),
                  ),
                  const Spacer(), // Push the logo to the right
                  ClipOval( // Wrap the Image.asset with ClipOval
                    child: Image.asset(
                      'assets/ragachikitsalogo.png',
                      width: 38 * widthScaleFactor,
                      height: 38 * heightScaleFactor,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: 15 * widthScaleFactor), // Add some trailing space
                ],
              ),
            ),
            Positioned(
              top: 82 * heightScaleFactor,
              left: 87 * widthScaleFactor,
              child: Text(
                'My Healing Melodies',
                style: TextStyle(
                  color: const Color(0xFF5C0202),
                  fontFamily: 'Inter',
                  fontSize: 22 * textScaleFactor,
                ),
              ),
            ),
            Positioned(
              top: 114 * heightScaleFactor,
              left: 49 * widthScaleFactor,
              child: Text(
                ' Relax,heal and revisit the melodies that moved you',
                style: TextStyle(
                  color: const Color(0xCACA1805),
                  fontFamily: 'Inter',
                  fontSize: 12 * textScaleFactor,
                ),
              ),
            ),
            Padding( // Changed Positioned to Padding for the list of raagas
              padding: EdgeInsets.only(top: 154 * heightScaleFactor, left: 21 * widthScaleFactor),
              child: Column(
                children: [
                  for (int i = 0; i < favoriteRaagas.length; i++)
                    Padding( // Added Padding for spacing between raagas
                      padding: EdgeInsets.only(bottom: 15 * heightScaleFactor),
                      child: _buildRaagaRow(
                        leftText: favoriteRaagas[i],
                        onRemove: () {
                          favoritesProvider.removeRaaga(favoriteRaagas[i]);
                        },
                        widthScaleFactor: widthScaleFactor,
                        heightScaleFactor: heightScaleFactor,
                        textScaleFactor: textScaleFactor,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRaagaRow({
    required String leftText,
    required VoidCallback onRemove,
    required double widthScaleFactor,
    required double heightScaleFactor,
    required double textScaleFactor,
  }) {
    return SizedBox( // Use SizedBox to control the overall width of the row
      width: 365 * widthScaleFactor, // Adjust width to accommodate the outer icon
      height: 44 * heightScaleFactor,
      child: Stack(
        children: [
          Positioned( // The colored box
            left: 0,
            top: 0,
            child: Container(
              width: 319 * widthScaleFactor,
              height: 44 * heightScaleFactor,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12 * math.min(widthScaleFactor, heightScaleFactor)),
                color: const Color(0xFFD48D66).withOpacity(0.6),
              ),
            ),
          ),
          Positioned( // The raaga text
            top: 7 * heightScaleFactor,
            left: 22 * widthScaleFactor,
            child: Text(
              leftText,
              style: TextStyle(
                color: const Color(0xFF5C0202),
                fontFamily: 'Inter',
                fontSize: 24 * textScaleFactor,
              ),
            ),
          ),
          Positioned( // The right arrow inside the box
            top: 4 * heightScaleFactor,
            left: 277 * widthScaleFactor, // Position inside the box
            child: Text( // Removed 'const' here
              '>',
              style: TextStyle(
                color: const Color(0xFF691705),
                fontFamily: 'Inter',
                fontSize: 25 * textScaleFactor,
              ),
            ),
          ),
          Positioned( // The remove icon outside the box
            top: 7 * heightScaleFactor, // Adjust vertical alignment
            left: 335 * widthScaleFactor, // Position to the right of the box
            child: GestureDetector(
              onTap: onRemove,
              child: SizedBox(
                width: 30 * widthScaleFactor,
                height: 30 * heightScaleFactor,
                child: Image.asset(commonImagePath, fit: BoxFit.fitWidth),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
