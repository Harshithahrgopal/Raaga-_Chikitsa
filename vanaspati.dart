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
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 390,
                height: 69,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(212, 141, 102, 0.95),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container( // Wrapped with Container
                          width: 30,
                          height: 30,
                          child: Transform.rotate(
                            angle: -math.pi,
                            child: const Icon(Icons.arrow_back, color: brown, size: 30),
                          ),
                        ),
                      ),
                      const Text(
                        'Vanaspati Raaga',
                        style: TextStyle(
                          color: brown,
                          fontFamily: 'Inter',
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          height: 1,
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
            ),
            Positioned(
              top: 87,
              left: 17,
              child: Container(
                width: 357,
                height: 166,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: const Color.fromRGBO(212, 141, 102, 0.38),
                  border: Border.all(
                    color: const Color.fromRGBO(212, 141, 102, 1),
                    width: 1,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 22,
                      left: 43,
                      child: Row(
                        children: [
                          Image.asset('assets/Image3.png', width: 22, height: 22, fit: BoxFit.contain),
                          const SizedBox(width: 10),
                          const Text(
                            'Vanaspati',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: brown,
                              fontFamily: 'Inter',
                              fontSize: 24,
                              fontWeight: FontWeight.normal,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 68,
                      left: 14,
                      child: Container(
                        width: 320,
                        height: 1,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(212, 141, 102, 1),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 97,
                      left: 66,
                      right: 66,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('assets/Icons8shuffle241(1).png', width: 24, height: 24, fit: BoxFit.contain),
                          Image.asset('assets/Icons8last481.png', width: 30, height: 30, fit: BoxFit.contain),
                          Image.asset('assets/Icons8play501(1).png', width: 25, height: 25, fit: BoxFit.contain),
                          Transform.rotate(
                            angle: math.pi,
                            child: Image.asset('assets/Icons8last482.png', width: 30, height: 30, fit: BoxFit.contain),
                          ),
                          Image.asset('assets/Icons8add481.png', width: 35, height: 35, fit: BoxFit.contain),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 16,
                      child: const Text('1:26', textAlign: TextAlign.left, style: TextStyle(color: brown, fontFamily: 'Inter', fontSize: 14)),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 16,
                      child: const Text('3:43', textAlign: TextAlign.left, style: TextStyle(color: brown, fontFamily: 'Inter', fontSize: 14)),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 270,
              left: 17,
              child: const Text(
                'Wellness Benefits',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: brown,
                  fontFamily: 'Inter',
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
            Positioned(
              top: 316,
              left: 17,
              child: Container(
                width: 357,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: const Color.fromRGBO(212, 141, 102, 0.15),
                  border: Border.all(
                    color: const Color.fromRGBO(212, 141, 102, 1),
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mental and Emotional Benefits:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: brown,
                        fontFamily: 'Inter',
                        fontSize: 19,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildBenefitRow('Balances mood swings and scattered thoughts.'),
                    _buildBenefitRow('Supports emotional grounding and inner stability.'),
                    _buildBenefitRow('Useful for meditation and quiet reflection.'),
                    _buildBenefitRow('Stimulates mental alertness without overstimulation.'),
                    const SizedBox(height: 16),
                    const Text(
                      'Physical Health Benefits:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: brown,
                        fontFamily: 'Inter',
                        fontSize: 19,
                        fontWeight: FontWeight.normal,
                        height: 1,
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
            Positioned(
              left: 0,
              right: 0,
              bottom: 16,
              child: Center(
                child: const Text(
                  'Every raaga is a step towards inner peace',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(106, 24, 5, 0.5),
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    height: 1,
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
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
