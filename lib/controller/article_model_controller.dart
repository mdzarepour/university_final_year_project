import 'package:get/get.dart';
import 'package:tech_blog/components/api_constants.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/services/dio_services.dart';
import 'dart:developer' as developer;

class ArticleModelController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = true.obs;
  RxList<ArticleModel> listFromTagId = RxList();
  RxString selectedTagName = RxString('');
  RxBool loading2 = true.obs;

  @override
  void onInit() {
    super.onInit();
    getArticlesDataMethod();
  }

  Future<void> getArticlesDataMethod() async {
    loading.value = true;
    try {
      var value = await DioServices().getMethod(ApiConstants.newArticle);
      if (value.statusCode == 200) {
        articleList.clear();
        articleList.value = List<ArticleModel>.from(
            value.data.map((element) => ArticleModel.fromJson(element)));
      }
    } catch (e) {
      developer.log('Error while fetching articles: $e');
    } finally {
      loading.value = false;
    }
  }

  getArticlesListFromTagId(String tagIg) async {
    loading.value = true;

    var response = await DioServices().getMethod(
        'https://techblog.sasansafari.com/Techblog/api/article/get.php?command=get_articles_with_tag_id&tag_id=$tagIg&user_id=1');
    try {
      if (response.statusCode == 200) {
        listFromTagId.clear();
        listFromTagId.value = List<ArticleModel>.from(
            response.data.map((element) => ArticleModel.fromJson(element)));
      }
    } catch (e) {
      developer.log("error while fetching articles from tag id => $e");
    } finally {
      loading.value = false;
    }
  }
}
