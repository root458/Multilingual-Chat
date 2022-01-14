// import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:translator/translator.dart';
// import 'package:html_unescape/html_unescape.dart';
// import 'package:http/http.dart' as http;

class TranslationService {
  static Future<String> translateMessage(
      {required String message,
      required String fromLanguageCode,
      required String toLanguageCode}) async {
    if (toLanguageCode == 'off') {
      return message;
    } else {
      final translation = await GoogleTranslator()
          .translate(message, from: fromLanguageCode, to: toLanguageCode);

      return translation.text;
    }
  }
}

class LanguageCodeService with ChangeNotifier {
  List<String> languageCode = ['off', 'off'];
  void changeLanguageCode(List<String>  code) {
    languageCode = code;
    notifyListeners();
  }
}


// class TranslationAPI {
//   static const _apiKey = 'AIzaSyDmf-zlsUHhh_9kgfAfXfsUdGqWmiiYSQU';

//   static Future<String> translate(String message, String languageCode) async {
//     final response = await http.post(
//       Uri.parse("https://translation.googleapis.com/language/translate/v2?target=$languageCode&key=$_apiKey&q=$message"),
//     );
//     if (response.statusCode == 200) {
//       final body = json.decode(response.body);
//       final translations = body['data']['translations'] as List;
//       final translation = translations.first;

//       return HtmlUnescape().convert(translation['translatedText']);
//     } else {
//       throw Exception();
//     }
//   }
// }
