import 'package:flutter/material.dart';
import 'home.dart';
import 'vanaspati.dart';
import 'ganamurti.dart';

const brown = Color.fromRGBO(92, 2, 2, 1);
const lightBrown = Color.fromRGBO(212, 141, 102, 1);
const raagaDivColor = Color.fromRGBO(212, 141, 102, 0.7); // D48D66 in RGB
const arrowBrown = Color.fromRGBO(105, 23, 5, 1);
const borderRadiusAll = BorderRadius.all(Radius.circular(15));
final BorderRadius itemRadius = BorderRadius.circular(12);
const itemHeight = 44.0;
const dividerHeight = 9.5; // Increased divider height for more space

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

  final List<String> _melaKarthaRaagas = const [
    'Kanakangi', 'Ratnangi', 'Ganamurti', 'Vanaspati', 'Manavati', 'Tanarupi', 'Senavati',
    'Hanumatodi', 'Dhenuka', 'Natakapriya', 'Kokilapriya', 'Rupavati', 'Gayakapriya', 'Vakulabharanam',
    'Mayamalavagowla', 'Chakravakam', 'Suryakantam', 'Hatakambari', 'Jhankaradhwani', 'Natabhairavi', 'Keeravani',
    'Kharaharapriya', 'Gaurimanohari', 'Varunapriya', 'Mararanjani', 'Charukesi', 'Sarasangi', 'Harikambhoji',
    'Shankarabharanam', 'Nata', 'Kalyani', 'Yaman', 'Hindolam', 'Mohanam', 'Kambhoji',
    'Ramapriya', 'Gamanshramam', 'Vishnupriya', 'Nalinakanti', 'Navaneetam', 'Pavani', 'Raghupriya',
    'Gavambodhi', 'Bhavapriya', 'Shubhapantuvarali', 'Shadvidamargini', 'Suvarnangi', 'Divyamani', 'Dhavalambari',
    'Namagiri', 'Panthuvarali', 'Neelambari', 'Yagapriya', 'Ragavardhini', 'Gangeyabhushani', 'Vagadheeswari',
    'Shulini', 'Chalanata', 'Salagam', 'Jalarnavam', 'Jhalavarali', 'Navaragamalika', 'Rasikapriya',
    'Gamanashrama', 'Shamukhapriya', 'Simhendramadhyamam', 'Hemavati', 'Dharmavati', 'Neetimati', 'Kantamani',
    'Rishabhapriya', 'Latangi', 'Vachaspati', 'Mechakalyani', 'Chitrambari', 'Sucharitra', 'Jyotiswarupini',
    'Dhatuvardhani', 'Nasikabhushani', 'Kosalam', 'Rasali', 'Rupavati', 'Madhyamavati', 'Purvi',
    'Kafi', 'Bhairavi', 'Jonpuri', 'Todi', 'Multani', 'Darbari Kanada', 'Malkauns',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: borderRadiusAll,
          gradient: LinearGradient(
            begin: Alignment(0, 1), // Changed begin alignment
            end: Alignment(0, 0),   // Changed end alignment
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
                      width: 45,
                      height: 45,
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
              top: 85,
              left: 20,
              right: 20,
              child: SingleChildScrollView( // Enables scrolling
                child: Column(
                  children: _melaKarthaRaagas.map((raagaName) {
                    return Column(
                      children: [
                        _buildMelodyItem(context, raagaName),
                        SizedBox(height: dividerHeight),
                      ],
                    );
                  }).toList(),
                ),
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
            MaterialPageRoute(builder: (context) => const GanamurthiScreen()),
          );
        }
        // Add navigation cases for other raagas as needed
      },
      child: Container(
        width: double.infinity,
        height: itemHeight,
        decoration: BoxDecoration(
          borderRadius: itemRadius,
          color: raagaDivColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
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
