import 'package:flutter/material.dart';
import 'package:youtube_clone/api.dart';
import 'package:youtube_clone/pages/home.dart';

void main() {
  Api api = Api();
  api.search("ladygaga");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
