import 'package:flutter/material.dart';
import 'package:tech_blog/const_variabals.dart/project_colors.dart';
import 'package:tech_blog/const_variabals.dart/strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.size,
    required this.theme,
  });

  final Size size;
  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SolidColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Image(image: Assets.images.a3899618.provider()),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(
                      color: SolidColors.blueLinkTitles,
                      Assets.icons.a2710222.provider()),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: SolidColors.blueLinkTitles),
                      "ویرایش عکس پروفایل"),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Text(
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: SolidColors.blackTitles),
                  "فاطمه امیری"),
              const SizedBox(
                height: 15,
              ),
              Text(
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: SolidColors.blackTitles),
                  "fatemehamiri@gmail.com"),
              const SizedBox(
                height: 40,
              ),
              ProfileScreenWidget(
                  size: size, text: ProjectStrings.favoriteBlogs),
              ProfileScreenWidget(
                size: size,
                text: ProjectStrings.favoritePodcast,
              ),
              ProfileScreenWidget(
                size: size,
                text: "خروج از حساب کاربری",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileScreenWidget extends StatelessWidget {
  final dynamic size;
  final String text;
  const ProfileScreenWidget(
      {required this.text, required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: SolidColors.greyNameColor,
          indent: size.width / 6,
          endIndent: size.width / 6,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: SolidColors.blackTitles),
              text),
        ),
      ],
    );
  }
}
