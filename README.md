# Multilingual Chat

A Flutter messaging application that makes possible realtime communication between speakers of different languages.

## Visuals
<a href="#" target="_blank"><img src="" height="500"></a>

## Installation
A Flutter installation is required to run this project.
To install Flutter, visit the official installation [documentation](https://docs.flutter.dev/get-started/install).
Set up an editor of choice as specified [here](https://docs.flutter.dev/get-started/editor).

Download the project.

```bash
git clone https://github.com/root458/Multilingual-Chat.git
```

Run the below command inside the project directory to install necessary packages.
```bash
flutter pub get
```
To run the project in debug mode 
```bash
flutter run
```

To generate a release build
```bash
flutter build apk
```
Locate the `app-release.apk` file from the directory `build/app/outputs/flutter-apk/` and install in your Android smartphone or emulator to use.

## Usage

On launching the application, it will require you to sign in using your [Google](accounts.google.com). You will then be able to see the home screen. Here, tap the floating bottom at the bottom to start a chat with available users. Tap the user you wish to chat with to send them a message.

You are then free to use whichever language you feel like as they will be able to translate your messages if they don't understand your language.

You can log out by clicking the `options` button available on the app bar in the `HOME` screen. 

`Fun worth trying!` After translating a message, you can tap the message to listen to it as an audio. This is especially useful for long messages.

`Important to note!`
-Translations are available in `Swahili, English, French, Dutch, Czech, German, Italian, Japanese, Portuguese and Spanish` only. With no audio for messages translated to Swahili :(.
-The messages are synced across all the devices you sign in to. So no worries at all regarding backing up messages. 

## Contributing
Contributions towards the project are welcome.
- Specifically, improvements towards enabling persistence for the Google authentication would be highly appreciated.
- Enabling localizations for the application.
- Notifications and a mechanism to show unread messages.
- Fit different screen sizes.
- Identification of a Text-To-Speech engine with Swahili enabled would be a plus.

## License
[MIT](https://github.com/root458/Suis-Flutter-Puzzle-Hack/blob/main/LICENSE)

## Project Status
The requirements I set have been made possible. However, the application can still be improved.
Additions/improvements can be made as specified in the `Contributing` section.
