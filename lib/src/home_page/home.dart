import 'package:flutter/material.dart';
import 'package:multilingual_chat/constants/constants.dart';
import 'package:multilingual_chat/src/chat_page/chat_view.dart';
import 'package:multilingual_chat/src/home_page/components/appbar_title.dart';
import 'package:multilingual_chat/src/home_page/components/chat_tiles.dart';
import 'package:multilingual_chat/src/home_page/components/sliver_components.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    // Screen dimensions variables
    var size = MediaQuery.of(context).size;
    double _extent = size.height / 9.5;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kMain,
        onPressed: () {
          // Navigate to the details page. If the user leaves and returns to
          // the app after it has been killed while running in the
          // background, the navigation stack is restored.
          Navigator.restorablePushNamed(
            context,
            ChatView.routeName,
          );
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
          ChatTiles(context, _extent),
        ],
      ),
    );
  }
}
