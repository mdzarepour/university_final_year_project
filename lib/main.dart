import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/project_colors.dart';
import 'package:tech_blog/view/home_page_screen.dart';
import 'package:tech_blog/view/main_screen.dart';
import 'package:tech_blog/view/read_article_screen.dart';

void main(List<String> args) {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: SolidColors.statusBarColor,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: SolidColors.statusBarColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          hintStyle: TextStyle(
            color: Color.fromARGB(92, 88, 86, 86),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 112, 112, 112),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(9),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: const WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
            alignment: AlignmentDirectional.center,
            backgroundColor: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.pressed)) {
                  return SolidColors.purpleButtomColor2;
                } else {
                  return SolidColors.purpleButtomColor;
                }
              },
            ),
            fixedSize: const WidgetStatePropertyAll(Size(200, 60)),
          ),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: SolidColors.scaffoldBackgroundColor,
        ),
        textTheme: const TextTheme(
            bodyLarge: TextStyle(
              color: SolidColors.whiteTransparentColor,
              fontFamily: 'vazir',
              fontSize: 22,
            ),
            bodyMedium: TextStyle(
              color: SolidColors.whiteTransparentColor,
              fontFamily: 'vazir',
              fontSize: 15,
            ),
            bodySmall: TextStyle(
              color: SolidColors.blackTitles,
              fontFamily: 'vazir',
              fontSize: 15,
            ),
            headlineMedium: TextStyle(
              fontWeight: FontWeight.w700,
              color: SolidColors.blueLinkTitles,
              fontFamily: 'vazir',
              fontSize: 17,
            ),
            titleMedium: TextStyle(
              color: Colors.black,
              fontFamily: 'vazir',
              fontSize: 15,
            ),
            titleSmall: TextStyle(
              color: SolidColors.greySubTitles,
              fontFamily: 'vazir',
              fontSize: 13,
            )),
      ),
      debugShowCheckedModeBanner: false,
      locale: const Locale('fa'),
      getPages: [
        GetPage(name: "/HomePageScreen", page: () => const HomePageScreen()),
        GetPage(
          name: "/singleArticle",
          page: () => ReadArticleScreen(),
        ),
      ],
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: MainScreen(),
        ),
      ),
    );
  }
}
