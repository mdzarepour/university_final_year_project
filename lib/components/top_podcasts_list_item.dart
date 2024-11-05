import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/components/project_colors.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';

class TopPodcastsListItem extends StatelessWidget {
  final BuildContext context;
  final HomeScreenController controller;
  final int index;

  const TopPodcastsListItem(
      {required this.controller,
      required this.context,
      required this.index,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 179,
            width: 162.5,
            child: CachedNetworkImage(
              imageUrl: controller.topPodcastList[index].poster,
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: imageProvider,
                    ),
                  ),
                );
              },
              placeholder: (context, url) => const SpinKitThreeBounce(
                size: 15,
                color: SolidColors.purpleButtomColor2,
              ),
              errorWidget: (context, url, error) =>
                  Icon(Icons.image_not_supported_outlined),
            ),
          ),
          Text(
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: SolidColors.blackTitles),
              controller.topPodcastList[index].author),
        ],
      ),
    );
  }
}
