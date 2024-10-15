import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tech_blog/components/project_colors.dart';

PreferredSize listsAppbar(BuildContext context, String title) {
  return PreferredSize(
    preferredSize: const Size(double.maxFinite, 90.5),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(15, 12, 15, 21),
      child: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Text(
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: SolidColors.purpleTitles, fontSize: 19),
              title)
        ],
        leading: Container(
          decoration: const BoxDecoration(
            color: SolidColors.appBarPurple,
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
          child: const Icon(
              color: SolidColors.whiteColor,
              HugeIcons.strokeRoundedArrowRight01),
        ),
      ),
    ),
  );
}
