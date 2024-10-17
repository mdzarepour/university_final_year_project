import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tech_blog/components/project_colors.dart';
import 'package:tech_blog/controller/article_model_controller.dart';
import 'package:tech_blog/controller/read_article_screen_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/view/show_article_list_from_tag_id.dart';

class ReadArticleScreen extends StatefulWidget {
  const ReadArticleScreen({super.key});

  @override
  State<ReadArticleScreen> createState() => _ReadArticleScreenState();
}

final ReadArticleScreenController readArticleScreenController =
    Get.put(ReadArticleScreenController());
final ArticleModelController articleModelController =
    Get.put(ArticleModelController());

class _ReadArticleScreenState extends State<ReadArticleScreen> {
  @override
  void initState() {
    super.initState();
    readArticleScreenController.getReadArticleScreenData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(
      () => Scaffold(
        body: readArticleScreenController.articleInfoModel.value.title == null
            ? const SpinKitThreeBounce(
                size: 15,
                color: SolidColors.purpleButtomColor2,
              )
            : SafeArea(
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          width: size.width,
                          height: size.height / 3.9,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: const ArticleBanner(),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 16, 12, 15),
                          child: Column(
                            children: [
                              Text(
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                readArticleScreenController
                                    .articleInfoModel.value.title!,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                      height: 40, Assets.images.a3899618.path),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                      readArticleScreenController
                                          .articleInfoModel.value.author!),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color: SolidColors.greySubTitles),
                                    readArticleScreenController
                                        .articleInfoModel.value.createdAt!,
                                  ),
                                ],
                              ),
                              const Divider(),
                              const SizedBox(height: 20),
                              const ArticleContent(),
                              const SizedBox(height: 40),
                              const TagsListView(),
                            ],
                          ),
                        ),
                        RelatedArticlesListView(size: size),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

class ArticleBanner extends StatelessWidget {
  const ArticleBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: Get.width,
          height: Get.height,
          child: CachedNetworkImage(
            imageUrl: readArticleScreenController.articleInfoModel.value.image!,
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              );
            },
            placeholder: (context, url) => const SpinKitThreeBounce(
              color: SolidColors.purpleButtomColor2,
              size: 15,
            ),
            errorWidget: (context, url, error) =>
                const Icon(HugeIcons.strokeRoundedImage01),
          ),
        ),
        Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
              gradient: GradientColors.readArticleBannerGradient),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 20),
          child: Row(
            children: [
              Icon(
                  color: SolidColors.whiteColor,
                  size: 28,
                  HugeIcons.strokeRoundedArrowRight01),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                        color: SolidColors.whiteColor,
                        size: 28,
                        HugeIcons.strokeRoundedFavourite),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                        color: SolidColors.whiteColor,
                        size: 28,
                        HugeIcons.strokeRoundedShare08),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class ArticleContent extends StatelessWidget {
  const ArticleContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Text(
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: SolidColors.greySubTitles,
            ),
        "${readArticleScreenController.articleInfoModel.value.content}",
      ),
    );
  }
}

class TagsListView extends StatelessWidget {
  const TagsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height / 16.5,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: readArticleScreenController.tagsList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {
              articleModelController.getArticlesListFromTagId(
                  readArticleScreenController.tagsList[index].id);
              articleModelController.selectedTagName.value =
                  readArticleScreenController.tagsList[index].title;
              Get.to(() => ShowArticleListFromTagId());
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 231, 228, 228),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.black),
                        readArticleScreenController.tagsList[index].title),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class RelatedArticlesListView extends StatelessWidget {
  const RelatedArticlesListView({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height / 3.5,
      child: ListView.builder(
        itemCount: readArticleScreenController.relatedArticlesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                left: 15, right: index == 0 ? size.width / 36 : 0),
            child: SizedBox(
              height: Get.height,
              width: Get.width / 2.1,
              child: Column(
                children: <Widget>[
                  Stack(
                    children: [
                      SizedBox(
                        width: Get.width,
                        height: Get.height / 5,
                        child: CachedNetworkImage(
                          imageUrl: readArticleScreenController
                              .relatedArticlesList[index].imagePath,
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(25),
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover, image: imageProvider),
                              ),
                            );
                          },
                          placeholder: (context, url) =>
                              const SpinKitThreeBounce(
                            color: SolidColors.purpleButtomColor2,
                            size: 15,
                          ),
                          errorWidget: (context, url, error) => const Icon(
                            HugeIcons.strokeRoundedImage01,
                          ),
                        ),
                      ),
                      Container(
                        width: Get.width,
                        height: Get.height / 5,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          gradient: GradientColors.blogsListviewGradientColor,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: Colors.black, fontSize: 16),
                      readArticleScreenController
                          .relatedArticlesList[index].title,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
