import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/components/project_colors.dart';
import 'package:tech_blog/components/strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/project_models.dart';
import 'package:tech_blog/view/write_blog.dart';

class RegisterInformation extends StatefulWidget {
  const RegisterInformation({super.key});

  @override
  State<RegisterInformation> createState() => _RegisterInformationState();
}

class _RegisterInformationState extends State<RegisterInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70, bottom: 35),
                  child:
                      SvgPicture.asset(height: 170, Assets.icons.techBot.path),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: SolidColors.blackTitles),
                    text: ProjectStrings.complateYourInformation,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const TextField(
                  decoration: InputDecoration(hintText: "نام و نام خانوادگی"),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: SolidColors.purpleTitles),
                    "دسته بندی هایی رو که دوست داری انتخاب کن"),
                const SizedBox(
                  height: 38,
                ),
                registerInforMationTagsGridView(),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 50),
                  child: ImageIcon(size: 47, Assets.icons.a64616.provider()),
                ),
                selectedTagsListView(),
                const SizedBox(
                  height: 35,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const WriteBlog(),
                          ));
                    },
                    child: Text(
                        style: Theme.of(context).textTheme.bodyMedium,
                        ProjectStrings.countinue)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox selectedTagsListView() {
    return SizedBox(
      width: double.maxFinite,
      height: 40,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: faceSelectedTagsData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              height: double.maxFinite,
              width: 145,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(17)),
                color: Color.fromARGB(255, 153, 153, 153),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    Expanded(child: Text(faceSelectedTagsData[index].title)),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          faceSelectedTagsData.removeAt(index);
                        });
                      },
                      child: const Icon(
                          size: 20,
                          color: SolidColors.whiteColor,
                          CupertinoIcons.delete),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox registerInforMationTagsGridView() {
    return SizedBox(
      height: 90,
      width: double.infinity,
      child: GridView.builder(
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: hastagList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (1 / 3.9),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                if (faceSelectedTagsData.length <= 4) {
                  if (faceSelectedTagsData.contains(hastagList[index])) {
                    _showSnackBar(context, "تگ مورد نظر قبلا انتخاب شده");
                  } else {
                    faceSelectedTagsData.add(hastagList[index]);
                  }
                } else {
                  _showSnackBar(
                      context, "نمی تونی بیشتر از چهار تگ انتخاب کنی");
                }
              });
            },
            child: Container(
              height: double.maxFinite,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(17)),
                gradient: GradientColors.categoriButtonsGradient,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  const Icon(color: SolidColors.whiteColor, Icons.tag_rounded),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(hastagList[index].title),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void _showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: SolidColors.greySubTitles,
      duration: const Duration(
        seconds: 1,
      ),
      elevation: 0,
      content: Text(
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
          message),
    ),
  );
}
