import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tech_blog/components/project_colors.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';

class TopVisitedArticleListItem extends StatelessWidget {
  final HomeScreenController controller;
  final BuildContext context;
  final int index;
  const TopVisitedArticleListItem(
      {required this.controller,
      required this.index,
      required this.context,
      super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
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
                    imageUrl: controller.topVisitedList[index].imagePath,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      );
                    },
                    placeholder: (context, url) => const SpinKitThreeBounce(
                      size: 15,
                      color: SolidColors.purpleButtomColor2,
                    ),
                    errorWidget: (context, url, error) => const Center(
                        child: Icon(HugeIcons.strokeRoundedImage01)),
                  ),
                  Container(
                    height: double.maxFinite,
                    width: 193,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            controller.topVisitedList[index].imagePath),
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
                            gradient: GradientColors.blogsListviewGradientColor,
                          ),
                        ),
                        Positioned(
                          bottom: 7,
                          right: 0,
                          left: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: SolidColors.whiteColor),
                                controller.topVisitedList[index].author,
                              ),
                              Text(
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: SolidColors.whiteColor),
                                  controller.topVisitedList[index].view),
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
    );
  }
}
