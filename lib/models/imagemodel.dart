class ImageModel {
  int id;
  int riddleId;
  String url;
  int order;

  ImageModel({
    required this.id,
    required this.riddleId,
    required this.url,
    required this.order,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
        id: json["id"],
        riddleId: json["id_enigma"],
        url: json["url"],
        order: json["order"],
    );
  }
}