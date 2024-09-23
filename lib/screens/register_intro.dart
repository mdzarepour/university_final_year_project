import 'package:tech_blog/const_variabals.dart/project_colors.dart';
import 'package:tech_blog/const_variabals.dart/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:tech_blog/gen/assets.gen.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(height: 150, Assets.icons.techBot.path),
              const SizedBox(
                height: 20,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: ProjectStrings.welcome,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.black, fontSize: 18),
                  )),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                onPressed: () {
                  _showBottumSheet(context);
                },
                child: Text(
                    style: Theme.of(context).textTheme.bodyMedium,
                    ProjectStrings.go),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showBottumSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            height: 340,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: SolidColors.scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(27),
                topRight: Radius.circular(27),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: SolidColors.blackTitles),
                    "لطفا ایملیت رو وارد کن"),
                const Padding(
                  padding: EdgeInsets.fromLTRB(40, 35, 60, 40),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      hintText: "example@gmail.com",
                      hintTextDirection: TextDirection.ltr,
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
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                      style: Theme.of(context).textTheme.bodyMedium,
                      ProjectStrings.countinue),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}