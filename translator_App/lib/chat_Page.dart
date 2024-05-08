import 'package:flutter/material.dart';
import 'package:trans_app/translation.dart';
import 'package:trans_app/transltion.dart';

import 'data.dart';
import 'message.dart';
import 'package:trans_app/title.dart';


class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String language1 = Translations.languages.first ?? "";
  String  language2 = Translations.languages.first ?? "";

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.blue[50],
    appBar: AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: buildTitle(),
    ),
    body: ListView.builder(
      itemCount: Data.chat.length,
      itemBuilder: (BuildContext context, int index) {
        final chat = Data.chat[index];
        final fromLanguage = chat.isMe ? language1 : language2;
        final toLanguage = chat.isMe ? language2 : language1;

        return TranslationWidget(
          message: chat.message,
          fromLanguage: fromLanguage,
          toLanguage: toLanguage,
          builder: (translatedMessage) => MessageWidget(
            isMe: chat.isMe,
            message: chat.message,
            translatedMessage: translatedMessage,
          ),
        );
      },
    ),
  );

  Widget buildTitle() => TitleWidget(
    language1: language1 ?? "",
    language2: language2 ?? "" ,
    onChangedLanguage1: (newLanguage) => setState(() {
      language1 = newLanguage ?? "";
    }),
    onChangedLanguage2: (newLanguage) => setState(() {
      language2 = newLanguage ?? "";
    }),
  );
}