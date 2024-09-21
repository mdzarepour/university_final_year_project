import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_blog/const_variabals.dart/project_colors.dart';
import 'package:share_blog/gen/assets.gen.dart';
import 'package:share_blog/models/project_models.dart';

class BlogListItem extends StatelessWidget {
  late BuildContext context;
  late int index;
  BlogListItem({required this.index, required this.context, super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        height: double.maxFinite,
        width: 193,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(blogList[index].imageUrl)),
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
                    blogList[index].writer,
                  ),
                  Text(
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: SolidColors.whiteColor),
                      blogList[index].views)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
