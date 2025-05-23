import 'package:flutter/material.dart';
import 'home.dart';
import 'vanaspati.dart';
import 'ganamurti.dart';

const brown = Color.fromRGBO(92, 2, 2, 1);
const lightBrown = Color.fromRGBO(212, 141, 102, 1);
const raagaDivColor = Color.fromRGBO(212, 141, 102, 1); // D48D66 in RGB
const arrowBrown = Color.fromRGBO(105, 23, 5, 1);
const borderRadiusAll = BorderRadius.all(Radius.circular(15));
final BorderRadius itemRadius = BorderRadius.circular(12);
const itemHeight = 44.0;
const dividerHeight = 8.0;

const titleStyle = TextStyle(
  color: brown,
  fontFamily: 'Inter',
  fontSize: 30,
  fontWeight: FontWeight.normal,
  height: 1,
  backgroundColor: Colors.transparent,
);

const itemTextStyle = TextStyle(
  color: brown,
  fontFamily: 'Inter',
  fontSize: 24,
  fontWeight: FontWeight.normal,
  height: 1,
  backgroundColor: Colors.transparent,
);

const arrowTextStyle = TextStyle(
  color: arrowBrown,
  fontFamily: 'Inter',
  fontSize: 25,
  fontWeight: FontWeight.normal,
  height: 1,
  backgroundColor: Colors.transparent,
);

class MelodyList extends StatelessWidget {
  const MelodyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: borderRadiusAll,
          gradient: LinearGradient(
            begin: Alignment(0, 0),
            end: Alignment(0, 1),
            colors: [Color(0xFFFFbc97), Color(0xFFFFf1db)],
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
                          MaterialPageRoute(builder: (context) => const HomePage()),
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
                          fit: BoxFit.cover,
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
              right: 20,
              child: Column(
                children: [
                  _buildMelodyItem(context, 'Kanakangi'),
                  const SizedBox(height: dividerHeight),
                  _buildMelodyItem(context, 'ratnangi'),
                  const SizedBox(height: dividerHeight),
                  _buildMelodyItem(context, 'Ganamurti'),
                  const SizedBox(height: dividerHeight),
                  _buildMelodyItem(context, 'Vanaspati'),
                  const SizedBox(height: dividerHeight),
                  _buildMelodyItem(context, 'Manavati'),
                  const SizedBox(height: dividerHeight),
                  _buildMelodyItem(context, 'Tanarupi'),
                  const SizedBox(height: dividerHeight),
                  _buildMelodyItem(context, 'Senavati'),
                  const SizedBox(height: dividerHeight),
                  _buildMelodyItem(context, 'Hanumatodi'),
                  const SizedBox(height: dividerHeight),
                  _buildMelodyItem(context, 'Dhenuka'),
                  const SizedBox(height: dividerHeight),
                  _buildMelodyItem(context, 'Natakapriya'),
                  const SizedBox(height: dividerHeight),
                  _buildMelodyItem(context, 'Kokilapriya'),
                  const SizedBox(height: dividerHeight),
                  _buildMelodyItem(context, 'Roopavathi'),
                  const SizedBox(height: dividerHeight),
                  _buildMelodyItem(context, 'Gayakapriya'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMelodyItem(BuildContext context, String melodyName) {
    return GestureDetector(
      onTap: () {
        if (melodyName == 'Vanaspati') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const VanaspatiScreen()),
          );
        } else if (melodyName == 'Ganamurti') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const GanamurtiScreen()),
          );
        }
        // Add more navigation cases here as needed
      },
      child: Container(
        width: double.infinity,
        height: itemHeight,
        decoration: BoxDecoration(
          borderRadius: itemRadius,
          color: raagaDivColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(melodyName, style: itemTextStyle),
            const Text('>', style: arrowTextStyle),
          ],
        ),
      ),
    );
  }
}
