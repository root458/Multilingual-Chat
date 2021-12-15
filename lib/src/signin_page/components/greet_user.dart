import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:multilingual_chat/constants/constants.dart';

class GreetUserBox extends StatelessWidget {
  const GreetUserBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
          TypewriterAnimatedText(
            'Hello,',
            textStyle: _retStyle(),
            speed: const Duration(milliseconds: 250),
          ),
          TypewriterAnimatedText(
            'Hola,',
            textStyle: _retStyle(),
            speed: const Duration(milliseconds: 250),
          ),
          TypewriterAnimatedText(
            'Nǐn hǎo,',
            textStyle: _retStyle(),
            speed: const Duration(milliseconds: 250),
          ),
          TypewriterAnimatedText(
            'Bonjour,',
            textStyle: _retStyle(),
            speed: const Duration(milliseconds: 250),
          ),
        ]),
        Text(
          'Welcome Back',
          style: _retStyle(),
        ),
        Text(
          'Log in to your account',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: kMain),
        ),
      ],
    );
  }

  TextStyle _retStyle() {
    return TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: kMain);
  }
}
