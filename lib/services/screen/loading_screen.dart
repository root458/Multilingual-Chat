import 'package:flutter/material.dart';
import 'package:multilingual_chat/constants/constants.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LinearProgressIndicator(
              color: kMain,
              valueColor: AlwaysStoppedAnimation(kSecondary),
              minHeight: 20,
            ),
          ],
        ),
      ),
    );
  }
}