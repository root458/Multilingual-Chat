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

List<PopupMenuItem<String>> popUpMenuItems = [
  PopupMenuItem<String>(
      value: 'off',
      child: Text(
        "Default",
        style: TextStyle(
          color: kMain,
        ),
      )),
  PopupMenuItem<String>(
      value: 'sw',
      child: Text(
        "Swahili",
        style: TextStyle(
          color: kMain,
        ),
      )),
  PopupMenuItem<String>(
      value: 'en',
      child: Text(
        "English",
        style: TextStyle(
          color: kMain,
        ),
      )),
  PopupMenuItem<String>(
      value: 'fr',
      child: Text(
        "French",
        style: TextStyle(
          color: kMain,
        ),
      )),
  PopupMenuItem<String>(
      value: 'nl',
      child: Text(
        "Dutch",
        style: TextStyle(
          color: kMain,
        ),
      )),
  PopupMenuItem<String>(
      value: 'cs',
      child: Text(
        "Czech",
        style: TextStyle(
          color: kMain,
        ),
      )),
  PopupMenuItem<String>(
      value: 'de',
      child: Text(
        "German",
        style: TextStyle(
          color: kMain,
        ),
      )),
  PopupMenuItem<String>(
      value: 'it',
      child: Text(
        "Italian",
        style: TextStyle(
          color: kMain,
        ),
      )),
  PopupMenuItem<String>(
      value: 'ja',
      child: Text(
        "Japanese",
        style: TextStyle(
          color: kMain,
        ),
      )),
  PopupMenuItem<String>(
      value: 'pt',
      child: Text(
        "Portuguese",
        style: TextStyle(
          color: kMain,
        ),
      )),
  PopupMenuItem<String>(
      value: 'es',
      child: Text(
        "Spanish",
        style: TextStyle(
          color: kMain,
        ),
      )),
  PopupMenuItem<String>(
      value: 'zh-TW',
      child: Text(
        "Chinese",
        style: TextStyle(
          color: kMain,
        ),
      )),
];
