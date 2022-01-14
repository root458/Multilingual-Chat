import 'package:flutter/material.dart';

class NoChats extends SliverFixedExtentList {
  NoChats(BuildContext context, double height, {Key? key})
      : super(
          key: key,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, index) {
              return const SizedBox.expand(
                child: Center(
                  child: Text('No chats. Tap the chat button to start a chat ;-)',
                      style: TextStyle(overflow: TextOverflow.visible)),
                ),
              );
            },
            childCount: 1,
          ),
          itemExtent: height,
        );
}
