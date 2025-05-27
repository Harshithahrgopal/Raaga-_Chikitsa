import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.centerLeft,
            colors: [
              Color.fromRGBO(255, 188, 151, 1),
              Color.fromRGBO(255, 241, 219, 1),

            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header Bar
              Container(
                height: 69,
                color: const Color.fromRGBO(212, 141, 102, 0.95),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/arrow_left.png',
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'About',
                          style: TextStyle(
                            color: Color.fromRGBO(92, 2, 2, 1),
                            fontFamily: 'Inter',
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    ClipOval(
                      child: Image.asset(
                        'assets/ragachikitsalogo.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),

              // Scrollable content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'App Overview',
                          style: TextStyle(
                            color: Color.fromRGBO(92, 2, 2, 1),
                            fontFamily: 'Inter',
                            fontSize: 22,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        '"Raagachikitsa is a unique app that blends the ancient science of Indian classical music with holistic wellness. Discover raagas curated for emotional balance, mental clarity, and spiritual upliftment."',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 25),

                      // Purpose and Vision
                      const Text(
                        '1. Purpose and Vision',
                        style: TextStyle(
                          color: Color.fromRGBO(92, 2, 2, 1),
                          fontSize: 22,
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(height: 10),
                      _infoBox(
                        'Our mission is to revive and promote the healing power of Indian classical music. We aim to make music therapy accessible to everyone through curated raagas for specific moods, ailments, and times of the day.',
                      ),
                      const SizedBox(height: 25),

                      // Features
                      const Text(
                        '2. Features',
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromRGBO(92, 2, 2, 1),
                        ),
                      ),
                      const SizedBox(height: 10),
                      _infoBoxColumn(
                        children: const [
                          FeatureItem(
                            title: '🎵 Raaga Library:',
                            subtitle: ' Explore a curated list of raagas with descriptions.',
                          ),
                          FeatureItem(
                            title: '💊 Therapeutic Benefits:',
                            subtitle: ' Learn the health and emotional benefits of each raaga.',
                          ),
                          FeatureItem(
                            title: '⭐ Favorites:',
                            subtitle: ' Save your favorite raagas for easy access.',
                          ),
                          FeatureItem(
                            title: '🕒 Daily Recommendations:',
                            subtitle: ' Get daily suggestions based on time and mood.',
                          ),
                          FeatureItem(
                            title: '📴 Offline Mode:',
                            subtitle: ' Listen to raagas without internet.',
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),

                      // Science Behind Raagachikitsa
                      const Text(
                        '3. Science Behind Raagachikitsa',
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromRGBO(92, 2, 2, 1),
                        ),
                      ),
                      const SizedBox(height: 10),
                      _infoBox(
                        'Raagachikitsa, or music therapy in Indian tradition, is based on the concept that different musical notes stimulate different parts of the body and mind. Each raaga has a specific time and emotional effect, capable of bringing calm, focus, or energy.',
                      ),
                      const SizedBox(height: 25),

                      // History
                      const Text(
                        'History of Raagachikitsa',
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromRGBO(92, 2, 2, 1),
                        ),
                      ),
                      const SizedBox(height: 10),
                      _infoBox(
                        'Raagachikitsa dates back to ancient Indian texts like the Sama Veda and Natya Shastra. Rishis believed that sound vibrations could heal the body and purify the mind. This app is inspired by that timeless wisdom.',
                      ),
                      const SizedBox(height: 25),

                      // Disclaimer
                      const Text(
                        'Disclaimer',
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromRGBO(92, 2, 2, 1),
                        ),
                      ),
                      const SizedBox(height: 10),
                      _infoBox(
                        'This app is intended for general wellness. It is not a substitute for medical advice, diagnosis, or treatment. For any health conditions, please consult a healthcare professional.',
                      ),
                      const SizedBox(height: 25),

                      // Final Quote
                      const Center(
                        child: Text(
                          'Each raaga reflects the cultural richness of India — representing emotions (rasa), time, and the interplay of melody and devotion',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(106, 24, 5, 0.5),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable box
  Widget _infoBox(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(212, 141, 102, 0.1),
        border: Border.all(
          color: const Color.fromRGBO(212, 141, 102, 1),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 15,
        ),
      ),
    );
  }

  // Reusable feature container
  Widget _infoBoxColumn({required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(212, 141, 102, 0.1),
        border: Border.all(
          color: const Color.fromRGBO(212, 141, 102, 1),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

// FeatureItem widget
class FeatureItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const FeatureItem({required this.title, required this.subtitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$title ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 15.5,
              ),
            ),
            TextSpan(
              text: subtitle,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
