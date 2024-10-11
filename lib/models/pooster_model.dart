import 'package:tech_blog/components/api_constants.dart';

class PoosterModel {
  String? id;
  String? title;
  String? image;
  PoosterModel({
    this.id,
    this.image,
    this.title,
  });
  PoosterModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = ApiConstants.hostDonwload + element["image"];
  }
}
