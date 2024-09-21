import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_blog/const_variabals.dart/strings.dart';
import 'package:share_blog/gen/assets.gen.dart';
import 'package:share_blog/list_items/blog-list-item.dart';
import 'package:share_blog/list_items/hashtag_list_item.dart';
import 'package:share_blog/list_items/podcast_list_item.dart';
import 'package:share_blog/models/project_models.dart';
import 'package:share_blog/const_variabals.dart/project_colors.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:share_blog/const_variabals.dart/strings.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(size: size.height / 40, HugeIcons.strokeRoundedMenu02),
            Image(
                height: size.height / 13.6, image: Assets.images.a1.provider()),
            const Icon(HugeIcons.strokeRoundedSearch01)
          ],
        ),
      ),
      backgroundColor: SolidColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
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
                        Container(
                          height: size.height / 4.20,
                          width: size.width / 1.19,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image(
                                        image: Assets.images.programming
                                            .provider())
                                    .image),
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
                                    gradient:
                                        GradientColors.bannerGradientColor),
                              ),
                              Positioned(
                                bottom: 15,
                                right: 0,
                                left: 0,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                            style: theme.bodyMedium
                                                ?.copyWith(fontSize: 18),
                                            fakePosterData["writerName"] +
                                                ' - ' +
                                                fakePosterData["date"]),
                                        Row(children: [
                                          Text(
                                              style: theme.bodyMedium
                                                  ?.copyWith(fontSize: 18),
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
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                      fakePosterData["articleName"],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 55,
                        ),
                        SizedBox(
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
                        ),
                        const SizedBox(
                          height: 55,
                        ),
                        Row(
                          children: [
                            ImageIcon(
                                color: SolidColors.blueLinkTitles,
                                Assets.images.a2710222.provider()),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                                ProjectStrings.seeHotestBlogs),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
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
                        ),
                        const SizedBox(
                          height: 55,
                        ),
                        Row(
                          children: [
                            ImageIcon(
                                color: SolidColors.blueLinkTitles,
                                Assets.images.a2710222.provider()),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                                ProjectStrings.seeHotestBlogs),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          height: 215.5,
                          width: double.maxFinite,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: podcastList.length,
                            itemBuilder: (context, index) {
                              return PodcastListItem(
                                  context: context, index: index);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const BottumNavigationBar(),
          ],
        ),
      ),
    );
  }
}

class BottumNavigationBar extends StatelessWidget {
  const BottumNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).size.height / 9,
        decoration: const BoxDecoration(
          gradient: GradientColors.bottumNavigationBackgroundGradientColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: MediaQuery.of(context).size.height / 13.4,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                gradient: GradientColors.bottumNavigasionGradient,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: ImageIcon(
                      color: SolidColors.whiteColor,
                      Assets.images.icon.provider(),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: ImageIcon(
                      color: SolidColors.whiteColor,
                      Assets.images.w.provider(),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: ImageIcon(
                      color: SolidColors.whiteColor,
                      Assets.images.user.provider(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
