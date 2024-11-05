import 'dart:developer' as developer;
import 'package:get/get.dart';
import 'package:tech_blog/components/api_constants.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/services/dio_services.dart';

class ArticleModelController extends GetxController {
  var articleList = <ArticleModel>[].obs;
  var loading = true.obs;
  var listFromTagId = <ArticleModel>[].obs;
  var tagId = 0.obs;
  var selectedTagName = ''.obs;
  var loading2 = true.obs;

  @override
  void onInit() {
    super.onInit();
    getArticlesDataMethod();
  }

  Future<void> getArticlesDataMethod() async {
    loading.value = true;
    try {
      var response = await DioServices().getMethod(ApiConstants.newArticle);
      if (response.statusCode == 200) {
        articleList.assignAll(
          (response.data as List)
              .map((element) => ArticleModel.fromJson(element))
              .toList(),
        );
      } else {
        developer.log('Failed to load articles: ${response.statusCode}');
      }
    } catch (e) {
      developer.log('Error while fetching articles: $e');
    } finally {
      loading.value = false;
    }
  }

  Future<void> getArticlesListFromTagId() async {
    loading2.value = true;
    listFromTagId.clear();
    try {
      var response = await DioServices().getMethod(
        'https://techblog.sasansafari.com/Techblog/api/article/get.php?command=get_articles_with_tag_id&tag_id=$tagId&user_id=1',
      );
      if (response.statusCode == 200) {
        listFromTagId.assignAll(
          (response.data as List)
              .map((element) => ArticleModel.fromJson(element))
              .toList(),
        );
      } else {
        developer
            .log('Failed to load articles by tag ID: ${response.statusCode}');
      }
    } catch (e) {
      developer.log("Error while fetching articles from tag ID: $e");
    }
    loading2.value = false;
  }
}
