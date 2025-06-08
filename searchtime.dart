import 'package:flutter/material.dart';
import 'vanaspati.dart';
import 'ganamurti.dart';

class SearchTimeScreen extends StatefulWidget {
  const SearchTimeScreen({super.key});

  @override
  State<SearchTimeScreen> createState() => _SearchTimeScreenState();
}

class _SearchTimeScreenState extends State<SearchTimeScreen> {
  int? selectedHour;
  int? selectedMinute;
  List<String> recommendedRaagas = [];

  void _recommendRaagas() {
    setState(() {
      recommendedRaagas.clear();
      if (selectedHour != null && selectedMinute != null) {
        // Basic time-based raaga recommendation logic (replace with your actual logic)
        if ((selectedHour! >= 3 && selectedHour! < 6) || (selectedHour! == 6 && selectedMinute! <= 30)) {
          recommendedRaagas.addAll(['Kanakangi', 'Ratnangi', 'Dhenuka', 'Vanaspati', 'Manavati', 'Tanarupi']);
        } else if ((selectedHour! >= 6 && selectedHour! < 9) || (selectedHour! == 9 && selectedMinute! <= 30)) {
          recommendedRaagas.addAll(['Senavati', 'Hanumatodi', 'Ganamurti', 'Natakapriya', 'Kokilapriya', 'Rupavati', 'Gayakapriya', 'Vakulabharanam', 'Mayamalavagowla', 'Chakravakam', 'Suryakantam', 'Hatakambari']);
        } else if ((selectedHour! >= 9 && selectedHour! < 15) || (selectedHour! == 15 && selectedMinute! <= 30)) {
          recommendedRaagas.addAll(['Jhankaradhvani', 'Naṭabhairavi', 'Kiravani', 'Kharaharapriya', 'Gourimanohari', 'Varunapriya', 'Mararanjani', 'Charukesi', 'Sarasangi', 'Harikambhōji', 'Dhirasankarabharanam', 'Naganandini', 'Yagapriya', 'Ragavardhini', 'Gangeyabhusani', 'Vagadhisvari', 'Sulini', 'Chalanaṭa']);
        } else if ((selectedHour! >= 15 && selectedHour! < 18) || (selectedHour! == 18 && selectedMinute! <= 30)) {
          recommendedRaagas.addAll(['Salagam', 'Jalarnavam', 'Jhalavarali', 'Navanitam', 'Pavani', 'Raghupriya', 'Gavambhodi', 'Bhavapriya', 'Subhapantuvarali', 'Shadvidamargini', 'Suvarnangi', 'Divyamani', 'Dhavalambari', 'Namanarayani', 'Kamavardhini', 'Ramapriya', 'Gamanasrama', 'Visvambari']);
        } else if ((selectedHour! >= 18 && selectedHour! < 21) || (selectedHour! == 21 && selectedMinute! <= 30)) {
          recommendedRaagas.addAll(['Samalangi', 'Sanmukhapriya', 'Simhendramadhyamam', 'Hemavati']);
        } else if ((selectedHour! >= 21 && selectedHour! < 23) || (selectedHour! == 23 && selectedMinute! <= 30)) {
          recommendedRaagas.addAll(['Dharmavati', 'Nitimati', 'Kantamani', 'Risabhapriya', 'Latangi', 'Vachaspati', 'Mechakalyani', 'Chitrambari']);
        } else {
          recommendedRaagas.addAll(['Sucharitra', 'Jyoti svarupini', 'Dhathuvardhani', 'Nasikabhusani', 'Kōsalam', 'Rasikapriya']);
        }
      } else {
        recommendedRaagas.add('Please select a valid time.');
      }
    });
  }

  void _handleRaagaClick(String raaga) {
    if (raaga == 'Vanaspati') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => VanaspatiScreen()));
    } else if (raaga == 'Ganamurti') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => GanamurthiScreen()));
    }
    // Add more conditions as needed
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Screen not available for "$raaga"')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 390,
        height: 844,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(255, 241, 219, 1),
              Color.fromRGBO(255, 188, 151, 1),
            ],
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
                  color: Color.fromRGBO(212, 141, 102, 1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(
                        'assets/arrow_left.png',
                        semanticLabel: 'arrow_left',
                        height: 24,
                      ),
                    ),
                    const Text(
                      'Search By Time',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(92, 2, 2, 1),
                        fontFamily: 'Inter',
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                    ClipOval(
                      child: Image.asset(
                        'assets/ragachikitsalogo.png',
                        semanticLabel: 'ragachikitsalogo',
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 86,
              left: 49,
              child: const Text(
                'Raaga Time Recommender',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(92, 2, 2, 2),
                  fontFamily: 'Inter',
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
            Positioned(
              top: 141,
              left: 21,
              child: const Text(
                'Select Time (HH:MM):',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(92, 2, 2, 1),
                  fontFamily: 'Inter',
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
            Positioned(
              top: 178,
              left: 41,
              child: SizedBox(
                width: 88,
                child: DropdownButtonFormField<int>(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(255, 241, 219, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color.fromRGBO(106, 24, 5, 1)),
                    ),
                  ),
                  value: selectedHour,
                  hint: const Text('HH', textAlign: TextAlign.center),
                  items: List.generate(24, (index) => DropdownMenuItem(
                    value: index,
                    child: Text(
                      index < 10 ? '0$index' : '$index',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color.fromRGBO(92, 2, 2, 1),
                        fontFamily: 'Roboto',
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  )),
                  onChanged: (value) {
                    setState(() {
                      selectedHour = value;
                    });
                  },
                ),
              ),
            ),
            const Positioned(
              top: 188,
              left: 145,
              child: Text(
                ':',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(92, 2, 2, 1),
                  fontFamily: 'Inter',
                  fontSize: 40,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
            Positioned(
              top: 179,
              left: 176,
              child: SizedBox(
                width: 87,
                child: DropdownButtonFormField<int>(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(255, 241, 219, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color.fromRGBO(106, 24, 5, 1)),
                    ),
                  ),
                  value: selectedMinute,
                  hint: const Text('MM', textAlign: TextAlign.center),
                  items: [
                    for (int i = 0; i <= 50; i +=5)
                      DropdownMenuItem(
                        value: i,
                        child: Text(
                          i < 10 ? '0$i' : '$i',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color.fromRGBO(92, 2, 2, 1),
                            fontFamily: 'Roboto',
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                        ),
                      ),
                    const DropdownMenuItem(
                      value: 59, // To include the 60th minute as '59' in the UI
                      child: Text(
                        '59',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(92, 2, 2, 1),
                          fontFamily: 'Roboto',
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedMinute = value;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              top: 276,
              left: 127,
              child: GestureDetector(
                onTap: _recommendRaagas,
                child: Container(
                  width: 124,
                  height: 37,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0, 4),
                        blurRadius: 4,
                      ),
                    ],
                    color: const Color.fromRGBO(212, 141, 102, 0.59),
                    border: Border.all(
                      color: const Color.fromRGBO(106, 24, 5, 1),
                      width: 3,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Recommend',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(92, 2, 2, 1),
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 348,
              left: 21,
              child: Container(
                width: 349,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromRGBO(212, 141, 102, 0.25),
                  border: Border.all(
                    color: const Color.fromRGBO(212, 141, 102, 1),
                    width: 1.8,
                  ),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/Image2.png',
                          width: 26,
                          height: 26,
                          fit: BoxFit.fitWidth,
                        ),
                        const SizedBox(width: 16),
                        const Text(
                          'Melodies for This Moment',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(92, 2, 2, 2),
                            fontFamily: 'Inter',
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    if (recommendedRaagas.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: recommendedRaagas.map((raaga) => GestureDetector(
                          onTap: () => _handleRaagaClick(raaga),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0), // Increased vertical margin
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xFFD48D66).withOpacity(0.6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  raaga,
                                  style: const TextStyle(
                                    color: Color.fromRGBO(92, 2, 2, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5,
                                  ),
                                ),
                                const Text(
                                  '>',
                                  style: TextStyle(
                                    color: Color.fromRGBO(105, 23, 5, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )).toList(),
                      )
                    else
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Please select a time and click Recommend.',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const Positioned(
              top: 794,
              left: 79,
              child: Text(
                'Trust the time,feel the tune,heal the soul',
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
          ],
        ),
      ),
    );
  }
}
