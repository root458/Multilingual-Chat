import 'package:flutter/material.dart';
import 'package:multilingual_chat/services/chat_data_provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.chatData
  }) : super(key: key);

  final ChatData chatData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(chatData.selectedUser.photoUrl ?? ''),
        ),
        const SizedBox(width: 10,),
        Text(chatData.selectedUser.displayName!.split(" ")[0])
      ],
    );
  }
}
