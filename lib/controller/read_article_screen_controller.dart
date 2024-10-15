import 'package:get/get.dart';
import 'dart:developer' as developer;
import 'package:tech_blog/components/api_constants.dart';
import 'package:tech_blog/models/article_info_model.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/models/tags_model.dart';
import 'package:tech_blog/services/dio_services.dart';

class ReadArticleScreenController extends GetxController {
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;
  RxBool isFavorite = RxBool(false);
  RxList<ArticleModel> relatedArticlesList = RxList();
  RxList<TagsModel> tagsList = RxList();
  RxBool loading = RxBool(true);
  @override
  void onInit() {
    super.onInit();
    getReadArticleScreenData();
  }

  Future<void> getReadArticleScreenData() async {
    var response = await DioServices().getMethod(ApiConstants.getArticleInfo);
    loading.value = true;
    try {
      if (response.statusCode == 200) {
        developer.log("loading started");
        articleInfoModel.value =
            ArticleInfoModel.fromJson(response.data["info"]);

        isFavorite.value = response.data["isFavorite"];

        response.data["related"].forEach((element) {
          relatedArticlesList.add(ArticleModel.fromJson(element));
        });
        response.data["tags"].forEach((element) {
          tagsList.add(TagsModel.fromJson(element));
        });
      }
    } catch (e) {
      developer.log("===> response ha an error : $e");
    } finally {
      loading.value = false;
      developer.log(relatedArticlesList.length.toString());
    }
  }
}
