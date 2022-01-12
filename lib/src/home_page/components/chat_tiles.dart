import 'package:flutter/material.dart';
import 'package:multilingual_chat/constants/constants.dart';
import 'package:multilingual_chat/services/chat_data_provider.dart';
import 'package:multilingual_chat/src/chat_page/chat_view.dart';
import 'package:provider/provider.dart';

class ChatTiles extends SliverFixedExtentList {
  ChatTiles(BuildContext context, extent, auth, chats, {Key? key})
      : super(
          key: key,
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(chats[index].user.photoUrl),
                ),
                tileColor: kSecondary,
                title: Text(
                  chats[index].user.displayName,
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                ),
                subtitle: Text(
                    auth.user.email == chats[index].latestMessage[1]
                        ? 'You: ${chats[index].latestMessage[0]}'
                        : chats[index].latestMessage[0],
                    style: const TextStyle(overflow: TextOverflow.ellipsis)),
                onTap: () {
                  // Set data on ChatData service
                  // Selected user, chatDoc name, set using provider
                  // Determine chat doc
                  String chatDoc = getChatDoc(chats[index].user.displayName,
                      auth.user.displayName ?? '');

                  final chatData =
                      Provider.of<ChatData>(context, listen: false);
                  chatData.setChatData(chats[index].user, chatDoc);
                  // Route to chat page
                  Navigator.restorablePushNamed(
                    context,
                    ChatView.routeName,
                  );
                },
              );
            },
            childCount: chats.length,
          ),
          itemExtent: extent,
        );
}
