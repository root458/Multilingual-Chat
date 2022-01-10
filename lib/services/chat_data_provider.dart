import 'package:flutter/cupertino.dart';
import 'package:multilingual_chat/services/models/user.dart';

class ChatData extends ChangeNotifier {
  late CustomUser selectedUser;
  late String chatDoc;

  void setChatData(CustomUser user, String doc) {
    selectedUser = user;
    chatDoc = doc;
    notifyListeners();
  }
}
