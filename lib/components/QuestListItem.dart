// ignore_for_file: file_names

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:ydays_trackgame/models/QuestModel.dart';

class QuestListItem extends StatelessWidget {
  final QuestModel data;
  QuestListItem(this.data);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: 100,
          margin: const EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            children: <Widget>[
              ListTile (
                leading: Image.asset(data.image, width: 10),
                title: Text(data.title),
                onTap: () {
                  log("Tile taped. ID :" + data.id);
                  showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        elevation: 10,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Stack(
                            children: <Widget> [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(data.image, width: 20),
                                    const SizedBox(height:15),
                                    Text(data.title),
                                    const SizedBox(height:15),
                                    Text(data.description),
                                    const SizedBox(height:15),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () { log("Redirection vers les enigmes de la quête n" + data.id.toString()); },
                                          child: const Text("Commencer la quête")
                                        )
                                      ],
                                    )
                                  ],
                                ),
                            ],
                          )
                        )
                      )
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
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(15)
        ),
        child: Text("Processing" /* data.status.toString() */),
      ),
    ],
    );
  }
}