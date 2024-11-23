import 'package:tech_blog/components/constants/api_constants.dart';

class ArticleModel {
  late String id;
  late String title;
  late String imagePath;
  late String catId;
  late String catName;
  late String author;
  late String view;
  late String status;
  late String createdAt;
  ArticleModel({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.catId,
    required this.catName,
    required this.author,
    required this.view,
    required this.status,
    required this.createdAt,
  });
  ArticleModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    imagePath = ApiConstants.hostDonwload + element["image"];
    catId = element["cat_id"];
    catName = element["cat_name"];
    author = element["author"];
    view = element["view"];
    status = element["status"];
    createdAt = element["created_at"];
  }
}
