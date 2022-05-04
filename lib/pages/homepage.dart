import 'package:flutter/material.dart';
import 'package:ydays_trackgame/components/customappbar.dart';
import 'package:ydays_trackgame/components/questlistitem.dart';
import 'package:ydays_trackgame/models/questmodel.dart';
import 'package:ydays_trackgame/services/httpservice.dart';

class HomePage extends StatefulWidget {
  static const route = '/home';

  const HomePage({
    Key? key,
  }) : super(key:key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final String title = "Home";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title),
      body: questsBuilder(context)
    );
  }

  FutureBuilder<List<QuestModel>> questsBuilder(BuildContext context) {
    return FutureBuilder<List<QuestModel>>(
      future: HttpService.getQuests(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<QuestModel>? _quests = snapshot.data;
          return ListView.separated(
            padding: const EdgeInsets.all(5),
            itemCount: _quests!.length,
            itemBuilder: (BuildContext context, int index) {
              return QuestListItem(_quests[index]);
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
          );
        }
        else {
          /*late List<QuestModel> _quests = [
            QuestModel.init(),
            QuestModel.init(),
            QuestModel.init(),
          ];
          return ListView.separated(
            padding: const EdgeInsets.all(5),
            itemCount: _quests.length,
            itemBuilder: (BuildContext context, int index) {
              return QuestListItem(_quests[index]);
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
          );*/
          return const Center(child: CircularProgressIndicator());
        }
      }
    );
  }
}