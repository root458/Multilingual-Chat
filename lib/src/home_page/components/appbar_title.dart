import 'package:flutter/material.dart';
import 'package:multilingual_chat/constants/constants.dart';
import 'package:multilingual_chat/services/auth.dart';
import 'package:provider/provider.dart';

class CustomAppBarTitle extends StatelessWidget {
  const CustomAppBarTitle({Key? key, required context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Auth service
    final _auth = Provider.of<AuthService>(context);
    // final _auth = context.watch<AuthService>();
    // Screen dimensions
  
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.85,
      height: 40.0,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: kMain,
            spreadRadius: 0.5,
            blurRadius: 5.0,
          ),
        ],
        color: kMain,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 17.0,
              backgroundImage: NetworkImage(
                _auth.user.photoUrl ??
                    'https://images.app.goo.gl/tGR3mMzQkNyDgeWd9',
              ),
            ),
            const Text(
              'Search chats',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            PopupMenuButton(
              color: kSecondary,
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "Logout",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        )
                      ],
                    )),
              ],
              onSelected: (value) async {
                await _auth.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
