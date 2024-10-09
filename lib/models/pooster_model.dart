class PoosterModel {
  late String id;
  late String title;
  late String image;
  PoosterModel({
    required this.id,
    required this.image,
    required this.title,
  });
  PoosterModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = element["image"];
  }
}
