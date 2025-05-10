import 'package:flutter/material.dart';
import 'home.dart'; // Import your home.dart file

const brown = Color.fromRGBO(92, 2, 2, 1);
const lightBrown = Color.fromRGBO(212, 141, 102, 1);
const arrowBrown = Color.fromRGBO(105, 23, 5, 1);
const borderRadiusAll = BorderRadius.all(Radius.circular(15));
final BorderRadius itemRadius = BorderRadius.circular(12);
const itemHeight = 44.0;
const itemWidth = 349.0;
const titleStyle = TextStyle(color: brown, fontFamily: 'Inter', fontSize: 30, fontWeight: FontWeight.normal, height: 1);
const itemTextStyle = TextStyle(color: brown, fontFamily: 'Inter', fontSize: 24, fontWeight: FontWeight.normal, height: 1);
const arrowTextStyle = TextStyle(color: arrowBrown, fontFamily: 'Inter', fontSize: 25, fontWeight: FontWeight.normal, height: 1);

class MelodyList extends StatelessWidget {
  const MelodyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 844,
      decoration: BoxDecoration(
        borderRadius: borderRadiusAll,
        gradient: const LinearGradient(
          begin: Alignment(0, 1),
          end: Alignment(-1, 0),
          colors: [Color(0xFFFFf1db), Color(0xFFFFbc97)],
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
                    child: const Text('<', style: arrowTextStyle), // Arrow before text
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
            child: Column(
              children: [
                _buildMelodyItem('Kanakangi'),
                const SizedBox(height: 6.0),
                _buildMelodyItem('ratnangi'),
                const SizedBox(height: 6.0),
                _buildMelodyItem('Ganamurti'),
                const SizedBox(height: 6.0),
                _buildMelodyItem('Vanaspati'),
                const SizedBox(height: 6.0),
                _buildMelodyItem('Manavati'),
                const SizedBox(height: 6.0),
                _buildMelodyItem('Tanarupi'),
                const SizedBox(height: 6.0),
                _buildMelodyItem('Senavati'),
                const SizedBox(height: 6.0),
                _buildMelodyItem('Hanumatodi'),
                const SizedBox(height: 6.0),
                _buildMelodyItem('Dhenuka'),
                const SizedBox(height: 6.0),
                _buildMelodyItem('Natakapriya'),
                const SizedBox(height: 6.0),
                _buildMelodyItem('Kokilapriya'),
                const SizedBox(height: 6.0),
                _buildMelodyItem('Roopavathi'),
                const SizedBox(height: 6.0),
                _buildMelodyItem('Gayakapriya'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMelodyItem(String melodyName) {
    return Container(
      width: itemWidth,
      height: itemHeight,
      decoration: BoxDecoration(borderRadius: itemRadius, color: lightBrown),
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
