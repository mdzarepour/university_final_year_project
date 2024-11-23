import 'package:flutter/material.dart';

class SolidColors {
  static const Color blueLinkTitles = Color.fromARGB(255, 40, 107, 184);
  static const Color appBarPurple = Color.fromARGB(255, 151, 120, 170);
  static const Color whiteTransparentColor = Color.fromARGB(210, 255, 255, 255);
  static const Color whiteColor = Color.fromARGB(255, 255, 255, 255);
  static const Color blackTitles = Color.fromARGB(255, 0, 0, 0);
  static const Color statusBarColor = Color.fromARGB(255, 255, 255, 255);
  static const Color scaffoldBackgroundColor =
      Color.fromARGB(255, 255, 255, 255);
  static const Color greySubTitles = Color.fromARGB(255, 97, 97, 97);
  static const Color blueListtleTitles = Color.fromARGB(255, 44, 125, 180);
  static const Color purpleTitles = Color.fromARGB(255, 66, 4, 87);
  static const Color greyNameColor = Color.fromARGB(255, 197, 197, 197);
  static const Color purpleButtomColor = Color.fromARGB(255, 66, 4, 87);
  static const Color purpleButtomColor2 = Color.fromARGB(255, 80, 11, 103);
  static const Color orangeSelectedPodcastColor =
      Color.fromARGB(255, 255, 139, 26);
}

class GradientColors {
  static const Gradient bottumNavigasionGradient = LinearGradient(colors: [
    Color.fromARGB(255, 25, 0, 94),
    Color.fromARGB(255, 68, 4, 87),
  ]);
  static const Gradient categoriButtonsGradient = LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [
        Color.fromARGB(255, 0, 0, 0),
        Color.fromARGB(255, 63, 63, 63),
      ]);
  static const Gradient bannerGradientColor = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromARGB(0, 40, 41, 46),
        Color.fromARGB(120, 72, 20, 88),
        Color.fromARGB(255, 28, 20, 81),
      ]);
  static const Gradient readArticleBannerGradient = LinearGradient(
      begin: Alignment.center,
      end: Alignment.topCenter,
      colors: [
        Color.fromARGB(0, 40, 41, 46),
        Color.fromARGB(120, 72, 20, 88),
        Color.fromARGB(255, 28, 20, 81),
      ]);
  static const Gradient blogsListviewGradientColor = LinearGradient(
      begin: Alignment.center,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromARGB(0, 255, 255, 255),
        Color.fromARGB(2550, 0, 0, 0),
      ]);
  static const Gradient bottumNavigationBackgroundGradientColor =
      LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
        Color.fromARGB(255, 255, 255, 255),
        Color.fromARGB(180, 255, 255, 255),
        Color.fromARGB(0, 214, 214, 214),
      ]);
  static const Gradient selectedTagsBackground = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        Color.fromARGB(255, 177, 177, 177),
        Color.fromARGB(255, 177, 177, 177),
        Color.fromARGB(255, 177, 177, 177),
      ]);
}
