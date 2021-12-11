import 'package:flutter/material.dart';
import 'package:multilingual_chat/constants/constants.dart';

class CustomAppBarTitle extends StatelessWidget {
  const CustomAppBarTitle({Key? key, required context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.85,
      height: 40.0,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: kMain,
            spreadRadius: 0.5,
            blurRadius: 5.0,
          ),
        ],
        color: kMain,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(
              Icons.search,
              color: Colors.white,
            ),
            Text(
              'Search chats',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
