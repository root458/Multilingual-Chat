import 'package:flutter/material.dart';
import 'package:multilingual_chat/constants/constants.dart';

class BreathingRoom extends SliverFixedExtentList {
  BreathingRoom(double height, {Key? key})
      : super(key: key, 
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, index) {
              return Container();
            },
            childCount: 1,
          ),
          itemExtent: height,
        );
}


class TitleSection extends SliverFixedExtentList {
  TitleSection(String title, {Key? key}) : super(key: key, 
    delegate: SliverChildBuilderDelegate(
          (BuildContext context, index) {
        return ListTile(
          tileColor: kSecondary,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(10.0,0,0,0),
            child: Text(
                title,
              style: TextStyle(
                color: kMain,
              ),
            ),
          ),
          subtitle: const Text(''),
        );
      },
      childCount: 1,
    ),
    itemExtent: 50.0,
  );
}

