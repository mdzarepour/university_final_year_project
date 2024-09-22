import 'package:flutter/material.dart';
import 'package:share_blog/gen/assets.gen.dart';
import 'package:share_blog/const_variabals.dart/project_colors.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:share_blog/screens/home_page_screen.dart';
import 'package:share_blog/screens/profile_screen.dart';
import 'package:share_blog/screens/writeScreen.dart';

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
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(size: size.height / 40, HugeIcons.strokeRoundedMenu02),
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
                HomePageScreen(size: size, theme: theme),
                ProfileScreen(size: size, theme: theme),
                WriteScreen(),
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

class BottumNavigationBar extends StatelessWidget {
  Function(int) changeScreen;
  BottumNavigationBar({
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
                      changeScreen(0);
                    },
                    icon: ImageIcon(
                      color: SolidColors.whiteColor,
                      Assets.images.icon.provider(),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      changeScreen(2);
                    },
                    icon: ImageIcon(
                      color: SolidColors.whiteColor,
                      Assets.images.w.provider(),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      changeScreen(1);
                    },
                    icon: ImageIcon(
                      color: SolidColors.whiteColor,
                      Assets.images.user.provider(),
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
