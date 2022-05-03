import 'package:flutter/material.dart';
import 'package:ydays_trackgame/components/customappbar.dart';
import 'package:ydays_trackgame/components/questlistitem.dart';
import 'package:ydays_trackgame/models/questmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key:key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // TODO: List<Quest> = appel BDD
  final List<QuestModel> entries = <QuestModel>[
    QuestModel.initialize("0", "La chasse sauvage", "A", "Ceci est une description. Lorem Ipsum tu connais", QuestStatus.done),
    QuestModel.initialize("1", "Le retour du roi", "B", "Ceci est une description. Lorem Ipsum tu connais", QuestStatus.processing),
    QuestModel.initialize("2", "Un voyage inattendu", "C", "Ceci est une description. Lorem Ipsum tu connais", QuestStatus.available),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: custom AppBar
      appBar: CustomAppBar('Jeu de piste à Paris'),
      // TODO: adapter au model Quest
      body: ListView.separated(
              padding: const EdgeInsets.all(5),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return QuestListItem(entries[index]);
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
      )
    );
  }
}