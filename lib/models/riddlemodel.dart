class RiddleModel {
  int id;
  int id_quest;
  String title;
  int id_previous;
  int id_next;
  String content;
  String response;
  String indice;

  RiddleModel({
    required this.id,
    required this.id_quest,
    required this.title,
    required this.id_previous,
    required this.id_next,
    required this.content,
    required this.response,
    required this.indice,
  });

  factory RiddleModel.fromJson(Map<String, dynamic> json) {
    return RiddleModel(
      id: json["id"],
      id_quest: json["id_quest"],
      title: json["title"],
      id_previous: json["id_previous"],
      id_next: json["id_next"],
      content: json["content"],
      response: json["response"],
      indice: json["indice"],
    );
  }

  factory RiddleModel.fromData(
      int _id,
      int _questId,
      String _title,
      int _previousId,
      int _nextId,
      String _content,
      String _response,
      String _clue
      ) {
    return RiddleModel(
        id: _id,
        id_quest: _questId,
        title: _title,
        id_previous: _previousId,
        id_next: _nextId,
        content: _content,
        response: _response,
        indice: _clue
    );
  }
}