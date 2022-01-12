import 'package:multilingual_chat/services/models/user.dart';

class ChatDetails {
  List latestMessage;
  CustomUser user;

  ChatDetails(
      {required this.latestMessage,
      required this.user});
}
