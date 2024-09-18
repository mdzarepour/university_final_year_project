import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:share_blog/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share_blog/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          )),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 400),
      child: SizedBox(
        child: Column(
          children: [
            Image(
              height: 85,
              image: Assets.images.a1.provider(),
            ),
            const SizedBox(
              height: 30,
            ),
            const SpinKitWave(
              color: Colors.black,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
