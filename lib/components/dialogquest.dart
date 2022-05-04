// ignore_for_file: file_names

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:ydays_trackgame/models/questmodel.dart';
import 'package:ydays_trackgame/models/riddlemodel.dart';
import 'package:ydays_trackgame/pages/riddlepage.dart';
import 'package:ydays_trackgame/services/httpservice.dart';

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
                    Image.network(data.image, width: 50, height: 50),
                    const SizedBox(height: 15),
                    Text(
                      data.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.where_to_vote_rounded, color: Colors.blueGrey, size: 22),
                          const SizedBox(width: 3),
                          Text(data.location),
                        ]
                    ),
                    const SizedBox(height: 15),
                    Text(data.description),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              log("Redirection vers les enigmes de la quête n" + data.id);
                              /****************************************************************/
                              //TODO: call api pour la première enigme de la quête selectionnee
                              Future<RiddleModel> _riddle = HttpService.getRiddle(data.id, 0);
                              /*****************************************************************/
                              Navigator.pushNamed(
                                context,
                                RiddlePage.route,
                                arguments: _riddle
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