import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'models/user.dart';

class AuthService {
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
      // Create custom user
      _customUser = CustomUser(
          uid: _user!.id,
          displayName: _user?.displayName,
          email: _user!.email,
          photoUrl: _user?.photoUrl);

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await _auth.signInWithCredential(credential);
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
