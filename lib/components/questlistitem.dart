// ignore_for_file: file_names

import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ydays_trackgame/models/questmodel.dart';
import 'package:ydays_trackgame/components/dialogquest.dart';

class QuestListItem extends StatelessWidget {
  final QuestModel data;
  QuestListItem(this.data);

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
                //TODO: Lier les données reçues
                leading: Image.asset("assets/img/logo_placeholder.png", width: 50, height: 50),
                title: Text(data.title),
                onTap: () {
                  log("Tile taped. ID :" + data.id);
                  showDialog(
                      context: context,
                      builder: (context) => DialogQuest(data)
                  );
                },
              ),
            ],
          )
        ),
        Container(
          height: 20, width: 100,
          margin: const EdgeInsets.only(left:16),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(15)
          ),
          child: GetStatus(data.status),
        ),
      ],
    );
  }

  Widget GetStatus(QuestStatus _status) {
    switch (_status) {
      case QuestStatus.done:
        return const Text("Accomplie");
      case QuestStatus.processing:
        return const Text("En cours");
      case QuestStatus.available:
        return const Text("Disponible");
      default:
        return const Text("Indisponible");
    }
  }
}