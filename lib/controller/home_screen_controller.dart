import 'package:get/get.dart';
import 'package:tech_blog/components/api_constants.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/models/podcast_model.dart';
import 'package:tech_blog/models/pooster_model.dart';
import 'package:tech_blog/models/tags_model.dart';
import 'package:tech_blog/services/dio_services.dart';

class HomeScreenController extends GetxController {
  late Rx<PoosterModel> poster = PoosterModel().obs;
  late RxList<TagsModel> tagList = RxList();
  late RxList<ArticleModel> topVisitedList = RxList();
  late RxList<PodcastModel> topPodcastList = RxList();

  @override
  onInit() {
    super.onInit();
    getHomeItemsData();
  }

  getHomeItemsData() async {
    var value = await DioServices().getMethod(ApiConstants.getHomeItems);
    if (value.statusCode == 200) {
      poster.value = PoosterModel.fromJson(value.data["poster"]);

      value.data["top_visited"].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
      });

      value.data["top_podcasts"].forEach((element) {
        topPodcastList.add(PodcastModel.fromJson(element));
      });

      value.data["tags"].forEach((element) {
        tagList.add(TagsModel.fromJson(element));
      });
    }
  }
}
