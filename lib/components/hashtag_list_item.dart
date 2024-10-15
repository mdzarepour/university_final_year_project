import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/project_colors.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';

class HashtagListItem extends StatelessWidget {
  final int index;
  final List listForDate;
  final BuildContext context;
  const HashtagListItem({
    super.key,
    required this.listForDate,
    required this.index,
    required this.context,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: InkWell(
        onLongPress: () {},
        child: Container(
          height: double.maxFinite,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(17)),
            gradient: GradientColors.categoriButtonsGradient,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 9, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(color: SolidColors.whiteColor, Icons.tag_rounded),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                      Get.find<HomeScreenController>().tagList[index].title),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
