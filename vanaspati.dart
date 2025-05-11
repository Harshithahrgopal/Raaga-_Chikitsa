// vanaspati.dart
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'melodylist.dart'; // Import the MelodyList class

const brown = Color.fromRGBO(92, 2, 2, 1);

class VanaspatiScreen extends StatelessWidget {
  const VanaspatiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 390,
        height: 844,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [Color(0xFFFFf1db), Color(0xFFFFbc97)],
          ),
        ),
        child: Stack(
          children: <Widget>[
            // Top Bar
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 69,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(212, 141, 102, 0.95),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Navigate back to MelodyList
                      },
                      child: const Icon(Icons.arrow_back, color: brown, size: 30),
                    ),
                    const Text(
                      'Vanaspati Raaga',
                      style: TextStyle(
                        color: brown,
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Image.asset(
                      'assets/ragachikitsalogo.png',
                      width: 35,
                      height: 35,
                      fit: BoxFit.contain, // Ensure the logo fits within the bounds
                    ),
                  ],
                ),
              ),
            ),
            // Content Area
            Positioned(
              top: 69,
              left: 17,
              right: 17,
              bottom: 16,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(245, 222, 179, 0.6), // Lighten the background
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Vanaspati',
                        style: TextStyle(
                          color: brown,
                          fontFamily: 'Inter',
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text('1:26', style: TextStyle(color: brown, fontFamily: 'Inter', fontSize: 14)),
                          Expanded(
                            child: Slider(
                              value: 0.3, // Example value
                              onChanged: (double value) {},
                              activeColor: brown,
                              inactiveColor: brown.withOpacity(0.3),
                            ),
                          ),
                          const Text('3:43', style: TextStyle(color: brown, fontFamily: 'Inter', fontSize: 14)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.shuffle, color: brown.withOpacity(0.7), size: 30),
                          Icon(Icons.skip_previous, color: brown, size: 35),
                          Icon(Icons.play_arrow, color: brown, size: 40),
                          Icon(Icons.skip_next, color: brown, size: 35),
                          Icon(Icons.add, color: brown.withOpacity(0.7), size: 30),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Wellness Benefits',
                        style: TextStyle(
                          color: brown,
                          fontFamily: 'Inter',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Mental and Emotional Benefits:',
                        style: TextStyle(
                          color: brown,
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildBenefitText('Balances mood swings and scattered thoughts.'),
                      _buildBenefitText('Supports emotional grounding and inner stability.'),
                      _buildBenefitText('Useful for meditation and quiet reflection.'),
                      _buildBenefitText('Stimulates mental alertness without overstimulation.'),
                      const SizedBox(height: 16),
                      const Text(
                        'Physical Health Benefits:',
                        style: TextStyle(
                          color: brown,
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildBenefitText('Prepares the body for rest and helps with mild insomnia.'),
                      _buildBenefitText('Offers a gentle energy reset through sound resonance.'),
                      _buildBenefitText('The calming effect can support parasympathetic nervous system activity.'),
                      _buildBenefitText('The soothing tones can help reduce hypertension.'),
                      const SizedBox(height: 24),
                      const Center(
                        child: Text(
                          'Every raaga is a step towards inner peace',
                          style: TextStyle(
                            color: Color.fromRGBO(106, 24, 5, 0.5),
                            fontFamily: 'Inter',
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildBenefitText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(color: brown, fontSize: 16)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: brown,
                fontFamily: 'Inter',
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
