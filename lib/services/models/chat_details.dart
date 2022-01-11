import 'package:multilingual_chat/services/models/user.dart';

class ChatDetails {
  String latestMessage;
  CustomUser user;

  ChatDetails(
      {required this.latestMessage,
      required this.user});
}
