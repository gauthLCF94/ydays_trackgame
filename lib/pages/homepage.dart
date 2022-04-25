import 'package:flutter/material.dart';
import 'package:ydays_trackgame/components/QuestListItem.dart';
import 'package:ydays_trackgame/models/SketchyQuestModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key:key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // TODO: List<SketchyQuest> = appel BDD
  final List<SketchyQuestModel> entries = <SketchyQuestModel>[
    SketchyQuestModel.initialize("0", "La chasse sauvage", "A", "Ceci est une description. Lorem Ipsum tu connais", QuestStatus.done),
    SketchyQuestModel.initialize("1", "Le retour du roi", "B", "Ceci est une description. Lorem Ipsum tu connais", QuestStatus.processing),
    SketchyQuestModel.initialize("2", "Un voyage inattendu", "C", "Ceci est une description. Lorem Ipsum tu connais", QuestStatus.available),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jeu de piste à Paris'),
      ),
      // TODO: adapter au model SketchyQuest
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