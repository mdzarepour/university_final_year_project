import 'package:get/get.dart';
import 'dart:developer' as developer;
import 'package:tech_blog/components/api_constants.dart';
import 'package:tech_blog/models/article_info_model.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/models/tags_model.dart';
import 'package:tech_blog/services/dio_services.dart';
import 'package:tech_blog/view/read_article_screen.dart';

class ReadArticleScreenController extends GetxController {
  var articleInfoModel = ArticleInfoModel().obs;
  var isFavorite = false.obs;
  var relatedArticlesList = <ArticleModel>[].obs;
  var tagsList = <TagsModel>[].obs;
  var id = (-1).obs;

  Future<void> getReadArticleScreenData() async {
    articleInfoModel.value = ArticleInfoModel();
    var userId = '';
    try {
      var response = await DioServices().getMethod(
        '${ApiConstants.baseUrl}article/get.php?command=info&id=${id.value}&user_id=$userId',
      );
      if (response.statusCode == 200) {
        articleInfoModel.value = ArticleInfoModel.fromJson(response.data["info"]);
        isFavorite.value = response.data["isFavorite"];
        relatedArticlesList.assignAll(
          (response.data["related"] as List)
              .map((element) => ArticleModel.fromJson(element))
              .toList(),
        );
        tagsList.assignAll(
          (response.data["tags"] as List)
              .map((element) => TagsModel.fromJson(element))
              .toList(),
        );
        Get.to(() => const ReadArticleScreen(), transition: Transition.cupertino);
      } else {
        developer.log('Error: ${response.statusCode}');
      }
    } catch (e) {
      developer.log("===> response has an error: $e");
    }
  }
}
