class ImageModel {
  int id;
  int id_enigma;
  String url;
  int order;

  ImageModel({
    required this.id,
    required this.id_enigma,
    required this.url,
    required this.order,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
        id: json["id"],
        id_enigma: json["id_enigma"],
        url: json["url"],
        order: json["order"],
    );
  }
}