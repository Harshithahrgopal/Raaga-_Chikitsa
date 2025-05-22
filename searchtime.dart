import 'package:flutter/material.dart';

class Searchtime extends StatefulWidget {
  @override
  _SearchtimeState createState() => _SearchtimeState();
}

class _SearchtimeState extends State<Searchtime> {
  TimeOfDay selectedTime = TimeOfDay(hour: 7, minute: 30);
  bool isAm = true;
  List<String> recommendedRaagas = [];

  List<String> getRaagasForTime(TimeOfDay time) {
    final int totalMinutes = time.hour * 60 + time.minute;

    if (totalMinutes >= 300 && totalMinutes < 600) {
      return ['Kanakangi', 'Ratnangi', 'Ganamurti'];
    } else if (totalMinutes >= 600 && totalMinutes < 900) {
      return ['Vanaspati', 'Manavati', 'Tanaroopi'];
    } else if (totalMinutes >= 900 && totalMinutes < 1140) {
      return ['Hanumatodi', 'Dheerasankarabharanam'];
    } else {
      return ['Gayakapriya', 'Vakulabharanam'];
    }
  }

  void _pickTime() async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (newTime != null) {
      setState(() {
        selectedTime = newTime;
        isAm = newTime.hour < 12;
      });
    }
  }

  void _recommendRaagas() {
    setState(() {
      recommendedRaagas = getRaagasForTime(selectedTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    final hourStr = (selectedTime.hourOfPeriod).toString().padLeft(2, '0');
    final minuteStr = selectedTime.minute.toString().padLeft(2, '0');

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFF1DB), Color(0xFFFFBC97)],
            begin: Alignment.bottomCenter,
            end: Alignment.centerLeft,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Header
            Container(
              height: 69,
              color: Color.fromRGBO(212, 141, 102, 0.95),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/arrow_left.png', width: 30),
                  Image.asset('assets/ragachikitsalogo.png', height: 50),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('Search By Time',
                style: TextStyle(fontSize: 24, color: Color(0xFF5C0202))),
            SizedBox(height: 10),
            Text('Raaga Time Recommender',
                style: TextStyle(fontSize: 22, color: Color(0xFF5C0202))),
            SizedBox(height: 30),
            Text('Select Time:',
                style: TextStyle(fontSize: 18, color: Color(0xFF5C0202))),
            SizedBox(height: 10),
            Row(
              children: [
                // Hour Input
                Expanded(
                  child: TextFormField(
                    initialValue: hourStr,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xFF6A1805)),
                      ),
                      filled: true,
                      fillColor: Color(0xFFFFF1DB),
                    ),
                    style: TextStyle(fontSize: 24, color: Color(0xFF5C0202)),
                    onChanged: (value) {
                      final int? newHour = int.tryParse(value);
                      if (newHour != null && newHour >= 1 && newHour <= 12) {
                        setState(() {
                          int hour24 = isAm
                              ? (newHour == 12 ? 0 : newHour)
                              : (newHour == 12 ? 12 : newHour + 12);
                          selectedTime = TimeOfDay(
                              hour: hour24, minute: selectedTime.minute);
                        });
                      }
                    },
                  ),
                ),
                SizedBox(width: 10),
                Text(":", style: TextStyle(fontSize: 24, color: Color(0xFF5C0202))),
                SizedBox(width: 10),
                // Minute Input
                Expanded(
                  child: TextFormField(
                    initialValue: minuteStr,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xFF6A1805)),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    style: TextStyle(fontSize: 24, color: Color(0xFF5C0202)),
                    onChanged: (value) {
                      final int? newMinute = int.tryParse(value);
                      if (newMinute != null && newMinute >= 0 && newMinute < 60) {
                        setState(() {
                          selectedTime = TimeOfDay(
                              hour: selectedTime.hour, minute: newMinute);
                        });
                      }
                    },
                  ),
                ),
                SizedBox(width: 20),
                ToggleButtons(
                  isSelected: [isAm, !isAm],
                  onPressed: (int index) {
                    setState(() {
                      isAm = index == 0;
                      int hour = selectedTime.hour;
                      if (isAm && hour >= 12) {
                        selectedTime = TimeOfDay(
                            hour: hour - 12, minute: selectedTime.minute);
                      } else if (!isAm && hour < 12) {
                        selectedTime = TimeOfDay(
                            hour: hour + 12, minute: selectedTime.minute);
                      }
                    });
                  },
                  color: Color(0xFF5C0202),
                  selectedColor: Colors.white,
                  fillColor: Color(0xFFD48D66),
                  borderRadius: BorderRadius.circular(8),
                  children: [Text("AM"), Text("PM")],
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _recommendRaagas,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFD48D66),
                  foregroundColor: Color(0xFF5C0202),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                    side: BorderSide(color: Color(0xFF6A1805), width: 3),
                  ),
                ),
                child: Text('Recommend', style: TextStyle(fontSize: 18)),
              ),
            ),
            SizedBox(height: 20),
            if (recommendedRaagas.isNotEmpty) ...[
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFFD48D66),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Melodies for This Moment',
                        style:
                        TextStyle(fontSize: 20, color: Color(0xFF5C0202))),
                    SizedBox(height: 10),
                    ...recommendedRaagas.map(
                          (raaga) => Container(
                        margin: EdgeInsets.symmetric(vertical: 6),
                        padding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFD2B1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(raaga,
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xFF5C0202))),
                            Icon(Icons.arrow_forward_ios,
                                size: 16, color: Color(0xFF5C0202)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
            Spacer(),
            Center(
              child: Text(
                'Trust the time, feel the tune, heal the soul',
                style: TextStyle(color: Color(0x806A1805), fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
