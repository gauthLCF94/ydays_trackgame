import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

enum QuestStatus { available, done, processing, none}

class QuestModel {
  late String id;
  late String title;
  late String image;
  late String description;
  late QuestStatus status;
/*
  QuestModel(DocumentSnapshot snapshot) {
    id = snapshot.id;
    title = snapshot.title;
    image = snapshot.image;
    status = getStatus(snapshot.status);
  }
*//*
  QuestModel.initialize() {
    id = "";
    title = "";
    image = "";
    status = QuestStatus.available;
  }
*/
  QuestModel.initialize(String _id, String _title, String _image, String _description, QuestStatus _status) {
    id = _id;
    title = _title;
    image = _image;
    description = _description;
    status = _status;
  }

  QuestStatus getStatus (int i) {
    switch (i) {
      case 0:
        return QuestStatus.available;
      case 1:
        return QuestStatus.processing;
      case 2:
        return QuestStatus.done;
      default:
        return QuestStatus.none;
    }
  }
}

