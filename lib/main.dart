import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worder/Application%20Layer/word_provider.dart';
import 'package:worder/Presentation%20Layer/word_list_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WordsProvider(),
      child: SightWordsCoach(),
    ),
  );
}

class SightWordsCoach extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sight Words Coach',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WordListScreen(),
    );
  }
}
