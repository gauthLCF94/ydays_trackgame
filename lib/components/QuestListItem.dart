// ignore_for_file: file_names

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:ydays_trackgame/models/SketchyQuestModel.dart';

class QuestListItem extends StatelessWidget {
  final SketchyQuestModel data;
  QuestListItem(this.data);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          margin: const EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            children: <Widget>[
              ListTile (
                leading: Image.asset(data.image, width: 10),
                title: Text(data.title),
                onTap: () {
                  log("Tile taped. ID :" + data.id);
                  //TODO: afficher une carte avec plus d'infos sur la quête et un bouton pour commencer/reprendre la quête
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        content: Builder(
                          builder: (context) {
                            return Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(data.image, width: 20),
                                  Text(data.title),
                                  Text(data.description),
                                  Row(
                                    //TODO: bouton vers les enigmes
                                  )
                                ],
                              ),
                            );
                          },
                        )
                      )
                  );
                },
              ),
          ])
        ),
      Container(
        height: 20, width: 100,
        margin: const EdgeInsets.only(left:16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(15)
        ),
        child: Text("Processing" /* data.status.toString() */),
      ),
    ],
    );
  }
}