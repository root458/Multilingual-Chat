import 'package:flutter/material.dart';
import 'package:multilingual_chat/constants/constants.dart';
import 'package:multilingual_chat/services/auth.dart';
import 'package:multilingual_chat/src/home_page/components/appbar_title.dart';
import 'package:multilingual_chat/src/home_page/components/chat_tiles.dart';
import 'package:multilingual_chat/src/home_page/components/sliver_components.dart';
import 'package:multilingual_chat/src/home_page/components/users_bottom_sheet.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Data
    // Screen dimensions variables
    var size = MediaQuery.of(context).size;
    double _extent = size.height;

    final _auth = Provider.of<AuthService>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kMain,
        onPressed: () {
          showUsersToChat(context, _extent, _auth);
          // Navigator.restorablePushNamed(
          //   context,
          //   ChatView.routeName,
          // );
        },
        child: const Icon(Icons.chat),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: kSecondary,
            centerTitle: true,
            stretch: true,
            pinned: true,
            title: CustomAppBarTitle(context: context),
          ),
          TitleSection('MESSAGES'),
          ChatTiles(context, (_extent / 9.5), _auth),
        ],
      ),
    );
  }
}
