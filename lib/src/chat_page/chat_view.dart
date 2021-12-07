import 'package:flutter/material.dart';
import 'package:multilingual_chat/constants/constants.dart';
import 'package:multilingual_chat/src/chat_page/components/message_box.dart';
import 'package:multilingual_chat/src/chat_page/components/message_model.dart';
import 'components/appbar_style.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var m1 = const Message(messageText: 'Hello', isMine: true);
    var m2 = const Message(messageText: 'Hey sir', isMine: false);


    return Scaffold(
      backgroundColor: kSecondary,
      bottomNavigationBar: BottomAppBar(
        child: Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Icon(Icons.mic),
              const Spacer(),
              const Icon(Icons.reply_all),
              const Icon(Icons.send)
            ]),
      ),
      appBar: AppBar(
        backgroundColor: kMain,
        title: const CustomAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MessageBox(message: m1),
            MessageBox(message: m2)
          ],
        ),
      ),
    );
  }
}
