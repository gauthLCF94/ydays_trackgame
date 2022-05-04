class QuestModel {
  String id;
  String title;
  String image;
  String location;
  String description;
  int status;

  QuestModel({
    required this.id,
    required this.title,
    required this.location,
    required this.description,
    this.status = 0,
    this.image = "",
  });

  factory QuestModel.fromJson(Map<String, dynamic> json) {
    return QuestModel(
      id: json["id"],
      title: json["title"],
      location: json["location"],
      description: json["description"],
      status: json["status"],
      image: json["image"]
    );
  }

  factory QuestModel.init() {
    return QuestModel(
        id: "id",
        title: "title",
        location: "location",
        description: "description"
    );
  }
}

