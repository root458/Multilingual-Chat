import 'package:flutter/material.dart';
import 'package:multilingual_chat/constants/constants.dart';
import 'package:multilingual_chat/src/chat_page/chat_view.dart';
import 'package:multilingual_chat/src/home_page/components/appbar_title.dart';

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
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: kMain,
                      radius: 35.0,
                      child: Text('B',
                          style: TextStyle(
                            color: kSecondary,
                          )),
                    ),
                    tileColor: kSecondary,
                    title: const Text("Brittany"),
                    subtitle: const Text("Haloa"),
                    onTap: () {
                      // Navigate to the details page. If the user leaves and returns to
                      // the app after it has been killed while running in the
                      // background, the navigation stack is restored.
                      Navigator.restorablePushNamed(
                        context,
                        ChatView.routeName,
                      );
                    },
                  );
                },
              ),
              itemExtent: _extent),
        ],
      ),
    );
  }
}
