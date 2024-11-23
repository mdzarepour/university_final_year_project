import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/lists_appbar.dart';
import 'package:tech_blog/components/constants/project_colors.dart';
import 'package:tech_blog/components/constants/strings.dart';
import 'package:tech_blog/controller/article_model_controller.dart';
import 'package:tech_blog/controller/read_article_screen_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/view/home_page/read_article_screen.dart';

class ArticlesListScreen extends StatelessWidget {
  ArticlesListScreen({super.key});
  final ArticleModelController articleModelController =
      Get.put(ArticleModelController());
  final ReadArticleScreenController readArticleScreenController =
      Get.put(ReadArticleScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SolidColors.scaffoldBackgroundColor,
      appBar: listsAppbar(context, ProjectStrings.blogsList),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: SizedBox(
              child: Obx(() => articleModelController.loading.value == false
                  ? ListView.builder(
                      itemCount: articleModelController.articleList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 7.5,
                            child: InkWell(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25)),
                              onTap: () async {
                                readArticleScreenController.id.value =
                                    int.parse(articleModelController
                                        .articleList[index].id);
                                Get.to(() => const ReadArticleScreen());
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 135,
                                    child: CachedNetworkImage(
                                      imageUrl: articleModelController
                                          .articleList[index].imagePath,
                                      imageBuilder: (context, imageProvider) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(27),
                                            ),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: imageProvider),
                                          ),
                                        );
                                      },
                                      placeholder: (context, url) =>
                                          const SpinKitThreeBounce(
                                        color: SolidColors.purpleButtomColor2,
                                        size: 15,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(Assets.images.a1.path),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                            maxLines: 2,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                            articleModelController
                                                .articleList[index].title),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall,
                                                    articleModelController
                                                        .articleList[index]
                                                        .author),
                                                const SizedBox(
                                                  width: 7,
                                                ),
                                                Text(
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                  articleModelController
                                                      .articleList[index].view,
                                                ),
                                              ],
                                            ),
                                            Text(
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      color: SolidColors
                                                          .blueLinkTitles),
                                              articleModelController
                                                  .articleList[index].catName,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : const SpinKitThreeBounce(
                      color: SolidColors.purpleButtomColor2,
                      size: 15,
                    )),
            ),
          ),
        ),
      ),
    );
  }
}
