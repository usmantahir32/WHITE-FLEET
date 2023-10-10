import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/pages/auth/login/login_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Get.to(() => LoginBackground(), transition: Transition.rightToLeft);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: SizeConfig.heightMultiplier * 100,
        width: SizeConfig.widthMultiplier * 100,
        child: Center(
          child: Image.asset("assets/images/splash.gif"),
        ),
      ),
    );
  }
}
