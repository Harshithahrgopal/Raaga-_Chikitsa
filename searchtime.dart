import 'package:flutter/material.dart';

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
        if ((selectedHour! >= 5 && selectedHour! < 8) || (selectedHour! == 8 && selectedMinute! <= 30)) {
          recommendedRaagas.addAll(['Hanumatodi', 'Gayakapriya']);
        } else if ((selectedHour! >= 8 && selectedHour! < 11) || (selectedHour! == 11 && selectedMinute! <= 30)) {
          recommendedRaagas.addAll(['Kanakangi', 'Vanaspati']);
        } else if ((selectedHour! >= 11 && selectedHour! < 14) || (selectedHour! == 14 && selectedMinute! <= 30)) {
          recommendedRaagas.addAll(['Manavati']);
        } else if ((selectedHour! >= 14 && selectedHour! < 17) || (selectedHour! == 17 && selectedMinute! <= 30)) {
          recommendedRaagas.addAll(['Hanumatodi', 'Vanaspati', 'Manavati']);
        } else if ((selectedHour! >= 17 && selectedHour! < 20) || (selectedHour! == 20 && selectedMinute! <= 30)) {
          recommendedRaagas.addAll(['Gayakapriya', 'Kanakangi']);
        } else {
          recommendedRaagas.addAll(['Kanakangi', 'Hanumatodi', 'Gayakapriya', 'Vanaspati']);
        }
      } else {
        recommendedRaagas.add('Please select a valid time.');
      }
    });
  }

  void _handleRaagaClick(String raaga) {
    // Implement what happens when a raaga is clicked
    print('Raaga "$raaga" clicked!');
    // You might want to navigate to a details screen or play the raaga here.
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
                  color: Color.fromRGBO(212, 141, 102, 0.95),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/arrow_left.png',
                      semanticLabel: 'arrow_left',
                      height: 24,
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
                        height: 30,
                        width: 30,
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
                  color: Color.fromRGBO(92, 2, 2, 1),
                  fontFamily: 'Inter',
                  fontSize: 22,
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
                  items: List.generate(60, (index) => DropdownMenuItem(
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
                    borderRadius: BorderRadius.circular(24),
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
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(212, 141, 102, 0.15),
                  border: Border.all(
                    color: const Color.fromRGBO(212, 141, 102, 1),
                    width: 1,
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
                            color: Color.fromRGBO(92, 2, 2, 1),
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
                      Column( // Display raagas as a column
                        crossAxisAlignment: CrossAxisAlignment.stretch, // Make each container take full width
                        children: recommendedRaagas.map((raaga) => GestureDetector(
                          onTap: () => _handleRaagaClick(raaga),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 4.0),
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color.fromRGBO(106, 24, 5, 0.2), // Slightly transparent background
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  raaga,
                                  style: const TextStyle(
                                    color: Color.fromRGBO(92, 2, 2, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    height: 1,
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
