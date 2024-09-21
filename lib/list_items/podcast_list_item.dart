import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_blog/const_variabals.dart/project_colors.dart';
import 'package:share_blog/models/project_models.dart';

class PodcastListItem extends StatelessWidget {
  late BuildContext context;
  late int index;

  PodcastListItem({required this.context, required this.index, super.key});

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
                  image: NetworkImage(podcastList[index].imageUrl)),
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
              podcastList[index].title),
        ],
      ),
    );
  }
}
