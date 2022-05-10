import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:ydays_trackgame/models/imagemodel.dart';
import 'package:ydays_trackgame/models/questmodel.dart';
import 'package:http/http.dart' as http;
import 'package:ydays_trackgame/models/riddlemodel.dart';


class HttpService {
  static const String apiUrl = "https://mimapi.herokuapp.com";
  static const String apiKeyUrl = "https://monapikey.com";

  //TODO: get API key
  late String apiKey;

  HttpService() {
    getApiKey();
  }

  Future<void> getApiKey() async {
    String keyValue = "";
    await http.get(Uri.parse(apiKeyUrl)).then((res) => {
      if (res.statusCode == 200) {
        // TODO: get request body
        // keyValue = ... ;
      }
    });

    apiKey = keyValue;
  }

  Future<List<QuestModel>> getQuests() async {
    String uri = apiUrl + "/quests";
    final res = await http.get(
        Uri.parse(uri),
        headers: { "api-key": apiKey }
    );

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<QuestModel> quests = body.map(
              (dynamic item) => QuestModel.fromJson(item)
      ).toList();
      log("Quests loaded !");
      return quests;
    }
    else {
      log("Failed to load quest ...");
      throw Exception("Failed to load quest ...");
    }
  }

  Future<QuestModel> getQuestById(int questId) async {
    String uri = apiUrl + "/quests/" + questId.toString();
    final res = await http.get(
        Uri.parse(uri),
        headers: { "api-key": apiKey }
    );

    if (res.statusCode == 200) {
      QuestModel quest = jsonDecode(res.body).map(
          (dynamic item) => QuestModel.fromJson(item)
      );
      log("Quest " + questId.toString() + " loaded !");
      return quest;
    }
    else {
      log("Failed to load quest ...");
      throw Exception("Failed to load quest ...");
    }
  }

  Future<List<RiddleModel>> getRiddles() async {
    String uri = apiUrl + "/enigmas";
    final res = await http.get(
        Uri.parse(uri),
        headers: { "api-key": apiKey }
    );

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<RiddleModel> riddles = body.map(
          (dynamic item) => RiddleModel.fromJson(item)
      ).toList();
      log("Riddles loaded !");
      return riddles;
    }
    else {
      log("Failed to load riddles ...");
      throw Exception("Failed to load riddles ...");
    }
  }

  Future<RiddleModel> getRiddleById(int _riddleId) async {
    String uri = apiUrl + "/enigmas/" + _riddleId.toString();
    final res = await http.get(
        Uri.parse(uri),
        headers: { "api-key": apiKey }
    );

    if (res.statusCode == 200) {
      log("Riddle " + _riddleId.toString() + " loaded !");
      return RiddleModel.fromJson(jsonDecode(res.body));
    }
    else {
      log("Failed to load riddle with id: " + _riddleId.toString());
      throw Exception("Failed to load riddle with id: " + _riddleId.toString());
    }
  }

  Future<ImageModel> getImageByRiddleID(int _riddleId) async {
    String uri = apiUrl + "/pictures/enigma/" + _riddleId.toString();
    final res = await http.get(
        Uri.parse(uri),
        headers: { "api-key": apiKey }
    );

    if (res.statusCode == 200) {
      log("Image loaded for riddle " + _riddleId.toString());
      return ImageModel.fromJson(jsonDecode(res.body));
    }
    else {
      log("Failed to load image ...");
      throw Exception("Failed to load image ...");
    }
  }
}