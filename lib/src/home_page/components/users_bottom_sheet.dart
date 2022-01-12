import 'package:flutter/material.dart';
import 'package:multilingual_chat/constants/constants.dart';
import 'package:multilingual_chat/services/auth.dart';
import 'package:multilingual_chat/services/chat_data_provider.dart';
import 'package:multilingual_chat/services/chat_database_service.dart';
import 'package:multilingual_chat/services/database_services.dart';
import 'package:multilingual_chat/services/models/user.dart';
import 'package:multilingual_chat/src/chat_page/chat_view.dart';
import 'package:provider/provider.dart';

void showUsersToChat(BuildContext context, double height, AuthService auth) {
  showModalBottomSheet(
    backgroundColor: kSecondary,
    context: context,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: kSecondary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Text('Select User',
                  style: TextStyle(color: kMain, fontSize: 20.0)),
            ),
            StreamBuilder<List<CustomUser>>(
                stream: DatabaseService(uid: auth.user.uid).availableUsers,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    final List availableUsers = snapshot.data as List;

                    return SizedBox(
                      height: height * 0.47,
                      child: ListView.builder(
                        itemExtent: height / 9.5,
                        itemCount: availableUsers.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            enabled:
                                availableUsers[index].email == auth.user.email
                                    ? false
                                    : true,
                            leading: availableUsers[index].photoUrl == null
                                ? CircleAvatar(
                                    backgroundColor: kMain,
                                    child: Text(
                                      availableUsers[index].displayName![0],
                                      style: TextStyle(color: kSecondary),
                                    ),
                                  )
                                : CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      availableUsers[index].photoUrl ?? '',
                                    ),
                                    radius: 35.0,
                                  ),
                            tileColor: kSecondary,
                            title: Text(availableUsers[index].displayName ?? '',
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis)),
                            subtitle: Text(availableUsers[index].email ?? '',
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis)),
                            onTap: () async {
                              // Determine chat doc
                              String chatDoc = getChatDoc(
                                  availableUsers[index].displayName,
                                  auth.user.displayName ?? '');

                              // Initialize data if doc does not exist
                              final _chatDatabaseService =
                                  ChatDatabaseService();

                              // Sort to get person1 and person2
                              List userNames = [
                                availableUsers[index].displayName,
                                auth.user.displayName
                              ];

                              userNames.sort();

                              CustomUser person1, person2;

                              if (auth.user.displayName == userNames[0]) {
                                person1 = auth.user;
                                person2 = availableUsers[index];
                              } else {
                                person2 = auth.user;
                                person1 = availableUsers[index];
                              }

                              await _chatDatabaseService
                                  .initializeChat(chatDoc, {
                                'messages': <Map>[],
                                'latest_message': ['.', auth.user.email],
                                'person1 details': [
                                  person1.uid,
                                  person1.displayName,
                                  person1.email,
                                  person1.photoUrl
                                ],
                                'person2 details': [
                                  person2.uid,
                                  person2.displayName,
                                  person2.email,
                                  person2.photoUrl
                                ],
                              });

                              // Route to chat view page, with user data
                              // Selected user, chatDoc name, set using provider
                              final chatData =
                                  Provider.of<ChatData>(context, listen: false);
                              chatData.setChatData(
                                  availableUsers[index], chatDoc);

                              // Pop bottom sheet
                              Navigator.pop(context);
                              // Route to Chat view
                              Navigator.restorablePushNamed(
                                context,
                                ChatView.routeName,
                              );
                            },
                          );
                        },
                      ),
                    );
                  }
                  return const Center(
                    child: Text('No users currently available :-('),
                  );
                })
          ],
        ),
      );
    },
  );
}
