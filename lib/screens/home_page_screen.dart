import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_blog/const_variabals.dart/project_colors.dart';
import 'package:share_blog/const_variabals.dart/strings.dart';
import 'package:share_blog/gen/assets.gen.dart';
import 'package:share_blog/list_items/blog-list-item.dart';
import 'package:share_blog/list_items/hashtag_list_item.dart';
import 'package:share_blog/list_items/podcast_list_item.dart';
import 'package:share_blog/models/project_models.dart';

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
                MainScreenPoster(size: size, theme: theme),
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
                BlogsListView(size: size),
                const SizedBox(
                  height: 55,
                ),
                const SeeMore(text: ProjectStrings.seeHotestPodcasts),
                const SizedBox(
                  height: 40,
                ),
                const PodcastsListView(),
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

class PodcastsListView extends StatelessWidget {
  const PodcastsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 215.5,
      width: double.maxFinite,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: podcastList.length,
        itemBuilder: (context, index) {
          return PodcastListItem(context: context, index: index);
        },
      ),
    );
  }
}

class BlogsListView extends StatelessWidget {
  const BlogsListView({
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
        itemCount: blogList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return BlogListItem(
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
            Assets.images.a2710222.provider()),
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
        itemCount: hastagList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return HashtagListItem(
            index: index,
            context: context,
          );
        },
      ),
    );
  }
}

class MainScreenPoster extends StatelessWidget {
  const MainScreenPoster({
    super.key,
    required this.size,
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
        children: [
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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                        style: theme.bodyMedium?.copyWith(fontSize: 18),
                        fakePosterData["writerName"] +
                            ' - ' +
                            fakePosterData["date"]),
                    Row(children: [
                      Text(
                          style: theme.bodyMedium?.copyWith(fontSize: 18),
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
                Text(
                  style: Theme.of(context).textTheme.bodyLarge,
                  fakePosterData["articleName"],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}