import 'package:flutter/material.dart';
import 'package:ydays_trackgame/pages/homepage.dart';
//import 'package:ydays_trackgame/pages/loginpage.dart';
//import 'package:ydays_trackgame/pages/registerpage.dart';
//import 'package:ydays_trackgame/pages/riddlepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final String appName = "Jeu de piste à Paris";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
