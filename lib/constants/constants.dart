import 'package:flutter/material.dart';

Color kMain = const Color(0xff55007f);
Color kSecondary = const Color(0xfffbf2ff);
Color kAccent = const Color(0xff00008c);

String getChatDoc(String fName, String sName) {
  List userNames = <String?>[fName, sName];
  userNames.sort();
  String chatDoc = userNames.join();
  chatDoc = chatDoc.replaceAll(RegExp(r' '), '');
  return chatDoc;
}

List<PopupMenuItem<List<String>>> popUpMenuItems = [
  PopupMenuItem<List<String>>(
      value: const ['off', 'off'],
      child: Text(
        "Default",
        style: TextStyle(
          color: kMain,
        ),
      )),
  PopupMenuItem<List<String>>(
      value: const ['sw', 'SW'],
      child: Text(
        "Swahili",
        style: TextStyle(
          color: kMain,
        ),
      )),
  PopupMenuItem<List<String>>(
      value: const ['en', 'en-GB'],
      child: Text(
        "English",
        style: TextStyle(
          color: kMain,
        ),
      )),
  PopupMenuItem<List<String>>(
      value: const ['fr', 'fr-FR'],
      child: Text(
        "French",
        style: TextStyle(
          color: kMain,
        ),
      )),
  PopupMenuItem<List<String>>(
      value: const ['nl', 'NL'],
      child: Text(
        "Dutch",
        style: TextStyle(
          color: kMain,
        ),
      )),
  PopupMenuItem<List<String>>(
      value: const ['cs', 'cs-CZ'],
      child: Text(
        "Czech",
        style: TextStyle(
          color: kMain,
        ),
      )),
  PopupMenuItem<List<String>>(
      value: const ['de', 'de-DE'],
      child: Text(
        "German",
        style: TextStyle(
          color: kMain,
        ),
      )),
  PopupMenuItem<List<String>>(
      value: const ['it', 'it-IT'],
      child: Text(
        "Italian",
        style: TextStyle(
          color: kMain,
        ),
      )),
  PopupMenuItem<List<String>>(
      value: const ['ja', 'ja-JP'],
      child: Text(
        "Japanese",
        style: TextStyle(
          color: kMain,
        ),
      )),
  PopupMenuItem<List<String>>(
      value: const ['pt', 'pt-PT'],
      child: Text(
        "Portuguese",
        style: TextStyle(
          color: kMain,
        ),
      )),
  PopupMenuItem<List<String>>(
      value: const ['es', 'es-ES'],
      child: Text(
        "Spanish",
        style: TextStyle(
          color: kMain,
        ),
      )),
];
