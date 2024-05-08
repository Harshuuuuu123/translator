import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TranslationWidget extends StatelessWidget {
  final String message;
  final String fromLanguage;
  final String toLanguage;
  final Widget Function(String) builder;

  TranslationWidget({
    required this.message,
    required this.fromLanguage,
    required this.toLanguage,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    // Initialize translation here
    String translation = ''; // Initialize with an empty string or appropriate default value

    // Perform translation logic here and assign the result to the translation variable

    return FutureBuilder<String>(
      future: Future.delayed(Duration(seconds: 1), () => translation), // Example future, replace with actual translation logic
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return buildWaiting(); // You need to implement buildWaiting() method
        } else {
          return builder(snapshot.data ?? ''); // Pass the translated message to the builder
        }
      },
    );
  }

  Widget buildWaiting() {
    return CircularProgressIndicator(); // Example waiting widget, replace with your own implementation
  }
}
