import 'package:flutter/cupertino.dart';
import 'package:translator/translator.dart';

class TranslationService {
  static Future<String> translateMessage(
      {required String message,
      required String fromLanguageCode,
      required String toLanguageCode}) async {
    if (toLanguageCode == 'off') {
      return message;
    } else {
      try {
        final translation = await GoogleTranslator()
            .translate(message, from: fromLanguageCode, to: toLanguageCode);

        return translation.text;
      } catch (e) {
        return message;
      }
    }
  }
}

class LanguageCodeService with ChangeNotifier {
  List<String> languageCode = ['off', 'off'];
  void changeLanguageCode(List<String> code) {
    languageCode = code;
    notifyListeners();
  }
}
