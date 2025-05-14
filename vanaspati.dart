import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

const brown = Color.fromRGBO(92, 2, 2, 1);

class VanaspatiScreen extends StatefulWidget {
  const VanaspatiScreen({super.key});

  @override
  State<VanaspatiScreen> createState() => _VanaspatiScreenState();
}

class _VanaspatiScreenState extends State<VanaspatiScreen> {
  final AudioPlayer audioPlayer = AudioPlayer();
  Duration? duration;
  Duration position = Duration.zero;
  bool isPlaying = false;
  bool isAudioLoaded = false;
  StreamSubscription? _playerStateSubscription;
  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;
  bool _mounted = false;

  @override
  void initState() {
    super.initState();
    _mounted = true;
    setAudio();
    _playerStateSubscription = audioPlayer.onPlayerStateChanged.listen((state) {
      if (_mounted) {
        setState(() {
          isPlaying = state == PlayerState.playing;
        });
      }
    });

    _durationSubscription = audioPlayer.onDurationChanged.listen((newDuration) {
      if (_mounted) {
        setState(() {
          duration = newDuration;
        });
      }
    });

    _positionSubscription = audioPlayer.onPositionChanged.listen((newPosition) {
      if (_mounted) {
        setState(() {
          position = newPosition;
        });
      }
    });
  }

  Future<void> setAudio() async {
    try {
      await audioPlayer.setSource(AssetSource('audio/vanaspati.wav')); // ✅ Correct path
      if (_mounted) {
        setState(() {
          isAudioLoaded = true;
        });
      }
    } catch (e) {
      print('Error loading audio asset: $e');
      if (_mounted) {
        setState(() {
          isAudioLoaded = false;
        });
      }
    }
  }

  String formatTime(Duration time) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(time.inMinutes.remainder(60));
    final seconds = twoDigits(time.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _mounted = false;
    _playerStateSubscription?.cancel();
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [Color(0xFFFFf1db), Color(0xFFFFbc97)],
          ),
        ),
        child: Stack(
          children: <Widget>[
            _buildTopBar(screenWidth),
            _buildAudioPlayerBox(screenWidth),
            _buildBenefitsTitle(screenWidth),
            _buildBenefitsBox(screenWidth),
            _buildFooterText(screenWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(double screenWidth) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 69,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(212, 141, 102, 0.95),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset('assets/arrow_left.png', width: 30, height: 30),
            ),
            Text(
              'Vanaspati Raaga',
              style: TextStyle(
                color: brown,
                fontFamily: 'Inter',
                fontSize: screenWidth * 0.06,
              ),
            ),
            Image.asset('assets/ragachikitsalogo.png', width: 35, height: 35),
          ],
        ),
      ),
    );
  }

  Widget _buildAudioPlayerBox(double screenWidth) {
    return Positioned(
      top: 87,
      left: 16,
      right: 16,
      child: Container(
        height: 220,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(212, 141, 102, 0.38),
          border: Border.all(color: const Color.fromRGBO(212, 141, 102, 1)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Image.asset('assets/Image3.png', width: 22, height: 22),
                const SizedBox(width: 10),
                Text(
                  'Vanaspati',
                  style: TextStyle(
                    color: brown,
                    fontFamily: 'Inter',
                    fontSize: screenWidth * 0.06,
                  ),
                ),
              ],
            ),
            const Divider(color: Color.fromRGBO(212, 141, 102, 1), thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/Icons8shuffle241 (1).png', width: 24),
                IconButton(
                  icon: Image.asset('assets/Icons8last481.png', width: 30),
                  onPressed: () async {
                    if (position > const Duration(seconds: 5)) {
                      await audioPlayer.seek(position - const Duration(seconds: 5));
                    } else {
                      await audioPlayer.seek(Duration.zero);
                    }
                  },
                ),
                IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 30,
                    color: brown,
                  ),
                  onPressed: () async {
                    if (isAudioLoaded) {
                      isPlaying ? await audioPlayer.pause() : await audioPlayer.resume();
                    } else {
                      print('Audio not loaded.');
                    }
                  },
                ),
                Transform.rotate(
                  angle: math.pi,
                  child: IconButton(
                    icon: Image.asset('assets/Icons8last482.png', width: 30),
                    onPressed: () async {
                      final newPosition = position + const Duration(seconds: 5);
                      if (newPosition < (duration ?? Duration.zero)) {
                        await audioPlayer.seek(newPosition);
                      } else {
                        await audioPlayer.seek(duration ?? Duration.zero);
                      }
                    },
                  ),
                ),
                Image.asset('assets/Icons8add481.png', width: 35),
              ],
            ),
            Row(
              children: [
                Text(formatTime(position), style: const TextStyle(color: brown, fontSize: 14)),
                Expanded(
                  child: Slider(
                    activeColor: brown,
                    inactiveColor: const Color.fromRGBO(212, 141, 102, 1),
                    value: position.inSeconds.toDouble().clamp(0, (duration?.inSeconds.toDouble() ?? 0)),
                    min: 0,
                    max: duration?.inSeconds.toDouble() ?? 1,
                    onChanged: (value) async {
                      await audioPlayer.seek(Duration(seconds: value.toInt()));
                    },
                  ),
                ),
                Text(formatTime(duration ?? Duration.zero), style: const TextStyle(color: brown, fontSize: 14)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBenefitsTitle(double screenWidth) {
    return Positioned(
      top: 330,
      left: 16,
      child: Text(
        'Wellness Benefits',
        style: TextStyle(
          color: brown,
          fontFamily: 'Inter',
          fontSize: screenWidth * 0.06,
        ),
      ),
    );
  }

  Widget _buildBenefitsBox(double screenWidth) {
    return Positioned(
      top: 376,
      left: 16,
      right: 16,
      bottom: 60,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(212, 141, 102, 0.15),
            border: Border.all(color: const Color.fromRGBO(212, 141, 102, 1)),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mental and Emotional Benefits:', style: TextStyle(color: brown, fontSize: screenWidth * 0.05)),
              const SizedBox(height: 8),
              _buildBenefitRow('Balances mood swings and scattered thoughts.'),
              _buildBenefitRow('Supports emotional grounding and inner stability.'),
              _buildBenefitRow('Useful for meditation and quiet reflection.'),
              _buildBenefitRow('Stimulates mental alertness without overstimulation.'),
              const SizedBox(height: 16),
              Text('Physical Health Benefits:', style: TextStyle(color: brown, fontSize: screenWidth * 0.05)),
              const SizedBox(height: 8),
              _buildBenefitRow('Prepares the body for rest and helps with mild insomnia.'),
              _buildBenefitRow('Offers a gentle energy reset through sound resonance.'),
              _buildBenefitRow('The calming effect can support parasympathetic nervous system activity.'),
              _buildBenefitRow('The soothing tones can help reduce hypertension.'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooterText(double screenWidth) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 16,
      child: Center(
        child: Text(
          'Every raaga is a step towards inner peace',
          style: TextStyle(
            color: const Color.fromRGBO(106, 24, 5, 0.5),
            fontSize: screenWidth * 0.03,
          ),
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
          Container(width: 8, height: 8, decoration: const BoxDecoration(color: brown, shape: BoxShape.circle)),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: const TextStyle(color: brown, fontSize: 16))),
        ],
      ),
    );
  }
}
