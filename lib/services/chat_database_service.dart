import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multilingual_chat/services/models/chat_details.dart';
import 'package:multilingual_chat/services/models/user.dart';

class ChatDatabaseService {
  // Chats collection
  final CollectionReference chatsCollection =
      FirebaseFirestore.instance.collection('chats');

  // Set value before calling single user chat stream
  late String singleUserChatDoc;
  // To be used by multiple chats stream to know current user
  late CustomUser signedInUser;

  // GET FUNCTIONS
  // To get multiple docs, used in the home page
  // Will potentially have nulls in the list. Remove nulls before use
  Stream<List<ChatDetails?>> get multipleChats {
    return chatsCollection.snapshots().map(_chatsListFromSnapshot);
  }

  List<ChatDetails?> _chatsListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      // Confirm doc is of a chat in which the user is involved in
      if (doc.id
          .contains(signedInUser.displayName!.replaceAll(RegExp(r' '), ''))) {
        // Get the other user's details
        CustomUser _otherUser;
        if (signedInUser.email == doc.get('person1 details')[2]) {
          _otherUser = CustomUser(
              uid: doc.get('person2 details')[0],
              displayName: doc.get('person2 details')[1],
              email: doc.get('person2 details')[2],
              photoUrl: doc.get('person2 details')[3]);
        } else {
          _otherUser = CustomUser(
              uid: doc.get('person1 details')[0],
              displayName: doc.get('person1 details')[1],
              email: doc.get('person1 details')[2],
              photoUrl: doc.get('person1 details')[3]);
        }

        return ChatDetails(
            latestMessage: doc.get('latest_message'), user: _otherUser);
      } else {
        // Do nothing
      }
    }).toList();
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
