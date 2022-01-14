import 'package:flutter_tts/flutter_tts.dart';

class SpeakService {
  final FlutterTts _flutterTts = FlutterTts();

  Future speak({String words = '', String langej = ''}) async {
    if (langej != 'off') {
      await _flutterTts.setLanguage(langej);
      await _flutterTts.setPitch(1);
      await _flutterTts.speak(words);
    }
  }
}
