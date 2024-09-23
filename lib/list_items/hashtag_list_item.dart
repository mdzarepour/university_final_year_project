import 'package:flutter/material.dart';
import 'package:tech_blog/models/project_models.dart';
import 'package:tech_blog/const_variabals.dart/project_colors.dart';

class HashtagListItem extends StatelessWidget {
  final int index;
  final BuildContext context;
  const HashtagListItem(
      {super.key, required this.index, required this.context});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Container(
        height: double.maxFinite,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(17)),
          gradient: GradientColors.categoriButtonsGradient,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 9, right: 20),
          child: Row(
            children: [
              const Icon(color: SolidColors.whiteColor, Icons.tag_rounded),
              Text(hastagList[index].title),
              const SizedBox(
                width: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
