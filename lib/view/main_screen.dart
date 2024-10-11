import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/public_functions.dart';
import 'package:tech_blog/components/strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/components/project_colors.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tech_blog/view/home_page_screen.dart';
import 'package:tech_blog/view/profile_screen.dart';
import 'package:tech_blog/view/register_intro.dart';
import 'package:share_plus/share_plus.dart';

GlobalKey<ScaffoldState> _key = GlobalKey();

class MainScreen extends StatelessWidget {
  final RxInt _selectedIndex = 1.obs;

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: _key,
      drawer: const DrawerMenu(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: Icon(
                    size: size.height / 40, HugeIcons.strokeRoundedMenu02)),
            Image(
              height: size.height / 13.6,
              image: Assets.images.a1.provider(),
            ),
            const Icon(HugeIcons.strokeRoundedSearch01)
          ],
        ),
      ),
      backgroundColor: SolidColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Obx(
              () {
                return IndexedStack(
                  index: _selectedIndex.value,
                  children: [
                    ProfileScreen(size: size, theme: theme),
                    HomePageScreen(size: size, theme: theme),
                    const RegisterIntro(),
                  ],
                );
              },
            ),
            BottumNavigation(
              screenChanger: (int index) {
                _selectedIndex.value = index;
              },
              selectedIndex: _selectedIndex,
            ),
          ],
        ),
      ),
    );
  }
}

class BottumNavigation extends StatelessWidget {
  final Function(int iconIndex) screenChanger;
  const BottumNavigation({
    super.key,
    required RxInt selectedIndex,
    required this.screenChanger,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).size.height / 9,
        decoration: const BoxDecoration(
          gradient: GradientColors.bottumNavigationBackgroundGradientColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: MediaQuery.of(context).size.height / 13.4,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                gradient: GradientColors.bottumNavigasionGradient,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      screenChanger(1);
                    },
                    icon: ImageIcon(
                      color: SolidColors.whiteColor,
                      Assets.icons.icon.provider(),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      screenChanger(2);
                    },
                    icon: ImageIcon(
                      color: SolidColors.whiteColor,
                      Assets.icons.w.provider(),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      screenChanger(0);
                    },
                    icon: ImageIcon(
                      color: SolidColors.whiteColor,
                      Assets.icons.user.provider(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: Colors.white,
      elevation: 0,
      width: MediaQuery.of(context).size.width - 90,
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.all(Radius.zero),
      ),
      backgroundColor: SolidColors.scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: ListView(
          children: [
            DrawerHeader(
              curve: Curves.bounceIn,
              child: Image.asset(scale: 2.6, Assets.images.a1.path),
            ),
            ListTile(
              title: Text(
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: SolidColors.blackTitles),
                  "حساب کاربری"),
              onTap: () {},
            ),
            const Divider(
              color: Color.fromARGB(255, 203, 203, 203),
            ),
            ListTile(
              title: Text(
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: SolidColors.blackTitles),
                  "درباره تک بلاگ"),
              onTap: () {},
            ),
            const Divider(
              color: Color.fromARGB(255, 203, 203, 203),
            ),
            ListTile(
              title: Text(
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: SolidColors.blackTitles),
                  "اشتراک گذاری تک بلاگ"),
              onTap: () async {
                Share.share(ProjectStrings.shareTechBlog);
              },
            ),
            const Divider(
              color: Color.fromARGB(255, 203, 203, 203),
            ),
            ListTile(
              title: Text(
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: SolidColors.blackTitles),
                  "تک بلاگ در گیت هاب"),
              onTap: () {
                urlLuncher("https://codeyad.com/course/learn-flutter");
              },
            ),
            const Divider(
              color: Color.fromARGB(255, 203, 203, 203),
            ),
          ],
        ),
      ),
    );
  }
}
