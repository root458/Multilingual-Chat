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