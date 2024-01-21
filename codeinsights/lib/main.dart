// /lib/main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'discussion_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBNNhBzISxqg452EzXHAejKNhZGTKr4wC8",
      authDomain: "codeinsights-792b1.firebaseapp.com",
      databaseURL: "https://codeinsights-792b1-default-rtdb.asia-southeast1.firebasedatabase.app",
      projectId: "codeinsights-792b1",
      storageBucket: "codeinsights-792b1.appspot.com",
      messagingSenderId: "358578040162",
      appId: "1:358578040162:web:86afd7f66fb5a71e36903b",
      measurementId: "G-76CCB3YP27",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Insights',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Color.fromARGB(255, 23, 23, 23),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: DiscussionPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}