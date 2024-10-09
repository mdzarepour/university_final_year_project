import 'package:flutter/material.dart';
import 'package:tech_blog/components/project_colors.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';

class PodcastListItem extends StatelessWidget {
  final BuildContext context;
  final HomeScreenController controller;
  final int index;

  const PodcastListItem(
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
          Container(
            height: 179,
            width: 162.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(controller.topPodcastList[index].poster)),
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
            ),
          ),
          Text(
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: SolidColors.blackTitles),
              controller.topPodcastList[index].title),
        ],
      ),
    );
  }
}
