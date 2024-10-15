import 'dart:developer';
import 'package:get/get.dart';
import 'package:tech_blog/components/api_constants.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/services/dio_services.dart';

class ArticleModelController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getArticlesDataMethod();
  }

  Future<void> getArticlesDataMethod() async {
    loading.value = true;
    log('Loading started');
    try {
      var value = await DioServices().getMethod(ApiConstants.newArticle);
      if (value.statusCode == 200) {
        articleList.value = List<ArticleModel>.from(
            value.data.map((element) => ArticleModel.fromJson(element)));
      }
    } catch (e) {
      log('Error fetching articles: $e');
    } finally {
      loading.value = false;
      log('Loading finished');
    }
  }
}
