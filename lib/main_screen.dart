import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/const_variabals.dart/project_colors.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tech_blog/screens/home_page_screen.dart';
import 'package:tech_blog/screens/profile_screen.dart';
import 'package:tech_blog/screens/register_intro.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
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
              onTap: () => _key.currentState!.openDrawer(),
              child:
                  Icon(size: size.height / 40, HugeIcons.strokeRoundedMenu02),
            ),
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
            IndexedStack(
              index: _selectedIndex,
              children: [
                ProfileScreen(size: size, theme: theme),
                const RegisterIntro(),
                HomePageScreen(size: size, theme: theme),
              ],
            ),
            BottumNavigationBar(changeScreen: (int value) {
              setState(() {
                _selectedIndex = value;
              });
            }),
          ],
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
      width: MediaQuery.of(context).size.width - 80,
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.zero),
      ),
      backgroundColor: SolidColors.scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 40),
        child: ListView(
          children: [
            DrawerHeader(
              curve: Curves.easeIn,
              child: Image.asset(scale: 3, Assets.images.a1.path),
            ),
            ListTile(
              title: Text(
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: SolidColors.blackTitles),
                  "پروفایل کاربری"),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              title: Text(
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: SolidColors.blackTitles),
                  "درباره تک بلاگ"),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              title: Text(
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: SolidColors.blackTitles),
                  "اشتراک گذاری تک بلاگ"),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              title: Text(
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: SolidColors.blackTitles),
                  "تک بلاگ در گیت هاب"),
              onTap: () {},
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

class BottumNavigationBar extends StatelessWidget {
  final Function(int) changeScreen;
  const BottumNavigationBar({
    required this.changeScreen,
    super.key,
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
                      changeScreen(2);
                    },
                    icon: ImageIcon(
                      color: SolidColors.whiteColor,
                      Assets.icons.icon.provider(),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      changeScreen(1);
                    },
                    icon: ImageIcon(
                      color: SolidColors.whiteColor,
                      Assets.icons.w.provider(),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      changeScreen(0);
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
