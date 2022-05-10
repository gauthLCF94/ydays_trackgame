class RiddleModel {
  int id;
  int questId;
  String title;
  int previousId;
  int nextId;
  String textContent;
  String response;
  String clue;

  RiddleModel({
    required this.id,
    required this.questId,
    required this.title,
    required this.previousId,
    required this.nextId,
    required this.textContent,
    required this.response,
    required this.clue,
  });

  factory RiddleModel.fromJson(Map<String, dynamic> json) {
    return RiddleModel(
      id: json['id'],
      questId: json['id_quest'],
      title: json['title'],
      previousId: json['id_previous'],
      nextId: json['id_next'],
      textContent: json['content'],
      response: json['response'],
      clue: json['indice'],
    );
  }
}