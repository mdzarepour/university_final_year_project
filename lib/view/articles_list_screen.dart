import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/article_list_screen_list_item.dart';
import 'package:tech_blog/components/lists_appbar.dart';
import 'package:tech_blog/components/project_colors.dart';
import 'package:tech_blog/components/strings.dart';
import 'package:tech_blog/controller/article_model_controller.dart';

class ArticlesListScreen extends StatelessWidget {
  ArticlesListScreen({super.key});
  final ArticleModelController articleModelController =
      Get.put(ArticleModelController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SolidColors.scaffoldBackgroundColor,
      appBar: listsAppbar(context, ProjectStrings.blogsList),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: SizedBox(child: Obx(
              () {
                if (articleModelController.loading.value) {
                  return const SpinKitThreeBounce(
                    color: SolidColors.purpleButtomColor2,
                    size: 15,
                  );
                } else if (articleModelController.articleList.isEmpty) {
                  return Text(
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.black),
                      "no article avaible");
                } else {
                  return ListView.builder(
                    itemCount: articleModelController.articleList.length,
                    itemBuilder: (context, index) {
                      return articleListScreenListItem(context, index);
                    },
                  );
                }
              },
            )),
          ),
        ),
      ),
    );
  }
}
