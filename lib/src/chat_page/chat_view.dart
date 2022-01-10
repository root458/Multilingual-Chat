import 'package:flutter/material.dart';
import 'package:multilingual_chat/constants/constants.dart';
import 'package:multilingual_chat/services/chat_data_provider.dart';
import 'package:multilingual_chat/src/chat_page/components/message_box.dart';
import 'package:multilingual_chat/src/chat_page/components/message_model.dart';
import 'package:provider/provider.dart';
import 'components/appbar_style.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  static const routeName = '/chatview';

  @override
  Widget build(BuildContext context) {

    // Data
    final chatData = Provider.of<ChatData>(context);
    
    var m1 = const Message(messageText: "Hello", isMine: true);
    var m2 = const Message(
        messageText: "Hey sir. I'm fine. Thanks for asking!", isMine: false);
    var m3 = const Message(
        messageText: "Great. How far had we progressed?", isMine: true);
    var m4 = const Message(messageText: "Hello", isMine: false);

    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: kSecondary,
        bottomNavigationBar: Transform.translate(
          offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
          child: BottomAppBar(
            elevation: 30.0,
            child: Container(
              color: kSecondary,
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.mic,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: kMain,
                      shape: const CircleBorder(),
                    ),
                  ),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Message",
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: kMain,
                      shape: const CircleBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: kMain,
          title: CustomAppBar(chatData: chatData,),
        ),
        body: Column(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  // physics: const BouncingScrollPhysics(),
                  reverse: true,
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 0.0),
                  // Here the latest message should be at the top. Earlier messages below
                  children: [
                    MessageBox(message: m4),
                    MessageBox(message: m3),
                    MessageBox(message: m2),
                    MessageBox(message: m3),
                    MessageBox(message: m2),
                    MessageBox(message: m3),
                    MessageBox(message: m2),
                    MessageBox(message: m3),
                    MessageBox(message: m2),
                    MessageBox(message: m3),
                    MessageBox(message: m2),
                    MessageBox(message: m1),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
