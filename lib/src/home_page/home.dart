import 'package:flutter/material.dart';
import 'package:multilingual_chat/constants/constants.dart';
import 'package:multilingual_chat/services/auth.dart';
import 'package:multilingual_chat/services/chat_database_service.dart';
import 'package:multilingual_chat/services/models/chat_details.dart';
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
    // Auth Provider
    final _auth = Provider.of<AuthService>(context);
    // Chat Database Service
    final ChatDatabaseService _chatDatabaseService = ChatDatabaseService();
    // set Signed in user
    _chatDatabaseService.signedInUser = _auth.user;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kMain,
        onPressed: () {
          // Show bottom sheet
          showUsersToChat(context, _extent, _auth);
        },
        child: const Icon(Icons.chat),
      ),
      body: CustomScrollView(
        physics: const PageScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: kSecondary,
            centerTitle: true,
            stretch: true,
            pinned: true,
            title: CustomAppBarTitle(context: context),
          ),
          TitleSection('MESSAGES'),
          StreamBuilder<List<ChatDetails?>>(
              stream: _chatDatabaseService.multipleChats,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  // Obtain the data
                  final chatsList = snapshot.data;
                  // Remove any null values
                  List<ChatDetails?> chatsWithoutNulls = chatsList!;
                  chatsWithoutNulls.removeWhere((chat) => chat == null);
                  return ChatTiles(
                      context, (_extent / 9.5), _auth, chatsWithoutNulls);
                } else {
                  return ChatTiles(
                      context, (_extent / 9.5), _auth, const <ChatDetails>[]);
                }
              }),
        ],
      ),
    );
  }
}
