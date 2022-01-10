import 'package:cloud_firestore/cloud_firestore.dart';

class ChatDatabaseService {
  // Chats collection
  final CollectionReference chatsCollection =
      FirebaseFirestore.instance.collection('chats');

  // Set value before calling single user chat stream
  late String singleUserChatDoc;

  // GET FUNCTIONS
  // To get multiple docs, used in the home page
  Stream<QuerySnapshot> get multipleChats {
    return chatsCollection.snapshots();
  }

  // To get a user's chat, used in the chat page
  Stream<DocumentSnapshot> get singleChat {
    return chatsCollection.doc(singleUserChatDoc).snapshots();
  }

  // SET FUNCTIONS
  // Initialize chat doc
  Future initializeChat(String chatDoc, Map<String, dynamic> details) async {
    DocumentSnapshot document = await chatsCollection.doc(chatDoc).get();
    if (!document.exists) {
      // Write the initial data if the doc did not exist
      await chatsCollection.doc(chatDoc).set(details);
    }
  }
  // Send message functions

}
