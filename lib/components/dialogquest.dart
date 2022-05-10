// ignore_for_file: file_names

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:ydays_trackgame/models/questmodel.dart';
import 'package:ydays_trackgame/pages/riddlepage.dart';

class DialogQuest extends StatelessWidget {
  final QuestModel quest;
  final int firstID;
  const DialogQuest(this.quest, this.firstID, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("questID: " + quest.id.toString() + " / firstID: " + firstID.toString());
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
                Image.asset("assets/img/logo_placeholder.png", width: 75, height: 75),
                const SizedBox(height: 15),
                Text(
                  quest.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.where_to_vote_rounded, color: Colors.blueGrey, size: 22),
                      SizedBox(width: 3),
                      Text("Paris, Sacré-Cœur"),
                    ]
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          log("Redirection vers les enigmes de la quête n" + firstID.toString());
                          Navigator.pushNamed(
                            context,
                            RiddlePage.route,
                            arguments: firstID
                          );
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