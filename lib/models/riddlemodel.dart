class RiddleModel {
  int id;
  String questId;
  String textContent;
  String imgContent;
  String response;

  RiddleModel({
    required this.id,
    required this.questId,
    required this.textContent,
    this.response = "",
    this.imgContent = ""
  });

  factory RiddleModel.fromJson(Map<String, dynamic> json) {
    return RiddleModel(
      id: json["id"],
      questId: json["questId"],
      textContent: json["textContent"],
      response: json["response"],
      imgContent: json["imgContent"]
    );
  }
}