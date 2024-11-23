import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/constants/project_colors.dart';
import 'package:tech_blog/components/constants/strings.dart';
import 'package:tech_blog/controller/article_model_controller.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/controller/read_article_screen_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/components/hashtag_list_item.dart';
import 'package:tech_blog/components/top_podcasts_list_item.dart';
import 'package:tech_blog/models/project_models.dart';
import 'package:tech_blog/view/home_page/articles_list_screen.dart';
import 'package:tech_blog/view/home_page/read_article_screen.dart';
import 'package:tech_blog/view/home_page/show_article_list_from_tag_id.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({
    super.key,
  });
  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());
  final ReadArticleScreenController readArticleScreenController =
      Get.put(ReadArticleScreenController());
  final ArticleModelController articleModelController =
      Get.put(ArticleModelController());

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return Obx(() => homeScreenController.loading.value == false
        ? SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        height: size.height / 4,
                        child: CachedNetworkImage(
                          imageUrl: homeScreenController.poster.value.image!,
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(25)),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.maxFinite,
                                    height: double.maxFinite,
                                    decoration: const BoxDecoration(
                                        gradient:
                                            GradientColors.bannerGradientColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25))),
                                  ),
                                  Positioned(
                                      bottom: 18,
                                      right: 15,
                                      left: 10,
                                      child: Text(
                                          style: theme.bodyMedium!
                                              .copyWith(fontSize: 16),
                                          homeScreenController
                                              .poster.value.title!)),
                                ],
                              ),
                            );
                          },
                          placeholder: (context, url) =>
                              const SpinKitThreeBounce(
                            color: SolidColors.purpleButtomColor2,
                            size: 15,
                          ),
                          errorWidget: (context, url, error) => Center(
                            child: Image.asset(Assets.images.a1.path),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 55,
                      ),
                      tagsListView(size),
                      const SizedBox(
                        height: 55,
                      ),
                      InkWell(
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          Get.to(() => ArticlesListScreen());
                        },
                        child: const SeeMore(
                          text: ProjectStrings.seeHotestBlogs,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      topVisitedArticles(size),
                      const SizedBox(
                        height: 55,
                      ),
                      const SeeMore(text: ProjectStrings.seeHotestPodcasts),
                      const SizedBox(
                        height: 40,
                      ),
                      topPodcastsList(),
                      const SizedBox(
                        height: 90,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : const SpinKitThreeBounce(
            color: SolidColors.purpleButtomColor2,
            size: 15,
          ));
  }

  SizedBox topPodcastsList() {
    return SizedBox(
      height: 215.5,
      width: double.maxFinite,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homeScreenController.topPodcastList.length,
        itemBuilder: (context, index) {
          return TopPodcastsListItem(
            controller: homeScreenController,
            context: context,
            index: index,
          );
        },
      ),
    );
  }

  SizedBox topVisitedArticles(Size size) {
    return SizedBox(
      width: double.maxFinite,
      height: size.height / 6,
      child: ListView.builder(
        itemCount: homeScreenController.topVisitedList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () async {
                readArticleScreenController.id.value =
                    int.parse(homeScreenController.topVisitedList[index].id);
                Get.to(() => const ReadArticleScreen(),
                    transition: Transition.cupertino);
              },
              child: SizedBox(
                height: double.maxFinite,
                width: 193,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height / 6.08,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: homeScreenController
                                .topVisitedList[index].imagePath,
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25)),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              );
                            },
                            placeholder: (context, url) =>
                                const SpinKitThreeBounce(
                              size: 15,
                              color: SolidColors.purpleButtomColor2,
                            ),
                            errorWidget: (context, url, error) => Center(
                              child: Image.asset(Assets.images.a1.path),
                            ),
                          ),
                          Container(
                            height: double.maxFinite,
                            width: 193,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(homeScreenController
                                    .topVisitedList[index].imagePath),
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(22),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(22),
                                    ),
                                    gradient: GradientColors
                                        .blogsListviewGradientColor,
                                  ),
                                ),
                                Positioned(
                                  bottom: 7,
                                  right: 0,
                                  left: 0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                color: SolidColors.whiteColor),
                                        homeScreenController
                                            .topVisitedList[index].author,
                                      ),
                                      Text(
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  color:
                                                      SolidColors.whiteColor),
                                          homeScreenController
                                              .topVisitedList[index].view),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox tagsListView(Size size) {
    return SizedBox(
      height: size.height / 21,
      width: 500,
      child: ListView.builder(
        itemCount: homeScreenController.tagList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              articleModelController.selectedTagName.value =
                  homeScreenController.tagList[index].title;
              articleModelController.tagId.value =
                  int.parse(homeScreenController.tagList[index].id);
              articleModelController.getArticlesListFromTagId();
              Get.to(() => ShowArticleListFromTagId());
            },
            child: HashtagListItem(
              listForDate: hastagList,
              index: index,
              context: context,
            ),
          );
        },
      ),
    );
  }
}

class SeeMore extends StatelessWidget {
  final String text;
  const SeeMore({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageIcon(
            color: SolidColors.blueLinkTitles,
            Assets.icons.a2710222.provider()),
        const SizedBox(
          width: 12,
        ),
        Text(style: Theme.of(context).textTheme.headlineMedium, text),
      ],
    );
  }
}
