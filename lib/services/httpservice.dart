import 'dart:convert';
import 'package:ydays_trackgame/models/questmodel.dart';
import 'package:http/http.dart' as http;
import 'package:ydays_trackgame/models/riddlemodel.dart';


class HttpService {
  static const String apiUrl = "http://monapi.com/"; //TODO: get API url

  static Future<List<QuestModel>> getQuests() async {
    String uri = apiUrl + "/bella";
    final res = await http.get(Uri.parse(uri));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<QuestModel> quests = body.map(
              (dynamic item) => QuestModel.fromJson(item)
      ).toList();
      return quests;
    }
    else {
      throw Exception("Failed to load quest");
    }
  }

  static Future<RiddleModel> getRiddle(String _questId, int _riddleId) async {
    String uri = apiUrl + "/riddle";
    final res = await http.get(Uri.parse(uri));

    if (res.statusCode == 200) {
      RiddleModel riddle = jsonDecode(res.body).map(
          (dynamic item) => RiddleModel.fromJson(item)
      );
      return riddle;
    }
    else {
      throw Exception("Failed to load riddle");
    }
  }
}