import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/project_colors.dart';
import 'package:tech_blog/components/strings.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/components/top_visited_article_list_item.dart';
import 'package:tech_blog/components/hashtag_list_item.dart';
import 'package:tech_blog/components/top_podcasts_list_item.dart';
import 'package:tech_blog/models/project_models.dart';

HomeScreenController homeScreenController = Get.put(HomeScreenController());

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({
    super.key,
    required this.size,
    required this.theme,
  });

  final Size size;
  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                const SeeMore(
                  text: ProjectStrings.seeHotestBlogs,
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
    );
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
        child: Obx(
          () {
            return ListView.builder(
              itemCount: homeScreenController.topVisitedList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return TopVisitedArticleListItem(
                  controller: homeScreenController,
                  index: index,
                  context: context,
                );
              },
            );
          },
        ));
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
        child: Obx(
          () {
            return ListView.builder(
              itemCount: homeScreenController.tagList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return HashtagListItem(
                  controller: homeScreenController,
                  listForDate: hastagList,
                  index: index,
                  context: context,
                );
              },
            );
          },
        ));
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
    return Container(
      height: size.height / 4.20,
      width: size.width / 1.19,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: Image(image: Assets.images.programming.provider()).image),
        color: Colors.amber,
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height / 4.20,
            width: size.width / 1.19,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
                gradient: GradientColors.bannerGradientColor),
          ),
          Positioned(
            bottom: 15,
            right: 0,
            left: 0,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                        style: theme.bodyMedium?.copyWith(fontSize: 16),
                        fakePosterData["writerName"] +
                            ' - ' +
                            fakePosterData["date"]),
                    Row(children: <Widget>[
                      Text(
                          style: theme.bodyMedium?.copyWith(
                              fontSize: MediaQuery.of(context).size.width / 30),
                          fakePosterData["totalViews"]),
                      const SizedBox(
                        width: 7,
                      ),
                      const Icon(
                          size: 15,
                          color: SolidColors.whiteColor,
                          CupertinoIcons.eye),
                    ]),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 26),
                  child: Text(
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: MediaQuery.of(context).size.width / 26),
                    homeScreenController.poster.value.title!,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
