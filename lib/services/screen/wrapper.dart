import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multilingual_chat/services/auth.dart';
import 'package:multilingual_chat/services/screen/loading_screen.dart';
import 'package:multilingual_chat/src/home_page/home.dart';
import 'package:multilingual_chat/src/signin_page/sign_in.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);
    // Receive auth changes here
    // Return either Home Screen or Sign In Screen
    return StreamBuilder<User?>(
      stream: auth.loggedUser,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final loggedUser = snapshot.data;
          return loggedUser != null ? const HomePage() : const SignInScreen();
        }
        return const LoadingScreen();
      },
    );
  }
}
