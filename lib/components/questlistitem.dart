// ignore_for_file: file_names

import 'dart:async';
import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ydays_trackgame/models/questmodel.dart';
import 'package:ydays_trackgame/components/dialogquest.dart';
import 'package:ydays_trackgame/models/riddlemodel.dart';
import 'package:ydays_trackgame/services/httpservice.dart';

class QuestListItem extends StatelessWidget {
  final QuestModel quest;
  final int firstID;
  QuestListItem(this.quest, this.firstID, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 20, left: 20),
          height: 100,
          margin: const EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFc0dfef),
            borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            children: <Widget>[
              ListTile (
                leading: Image.asset("assets/img/logo_placeholder.png", width: 50, height: 50),
                title: Text(quest.title),
                subtitle: Row(
                  children: const [
                    SizedBox(width: 10),
                    Icon(Icons.where_to_vote_rounded, color: Colors.blueGrey, size: 22),
                    SizedBox(width: 3),
                    Text("Paris, Sacré-Cœur"),
                  ]
                ),
                onTap: () async {
                  log("Tile taped. ID :" + quest.id.toString());
                  showDialog(
                      context: context,
                      builder: (context) => DialogQuest(quest, firstID)
                  );
                },
              ),
            ],
          )
        ),
        Container(
          height: 30, width: 150,
          margin: const EdgeInsets.only(left:16),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(15)
          ),
          child: GetStatus(0))
      ],
    );
  }

  Row GetStatus(int _status) {
    Icon icon;
    Text text;
    
    switch (_status) {
      case 2:
        icon = const Icon(Icons.done);
        text = const Text("Accomplie");
        break;
      case 1:
        icon = const Icon(Icons.access_alarms_rounded);
        text = const Text("En cours");
        break;
      case 0:
        icon = const Icon(Icons.assignment_rounded);
        text = const Text("Disponible");
        break;
      default:
        icon = const Icon(Icons.alarm_off_rounded);
        text =  const Text("Indisponible");
        break;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        const SizedBox(width: 10.0),
        text
      ]
    );
  }
}