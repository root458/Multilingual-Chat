import 'package:flutter/material.dart';
import 'package:multilingual_chat/constants/constants.dart';

void showUsersToChat(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: kSecondary,
    context: context,
    builder: (context) {
      return const Text('Users');
    },
  );
}
