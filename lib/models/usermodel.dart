import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel {
  late String id;
  late String pseudo;
  late String email;
  late String password;
  late Map<String,int> completed_quest;

  UserModel(DocumentSnapshot snapshot) {
    id = snapshot.id;
    Map<String,dynamic> map = snapshot.data() as Map<String, dynamic>;
    pseudo = map['pseudo'];
    email = map['email'];
    password = map['password'];
    completed_quest = map['completed_quest'];
  }

  UserModel.initialize() {
    id = "";
    pseudo = "";
    email = "";
    password = "";
    completed_quest = {};
  }
}