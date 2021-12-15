import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multilingual_chat/constants/constants.dart';
import 'package:multilingual_chat/src/signin_page/components/greet_user.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kSecondary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 0.7*size.width,
              height: 0.2*size.height,
              child: Image.asset(
                'assets/images/logo.png',
                color: kMain,
                width: 0.7*size.width,
                height: 0.2*size.height,
                fit: BoxFit.fitHeight,
                ),
            )
          ),
          const GreetUserBox(),
          ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(kMain),
                elevation: MaterialStateProperty.all<double>(5),
                shadowColor: MaterialStateProperty.all<Color>(kMain),
                fixedSize: MaterialStateProperty.all<Size>(Size(0.7*size.width, 50)),
              ),
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.google,
                color: kSecondary,
              ),
              label: const Text('Sign In', style: TextStyle(fontSize: 20),))
        ],
      ),
    );
  }
}
