import 'package:flutter/material.dart';
import 'package:multilingual_chat/constants/constants.dart';
import 'package:multilingual_chat/src/chat_page/components/message_model.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({Key? key, required this.message}) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          message.isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Flexible(
          flex: 2,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                message.messageText,
                style: const TextStyle(fontSize: 20.0, color: Colors.white),
                overflow: TextOverflow.visible,
              ),
            ),
            decoration: _determineDeco(message),
          ),
        ),
        const Flexible(flex: 1, child: Text(''))
      ],
    );
  }

  BoxDecoration _determineDeco(Message message) {
    if (message.isMine) {
      return BoxDecoration(
        color: kAccent,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.zero,
        ),
      );
    } else {
      return BoxDecoration(
        color: kAccent,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          bottomLeft: Radius.zero,
          bottomRight: Radius.circular(20.0),
        ),
      );
    }
  }
}
