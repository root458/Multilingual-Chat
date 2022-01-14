import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:multilingual_chat/constants/constants.dart';
import 'package:multilingual_chat/services/auth.dart';
import 'package:multilingual_chat/services/chat_data_provider.dart';
import 'package:multilingual_chat/services/chat_database_service.dart';
import 'package:multilingual_chat/services/translation_service.dart';
import 'package:multilingual_chat/src/chat_page/components/message_box.dart';
import 'package:multilingual_chat/src/chat_page/components/message_model.dart';
import 'package:provider/provider.dart';
import 'components/appbar_style.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  static const routeName = '/chatview';

  @override
  Widget build(BuildContext context) {
    // Data
    final chatData = Provider.of<ChatData>(context);
    // Auth data
    final _auth = Provider.of<AuthService>(context);
    // Chat database service
    final _chatDatabaseService = ChatDatabaseService();
    // Set chatDoc property
    _chatDatabaseService.singleUserChatDoc = chatData.chatDoc;
    // Message String
    String _messagePhrase = '';
    // Text Editing controller
    final _textFieldController = TextEditingController();

    // Messages from snaphot
    late List _messagesCopy;

    // Latest to earliest
    late List messages;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kSecondary,
      bottomNavigationBar: Transform.translate(
        offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
        child: BottomAppBar(
          elevation: 30.0,
          child: Container(
            color: kSecondary,
            child: Row(
              children: [
                // const RecordingMicrophone(),
                Expanded(
                  child: TextFormField(
                    controller: _textFieldController,
                    onChanged: (word) {
                      // Update message onType
                      _messagePhrase = word;
                    },
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: "Message",
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_messagePhrase != '') {
                      // Create message Map from message phrase
                      Map messageToBeSent = {
                        'text': _messagePhrase,
                        'sender': _auth.user.email
                      };

                      // Send message
                      _messagesCopy.add(messageToBeSent);

                      // Write change to Database
                      await _chatDatabaseService.sendMessage(
                          [messageToBeSent['text'], _auth.user.email],
                          _messagesCopy);

                      // Clear text field
                      _textFieldController.clear();
                      _messagePhrase = '';
                    }
                  },
                  child: Icon(
                    Icons.send,
                    color: kMain,
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: kSecondary,
                    shape: const CircleBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: kMain,
        title: CustomAppBar(
          chatData: chatData,
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.language,
              color: Colors.white,
            ),
            color: kSecondary,
            itemBuilder: (context) => popUpMenuItems,
            onSelected: (value) {
              // Change langauge code
              Provider.of<LanguageCodeService>(context, listen: false)
                  .changeLanguageCode(value);
            },
          ),
        ],
      ),
      body: StreamBuilder<List>(
          stream: _chatDatabaseService.singleChat,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              // Receive the data
              final _messages = snapshot.data;

              // Update the messages copy variable
              _messagesCopy = _messages!;

              // Reverse messages
              List messagesToDisplay = _messagesCopy.reversed.toList();
              // Map to Message type
              messages = messagesToDisplay.map((messageMap) {
                return Message(
                    messageText: messageMap['text'],
                    isMine: messageMap['sender'] == _auth.user.email);
              }).toList();
              // Use below
              return ListView.builder(
                itemCount: messages.length,
                reverse: true,
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 8.0),
                // Here, the latest message should be first. Earlier messages last
                itemBuilder: (context, index) {
                  return MessageBox(
                    message: messages[index],
                  );
                },
              );
            } else {
              return Center(
                child: SpinKitChasingDots(
                  color: kAccent,
                  size: 50.0,
                ),
              );
            }
          }),
    );
  }
}
