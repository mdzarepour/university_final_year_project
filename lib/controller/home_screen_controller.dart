import 'package:get/get.dart';
import 'package:tech_blog/components/api_constants.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/models/podcast_model.dart';
import 'package:tech_blog/models/pooster_model.dart';
import 'package:tech_blog/models/tags_model.dart';
import 'package:tech_blog/services/dio_services.dart';

class HomeScreenController extends GetxController {
  late Rx<PoosterModel> poster;
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
      value.data["top_visited"].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
      });
    }
    if (value.statusCode == 200) {
      value.data["top_podcasts"].forEach((element) {
        topPodcastList.add(PodcastModel.fromJson(element));
      });
    }
    if (value.statusCode == 200) {
      value.data["tags"].forEach((element) {
        tagList.add(TagsModel.fromJson(element));
      });
    }
    if (value.statusCode == 200) {
      value.data["poster"].forEach((element) {
        poster = PoosterModel(
          id: element["id"],
          image: element["title"],
          title: element["image"],
        ).obs;
      });
    }
  }
}
