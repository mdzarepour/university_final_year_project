import 'package:tech_blog/components/constants/api_constants.dart';

class ArticleInfoModel {
  String? id;
  String? title;
  String? content;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;
  ArticleInfoModel({
    this.id,
    this.title,
    this.content,
    this.image,
    this.catId,
    this.catName,
    this.author,
    this.view,
    this.status,
    this.createdAt,
  });
  ArticleInfoModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    content = element["content"];
    image = ApiConstants.hostDonwload + element["image"];
    catId = element["cat_id"];
    catName = element["cat_name"];
    author = element["author"];
    view = element["view"];
    status = element["status"];
    createdAt = element["created_at"];
  }
}
