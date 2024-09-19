import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_blog/gen/assets.gen.dart';
import 'package:share_blog/hashtag_list_item.dart';
import 'package:share_blog/models/fake_data.dart';
import 'package:share_blog/models/project_models.dart';
import 'package:share_blog/project_colors.dart';
import 'package:hugeicons/hugeicons.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: SolidColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(35, 0, 35, 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(size: size.height / 40, HugeIcons.strokeRoundedMenu02),
                    Image(
                        height: size.height / 13.6,
                        image: Assets.images.a1.provider()),
                    const Icon(HugeIcons.strokeRoundedSearch01)
                  ],
                ),
                Container(
                  height: size.height / 4.20,
                  width: size.width / 1.19,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            Image(image: Assets.images.programming.provider())
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
                              style: Theme.of(context).textTheme.bodyLarge,
                              fakePosterData["articleName"],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
