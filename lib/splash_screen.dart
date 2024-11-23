import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
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
    return const Padding(
      padding: EdgeInsets.only(top: 400),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 30,
          ),
          SpinKitThreeBounce(
            color: Colors.black,
            size: 30,
          )
        ],
      ),
    );
  }
}
