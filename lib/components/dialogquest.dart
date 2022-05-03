// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ydays_trackgame/models/questmodel.dart';

class DialogQuest extends StatelessWidget {
  final QuestModel data;
  DialogQuest(this.data);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        elevation: 10,
        child: Container(
            padding: const EdgeInsets.all(10),
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(data.image, width: 20),
                    const SizedBox(height: 15),
                    Text(data.title),
                    const SizedBox(height: 15),
                    Text(data.description),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              log("Redirection vers les enigmes de la quête n" +
                                  data.id.toString());
                            },
                            child: const Text("Commencer la quête")
                        )
                      ],
                    )
                  ],
                ),
              ],
            )
        )
    );
  }
}