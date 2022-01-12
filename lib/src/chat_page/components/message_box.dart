import 'package:flutter/material.dart';
import 'package:multilingual_chat/constants/constants.dart';
import 'package:multilingual_chat/services/translation_service.dart';
import 'package:multilingual_chat/src/chat_page/components/message_model.dart';
import 'package:provider/provider.dart';

class MessageBox extends StatelessWidget {
  const MessageBox(
      {Key? key, required this.message})
      : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {

    // Get language code
    final _languageCodeService = Provider.of<LanguageCodeService>(context);
                    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 0.0),
      child: Row(
        mainAxisAlignment:
            message.isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: _determineOrientation(message, _languageCodeService.languageCode),
      ),
    );
  }

  BoxDecoration _determineDeco(Message message) {
    if (message.isMine) {
      return BoxDecoration(
        color: kAccent,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.zero,
        ),
      );
    } else {
      return BoxDecoration(
        color: kSecondary,
        border: Border.all(color: kAccent),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          bottomLeft: Radius.zero,
          bottomRight: Radius.circular(20.0),
        ),
      );
    }
  }

  List<Widget> _determineOrientation(Message message, String code) {
    if (message.isMine) {
      return [
        const Flexible(flex: 1, child: Text('')),
        Flexible(
          flex: 2,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                message.messageText,
                style: TextStyle(
                  fontSize: 18.0,
                  color: message.isMine ? Colors.white : kAccent,
                ),
                overflow: TextOverflow.visible,
              ),
            ),
            decoration: _determineDeco(message),
          ),
        ),
      ];
    } else {
      return [
        Flexible(
          flex: 2,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FutureBuilder(
                  future: TranslationService.translateMessage(
                      message: message.messageText,
                      fromLanguageCode: 'auto',
                      toLanguageCode: code),
                  initialData: message.messageText,
                  builder: (context, AsyncSnapshot<String> translatedText) {
                    return Text(
                      translatedText.data!,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: message.isMine ? Colors.white : kAccent,
                      ),
                      overflow: TextOverflow.visible,
                    );
                  }),
            ),
            decoration: _determineDeco(message),
          ),
        ),
        const Flexible(flex: 1, child: Text(''))
      ];
    }
  }
}
