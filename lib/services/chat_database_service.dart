import 'package:cloud_firestore/cloud_firestore.dart';

class ChatDatabaseService {

  // Chats collection
  final CollectionReference chatsCollection =
      FirebaseFirestore.instance.collection('chats');

  /////////////////////////////////////////////
  ///                CHATS                 ////
  /// /////////////////////////////////////////
  /// 

  // To get multiple docs
  Stream<QuerySnapshot> get chats {
    return chatsCollection.snapshots();
  }


}