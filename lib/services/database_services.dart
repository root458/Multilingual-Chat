import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multilingual_chat/services/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // Users collection
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');


  // Update user data
  Future updateUserData(Map<String, String?> details) async {
    await usersCollection.doc(uid).set(details);
  }

  // Get user data
  Future<Map> get userDetails async {
    return _userFromUserDocSnapshot((await usersCollection.doc(uid).get()));
  }

  Map _userFromUserDocSnapshot(DocumentSnapshot snapshot) {
    Map userDetails = snapshot.data() as Map;
    return userDetails;
  }

  // Get users
  Stream<List<CustomUser>> get availableUsers {
    return usersCollection.snapshots().map(_userListFromSnapshot);
  }

  // List
  List<CustomUser> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return CustomUser(
          email: doc.get('email'),
          uid: doc.get('uid'),
          displayName: doc.get('displayName'),
          photoUrl: doc.get('photoUrl'));
    }).toList();
  }
}

// // One function for both
// Future addUser(Map<String, String?> details) async {
//   await updateUserData(details);
//   // DocumentSnapshot snapshot = await listOfUsers;
//   // List<Map> signedUsers = _listOfUsersFromSnapshot(snapshot) as List<Map>;
//   // print(signedUsers);
//   // await appendToUsersList(details, signedUsers);
// }

// Future appendToUsersList(
//     Map<String, String?> details, List<Map> usersList) async {
//   // Append user to List
//   Map map = {
//     'displayName': details['displayName'],
//     'photoUrl': details['photoUrl']
//   };
//   if (!usersList.contains(map)) {
//     usersList.add(map);
//   }
//   await usersCollection.doc('users_list').set({'list': usersList});
// }

// // Get list of users
// Future<DocumentSnapshot<Object?>> get listOfUsers async {
//   return await usersCollection.doc('users_list').get();
// }

// // List of users from document snapshot
// List listOfUsersFromSnapshot(DocumentSnapshot snapshot) {
//   Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

//   return data['list'];
// }