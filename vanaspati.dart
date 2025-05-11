// vanaspati.dart
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'melodylist.dart'; // Import the MelodyList class

const brown = Color.fromRGBO(92, 2, 2, 1);

class VanaspatiScreen extends StatelessWidget {
  const VanaspatiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    const borderRadius = 15.0;
    const contentPadding = 16.0;
    const topBarHeight = 69.0;
    const playerBoxHeight = 166.0;
    const playerBoxMarginTop = 87.0;
    const benefitsTitleMarginTop = 270.0;
    const benefitsBoxMarginTop = 316.0;
    const benefitsBoxBorderRadius = 20.0;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: const LinearGradient(
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
                height: topBarHeight,
                padding: const EdgeInsets.symmetric(horizontal: contentPadding),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(212, 141, 102, 0.95),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(borderRadius),
                    topRight: Radius.circular(borderRadius),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        child: Image.asset(
                          'assets/arrow_left.png', // Using your asset
                          width: 30,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Text(
                      'Vanaspati Raaga',
                      style: TextStyle(
                        color: brown,
                        fontFamily: 'Inter',
                        fontSize: screenWidth * 0.06, // Responsive font size
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Image.asset(
                      'assets/ragachikitsalogo.png',
                      width: 35,
                      height: 35,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ),
            // Player Box
            Positioned(
              top: playerBoxMarginTop,
              left: contentPadding,
              right: contentPadding,
              child: Container(
                height: playerBoxHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(212, 141, 102, 0.38),
                  border: Border.all(
                    color: const Color.fromRGBO(212, 141, 102, 1),
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.all(contentPadding / 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/Image3.png', width: 22, height: 22, fit: BoxFit.contain),
                        const SizedBox(width: 10),
                        Text(
                          'Vanaspati',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: brown,
                            fontFamily: 'Inter',
                            fontSize: screenWidth * 0.06, // Responsive font size
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    const Divider(color: Color.fromRGBO(212, 141, 102, 1), thickness: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/Icons8shuffle241 (1).png', width: 24, height: 24, fit: BoxFit.contain),
                        Image.asset('assets/Icons8last481.png', width: 30, height: 30, fit: BoxFit.contain),
                        Image.asset('assets/Icons8play501 (1).png', width: 25, height: 25, fit: BoxFit.contain),
                        Transform.rotate(
                          angle: math.pi,
                          child: Image.asset('assets/Icons8last482.png', width: 30, height: 30, fit: BoxFit.contain),
                        ),
                        Image.asset('assets/Icons8add481.png', width: 35, height: 35, fit: BoxFit.contain),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('1:26', style: TextStyle(color: brown, fontFamily: 'Inter', fontSize: 14)),
                        const Text('3:43', style: TextStyle(color: brown, fontFamily: 'Inter', fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Wellness Benefits
            Positioned(
              top: benefitsTitleMarginTop,
              left: contentPadding,
              child: Text(
                'Wellness Benefits',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: brown,
                  fontFamily: 'Inter',
                  fontSize: screenWidth * 0.06, // Responsive font size
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Positioned(
              top: benefitsBoxMarginTop,
              left: contentPadding,
              right: contentPadding,
              bottom: 60, // Give some space at the bottom
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(benefitsBoxBorderRadius),
                    color: const Color.fromRGBO(212, 141, 102, 0.15),
                    border: Border.all(
                      color: const Color.fromRGBO(212, 141, 102, 1),
                      width: 1,
                    ),
                  ),
                  padding: const EdgeInsets.all(contentPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mental and Emotional Benefits:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: brown,
                          fontFamily: 'Inter',
                          fontSize: screenWidth * 0.05, // Responsive font size
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildBenefitRow('Balances mood swings and scattered thoughts.'),
                      _buildBenefitRow('Supports emotional grounding and inner stability.'),
                      _buildBenefitRow('Useful for meditation and quiet reflection.'),
                      _buildBenefitRow('Stimulates mental alertness without overstimulation.'),
                      const SizedBox(height: 16),
                      Text(
                        'Physical Health Benefits:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: brown,
                          fontFamily: 'Inter',
                          fontSize: screenWidth * 0.05, // Responsive font size
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildBenefitRow('Prepares the body for rest and helps with mild insomnia.'),
                      _buildBenefitRow('Offers a gentle energy reset through sound resonance.'),
                      _buildBenefitRow('The calming effect can support parasympathetic nervous system activity.'),
                      _buildBenefitRow('The soothing tones can help reduce hypertension.'),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 16,
              child: Center(
                child: Text(
                  'Every raaga is a step towards inner peace',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(106, 24, 5, 0.5),
                    fontFamily: 'Inter',
                    fontSize: screenWidth * 0.03, // Responsive font size
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildBenefitRow(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: brown,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: brown,
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
