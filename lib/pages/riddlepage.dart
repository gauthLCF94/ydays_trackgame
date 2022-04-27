import 'dart:html';

import 'package:flutter/material.dart';
import 'package:ydays_trackgame/models/RiddleModel.dart';

class RiddlePage extends StatefulWidget {
  const RiddlePage({
    Key? key,
  }) : super(key:key);

  @override
  State<StatefulWidget> createState() => RiddlePageState();
}

class RiddlePageState extends State<RiddlePage> {
  final RiddleModel data = RiddleModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(data.content),
            Form(
              child: Column(
                children: const <Widget> [
                  Text("Contenu"/* data.content */),
                  Text ("Reponse"),
                ]
              ),
            )
          ]
        ),
      ),
    );
  }

}
