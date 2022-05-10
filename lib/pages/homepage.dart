import 'package:flutter/material.dart';
import 'package:ydays_trackgame/components/customappbar.dart';
import 'package:ydays_trackgame/components/mycustomerror.dart';
import 'package:ydays_trackgame/components/questlistitem.dart';
import 'package:ydays_trackgame/models/questmodel.dart';
import 'package:ydays_trackgame/models/riddlemodel.dart';
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
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  final HttpService httpService = HttpService();

  late Future<List<QuestModel>> quests;
  late Future<List<RiddleModel>> riddles;

  @override
  void initState() {
    super.initState();
    setState(() {
      quests = httpService.getQuests();
      riddles = httpService.getRiddles();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(title),
      body: questsBuilder(context, quests, riddles)
    );
  }

  FutureBuilder questsBuilder(BuildContext context, Future<List<QuestModel>> q, Future<List<RiddleModel>> r) {
    return FutureBuilder(
      future: Future.wait([q, r]),
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          final List<QuestModel>? _quests = snapshot.data![0];
          final List<RiddleModel>? _riddles = snapshot.data![1];
          return RefreshIndicator(
            key: _refreshIndicatorKey,
            child: ListView.separated(
              padding: const EdgeInsets.all(5),
              itemCount: _quests!.length,
              itemBuilder: (BuildContext context, int index) {
                int firstID = getIDFirstRiddle(_riddles!, _quests[index].id);
                return QuestListItem(_quests[index], firstID);
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            ),
            onRefresh: _refresh,
          );
        }
        else if (snapshot.hasError) {
          return RefreshIndicator(
            key: _refreshIndicatorKey,
            child: MyCustomError(
                errorMsg: '${snapshot.error}',
                refreshIndicatorKey: _refreshIndicatorKey
            ),
            onRefresh: _refresh,
          );
        }
        else {
          return const Center(child: CircularProgressIndicator());
        }
      }
    );
  }

  Future<void> _refresh() async {
    setState(() {
      quests = httpService.getQuests();
      riddles = httpService.getRiddles();
    });
  }

  static int getIDFirstRiddle(List<RiddleModel> _allRiddles, int _questId) {
    List<int> riddleIds = List.empty(growable: true);
    for (var element in _allRiddles) {
      if (element.id_quest == _questId) {
        riddleIds.add(element.id);
      }
    }
    riddleIds.sort();
    return riddleIds.first;
  }

}