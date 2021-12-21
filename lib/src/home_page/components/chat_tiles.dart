import 'package:flutter/material.dart';
import 'package:multilingual_chat/constants/constants.dart';

class ChatTiles extends SliverFixedExtentList {
  ChatTiles(BuildContext context, extent, auth, {Key? key})
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
                  onTap: () async {
                    // Navigate to the details page. If the user leaves and returns to
                    // the app after it has been killed while running in the
                    // background, the navigation stack is restored.
                    await auth.logout();
                    // Navigator.restorablePushNamed(
                    //   context,
                    //   ChatView.routeName,
                    // );
                  },
                );
              },
            ),
            itemExtent: extent);
}
