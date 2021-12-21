import 'package:flutter/material.dart';
import 'package:multilingual_chat/constants/constants.dart';
import 'package:multilingual_chat/services/auth.dart';
import 'package:multilingual_chat/services/database_services.dart';
import 'package:multilingual_chat/services/system_services.dart';
import 'package:provider/provider.dart';

class CustomAppBarTitle extends StatelessWidget {
  const CustomAppBarTitle({Key? key, required context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Auth service
    final _auth = Provider.of<AuthService>(context);
    final _databaseService = DatabaseService(uid: _auth.user.uid);

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
            _returnAvatar(_databaseService),
            StreamBuilder<DateTime>(
                stream: SystemServices().timeNow(),
                initialData: DateTime.now(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    var time = snapshot.data;

                    return Text(
                      _determineGreeting(time!),
                      style:
                          const TextStyle(color: Colors.white, fontSize: 20.0),
                    );
                  } else {
                    return const Text(
                      'Hello',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    );
                  }
                }),
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

  Widget _returnAvatar(DatabaseService service) {
    try {
      return FutureBuilder<Map>(
        future: service.userDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map userDetails = snapshot.data as Map;

            return CircleAvatar(
              radius: 17.0,
              backgroundImage: NetworkImage(
                userDetails['photoUrl'],
              ),
            );
          } else {
            return const CircleAvatar(
              radius: 17.0,
              backgroundImage: NetworkImage(
                'https://images.app.goo.gl/tGR3mMzQkNyDgeWd9',
              ),
            );
          }
        },
      );
    } catch (e) {
      return const CircleAvatar(
        radius: 17.0,
        backgroundImage: NetworkImage(
          'https://images.app.goo.gl/tGR3mMzQkNyDgeWd9',
        ),
      );
    }
  }

  String _determineGreeting(DateTime time) {
    var now = time;
    var four59am = DateTime(now.year, now.month, now.day, 4, 59);
    var noon = DateTime(now.year, now.month, now.day, 12, 0);
    var four59pm = DateTime(now.year, now.month, now.day, 16, 59);

    String greeting;
    if (now.isAfter(four59am) && now.isBefore(noon)) {
      greeting = 'Good morning';
    } else if ((now.isAtSameMomentAs(noon) || now.isAfter(noon)) &&
        (now.isAtSameMomentAs(four59pm) || now.isBefore(four59pm))) {
      greeting = 'Good afternoon';
    } else {
      greeting = 'Good evening';
    }

    return greeting;
  }
}
