import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:multilingual_chat/services/database_services.dart';
import 'models/user.dart';

class AuthService extends ChangeNotifier {
  // Instance of Firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Instance of Google Sign In
  final googleSignIn = GoogleSignIn();
  // Google User account
  GoogleSignInAccount? _user;
  // Lighter user object
  CustomUser? _customUser;

  GoogleSignInAccount? get googleSignInAcc => _user;

  CustomUser get user => _customUser!;

  // Sign in with Google
  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      // Create custom user
      _customUser = CustomUser(
          uid: userCredential.user!.uid,
          displayName: _user?.displayName,
          email: _user!.email,
          photoUrl: _user?.photoUrl);

      // Initialize data
      final databaseService = DatabaseService(uid: _customUser!.uid);
      await databaseService.updateUserData(_customUser!.properties);
      // await databaseService.appendToUsersList(_customUser!.properties, []);
      notifyListeners();
    } catch (e) {
      // Do nothing
    }
  }

  // Sign out
  Future logout() async {
    await googleSignIn.disconnect();
    _auth.signOut();
  }

  // Stream to listen for auth changes
  Stream<User?> get loggedUser {
    return _auth.authStateChanges();
  }
}
