import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tech_blog/components/project_colors.dart';
import 'package:tech_blog/components/strings.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/components/top_visited_article_list_item.dart';
import 'package:tech_blog/components/hashtag_list_item.dart';
import 'package:tech_blog/components/top_podcasts_list_item.dart';
import 'package:tech_blog/models/project_models.dart';
import 'package:tech_blog/view/articles_list_screen.dart';

HomeScreenController homeScreenController = Get.put(HomeScreenController());

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({
    super.key,
  });

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
                      MainScreenPoster(
                        size: size,
                        theme: theme,
                        controller: HomeScreenController(),
                      ),
                      const SizedBox(
                        height: 55,
                      ),
                      TagsListView(size: size),
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
                      TopVisitedArticleList(size: size),
                      const SizedBox(
                        height: 55,
                      ),
                      const SeeMore(text: ProjectStrings.seeHotestPodcasts),
                      const SizedBox(
                        height: 40,
                      ),
                      const TopPodcastsListView(),
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
}

class TopPodcastsListView extends StatelessWidget {
  const TopPodcastsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
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
      ),
    );
  }
}

class TopVisitedArticleList extends StatelessWidget {
  const TopVisitedArticleList({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: size.height / 6,
      child: ListView.builder(
        itemCount: homeScreenController.topVisitedList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return TopVisitedArticleListItem(
            controller: homeScreenController,
            index: index,
            context: context,
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

class TagsListView extends StatelessWidget {
  const TagsListView({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 21,
      width: 500,
      child: ListView.builder(
        itemCount: homeScreenController.tagList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return HashtagListItem(
            listForDate: hastagList,
            index: index,
            context: context,
          );
        },
      ),
    );
  }
}

class MainScreenPoster extends StatelessWidget {
  final HomeScreenController controller;
  const MainScreenPoster({
    super.key,
    required this.size,
    required this.controller,
    required this.theme,
  });

  final Size size;
  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: size.height / 4,
      child: CachedNetworkImage(
        imageUrl: homeScreenController.poster.value.image!,
        imageBuilder: (context, imageProvider) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
            child: Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  decoration: const BoxDecoration(
                      gradient: GradientColors.bannerGradientColor,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                ),
                Positioned(
                    bottom: 18,
                    right: 15,
                    left: 10,
                    child: Text(
                        style: theme.bodyMedium!.copyWith(fontSize: 16),
                        homeScreenController.poster.value.title!)),
              ],
            ),
          );
        },
        placeholder: (context, url) => const SpinKitThreeBounce(
          color: SolidColors.purpleButtomColor2,
          size: 15,
        ),
        errorWidget: (context, url, error) =>
            const Icon(HugeIcons.strokeRoundedImage01),
      ),
    );
  }
}
