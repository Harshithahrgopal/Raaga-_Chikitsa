import 'package:flutter/material.dart';
import 'home.dart'; // Import your home.dart file

const brown = Color.fromRGBO(92, 2, 2, 1);
const lightBrown = Color.fromRGBO(212, 141, 102, 1);
const raagaDivColor = Color.fromRGBO(212, 141, 102, 1); // D48D66 in RGB
const arrowBrown = Color.fromRGBO(105, 23, 5, 1);
const borderRadiusAll = BorderRadius.all(Radius.circular(15));
final BorderRadius itemRadius = BorderRadius.circular(12);
const itemHeight = 44.0;
const dividerHeight = 8.0; // Increased spacing between raaga divs

const titleStyle = TextStyle(
  color: brown,
  fontFamily: 'Inter',
  fontSize: 30,
  fontWeight: FontWeight.normal,
  height: 1,
  backgroundColor: Colors.transparent, // Make background transparent
);
const itemTextStyle = TextStyle(
  color: brown,
  fontFamily: 'Inter',
  fontSize: 24,
  fontWeight: FontWeight.normal,
  height: 1,
  backgroundColor: Colors.transparent, // Make background transparent
);
const arrowTextStyle = TextStyle(
  color: arrowBrown,
  fontFamily: 'Inter',
  fontSize: 25,
  fontWeight: FontWeight.normal,
  height: 1,
  backgroundColor: Colors.transparent, // Make background transparent
);

class MelodyList extends StatelessWidget {
  const MelodyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Using Scaffold to properly size the content
      body: Container(
        width: double.infinity, // Make the container take full width
        height: double.infinity, // Make the container take full height
        decoration: const BoxDecoration(
          borderRadius: borderRadiusAll,
          gradient: LinearGradient(
            begin: Alignment(0, 0), // Start from the top
            end: Alignment(0, 1), // End at the bottom
            colors: [Color(0xFFFFbc97), Color(0xFFFFf1db)], // Swapped colors
          ),
        ),
        child: Stack(
          children: <Widget>[
            // Top Bar with Back Button and Title
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 72,
                color: lightBrown.withOpacity(0.95),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()), // Navigate to Home page
                        );
                      },
                      child: Image.asset(
                        'assets/arrow_left.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                    const Text('Melody List', style: titleStyle),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/ragachikitsalogo.png',
                          fit: BoxFit.cover, // Ensure the image fills the circle
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Melody Items
            Positioned(
              top: 80,
              left: 20,
              right: 20, // Added right padding to control width
              child: Column(
                children: [
                  _buildMelodyItem('Kanakangi'),
                  const SizedBox(height: dividerHeight),
                  _buildMelodyItem('ratnangi'),
                  const SizedBox(height: dividerHeight),
                  _buildMelodyItem('Ganamurti'),
                  const SizedBox(height: dividerHeight),
                  _buildMelodyItem('Vanaspati'),
                  const SizedBox(height: dividerHeight),
                  _buildMelodyItem('Manavati'),
                  const SizedBox(height: dividerHeight),
                  _buildMelodyItem('Tanarupi'),
                  const SizedBox(height: dividerHeight),
                  _buildMelodyItem('Senavati'),
                  const SizedBox(height: dividerHeight),
                  _buildMelodyItem('Hanumatodi'),
                  const SizedBox(height: dividerHeight),
                  _buildMelodyItem('Dhenuka'),
                  const SizedBox(height: dividerHeight),
                  _buildMelodyItem('Natakapriya'),
                  const SizedBox(height: dividerHeight),
                  _buildMelodyItem('Kokilapriya'),
                  const SizedBox(height: dividerHeight),
                  _buildMelodyItem('Roopavathi'),
                  const SizedBox(height: dividerHeight),
                  _buildMelodyItem('Gayakapriya'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMelodyItem(String melodyName) {
    return Container(
      width: double.infinity, // Make each item take full available width
      height: itemHeight,
      decoration: BoxDecoration(borderRadius: itemRadius, color: raagaDivColor), // Set the desired color
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(melodyName, style: itemTextStyle),
          const Text('>', style: arrowTextStyle),
        ],
      ),
    );
  }
}
