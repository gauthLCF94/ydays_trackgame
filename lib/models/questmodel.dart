class QuestModel {
  int id;
  String title;

  QuestModel({
    required this.id,
    required this.title,
  });

  factory QuestModel.fromJson(Map<String, dynamic> json) {
    return QuestModel(
      id: json["id"],
      title: json["title"],
    );
  }
}

