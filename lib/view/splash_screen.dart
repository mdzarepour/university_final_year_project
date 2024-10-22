import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/view/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState()  {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => MainScreen(),
          )),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 400),
      child: Column(
        children: [
          Image(
            height: 85,
            image: Assets.images.a1.provider(),
          ),
          const SizedBox(
            height: 30,
          ),
          const SpinKitThreeBounce(
            color: Colors.black,
            size: 30,
          )
        ],
      ),
    );
  }
}
