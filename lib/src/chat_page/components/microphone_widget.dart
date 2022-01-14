import 'package:flutter/material.dart';
import 'package:multilingual_chat/constants/constants.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:speech_recognition/speech_recognition.dart';

class RecordingMicrophone extends StatefulWidget {
  const RecordingMicrophone({Key? key}) : super(key: key);

  @override
  _RecordingMicrophoneState createState() => _RecordingMicrophoneState();
}

class _RecordingMicrophoneState extends State<RecordingMicrophone> {
  late SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;

  String resultText = "";

  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
  }

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();

    _speechRecognition.setAvailabilityHandler(
      (bool result) => setState(() => _isAvailable = result),
    );

    _speechRecognition.setRecognitionStartedHandler(
      () => setState(() => _isListening = true),
    );

    _speechRecognition.setRecognitionResultHandler(
      (String speech) => setState(() => resultText = speech),
    );

    _speechRecognition.setRecognitionCompleteHandler(
      () => setState(() => _isListening = false),
    );

    _speechRecognition.activate().then(
          (result) => setState(() => _isAvailable = result),
        );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onLongPress: () {
        // Long press to record
        if (_isAvailable && !_isListening) {
          // _speechRecognition.listen(locale: 'en-GB').then((result) => print(result));
        }
        // print('Should record');
      },
      onPressed: () {
        // Cancel if recording
        if (_isListening) {
          _speechRecognition
              .stop()
              .then((result) => setState(() => _isListening = result));
        }
        // print('Should stop');
      },
      child: Icon(
        Icons.mic,
        color: kMain,
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: kSecondary,
        shape: const CircleBorder(),
      ),
    );
  }
}
