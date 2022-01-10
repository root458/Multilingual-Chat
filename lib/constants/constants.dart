import 'package:flutter/cupertino.dart';

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
