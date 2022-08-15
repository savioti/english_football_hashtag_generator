import 'package:english_football_hashtag_generator/modules/generate_hashtags/presentation/generate_hashtags.screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: GenerateHashtagsScreen(),
    );
  }
}
