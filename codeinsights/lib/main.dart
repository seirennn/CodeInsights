import 'package:flutter/material.dart';

import 'discussion_page.dart'; // Import the discussion page file
import 'firebase.dart'; // Import your firebase.dart file

void main() {
  initializeFirebase(); // Initialize Firebase here
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Insights',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DiscussionPage(), // Set the DiscussionPage as the home screen
    );
  }
}
