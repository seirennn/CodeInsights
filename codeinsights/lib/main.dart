import 'package:flutter/material.dart';

import 'discussion_page.dart';
import 'firebase.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeFirebase(); // Initialize Firebase here
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Insights',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange, // Choose an appropriate color from the Gruvbox palette
        scaffoldBackgroundColor: Color(0xff282828), // Gruvbox background color
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white), // Gruvbox foreground color
        ),
      ),
      home: DiscussionPage(),
    );
  }
}
