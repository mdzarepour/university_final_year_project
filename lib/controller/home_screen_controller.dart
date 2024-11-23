import 'dart:developer' as developer;
import 'package:get/get.dart';
import 'package:tech_blog/components/constants/api_constants.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/models/podcast_model.dart';
import 'package:tech_blog/models/pooster_model.dart';
import 'package:tech_blog/models/tags_model.dart';
import 'package:tech_blog/services/dio_services.dart';

class HomeScreenController extends GetxController {
  var poster = PoosterModel().obs; // Use var for type inference
  var tagList = <TagsModel>[].obs; // Specify type in the list
  var topVisitedList = <ArticleModel>[].obs;
  var topPodcastList = <PodcastModel>[].obs;
  var loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getHomeItemsData();
  }

  Future<void> getHomeItemsData() async {
    loading.value = true;
    try {
      var response = await DioServices().getMethod(ApiConstants.getHomeItems);
      if (response.statusCode == 200) {
        poster.value = PoosterModel.fromJson(response.data["poster"]);

        topVisitedList.assignAll(
          (response.data["top_visited"] as List)
              .map((element) => ArticleModel.fromJson(element))
              .toList(),
        );
        topPodcastList.assignAll(
          (response.data["top_podcasts"] as List)
              .map((element) => PodcastModel.fromJson(element))
              .toList(),
        );
        tagList.assignAll(
          (response.data["tags"] as List)
              .map((element) => TagsModel.fromJson(element))
              .toList(),
        );
      } else {
        developer.log('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      developer.log("Error while fetching data: $e");
    } finally {
      loading.value = false;
    }
  }
}
