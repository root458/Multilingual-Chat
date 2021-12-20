import 'package:flutter/material.dart';
import 'package:multilingual_chat/constants/constants.dart';
import 'package:multilingual_chat/src/chat_page/chat_view.dart';

class ChatTiles extends SliverFixedExtentList {
  ChatTiles(BuildContext context, extent, {Key? key})
      : super(
            key: key,
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: kMain,
                    radius: 35.0,
                    child: Text('B',
                        style: TextStyle(
                          color: kSecondary,
                        )),
                  ),
                  tileColor: kSecondary,
                  title: const Text("Brittany"),
                  subtitle: const Text("Haloa"),
                  onTap: () {
                    // Navigate to the details page. If the user leaves and returns to
                    // the app after it has been killed while running in the
                    // background, the navigation stack is restored.
                    Navigator.restorablePushNamed(
                      context,
                      ChatView.routeName,
                    );
                  },
                );
              },
            ),
            itemExtent: extent);
}
