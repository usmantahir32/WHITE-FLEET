import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:whitefleet/views/pages/auth/login/login.dart';
import 'package:whitefleet/views/pages/auth/sign%20up/sign_up.dart';
import 'package:whitefleet/views/widgets/auth_button.dart';
import 'package:whitefleet/constants/images.dart';
import 'package:whitefleet/utils/size_config.dart';
import '../../../../constants/colors.dart';
import '../../../../controllers/onboarding_controller.dart';
import '../../../../models/data.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final cont = Get.put(OnboardingController());
  final PageController _pageController = PageController(initialPage: 0);

  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (cont.selectedIndex.value < 2) {
        cont.selectedIndex.value++;
      } else {
        cont.selectedIndex.value = 0;
      }
      _pageController.animateToPage(
        cont.selectedIndex.value,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Obx(
        () => Column(children: [
          SizedBox(height: SizeConfig.heightMultiplier * 6),
          Image.asset(
            AppImages.appLogo,
            height: SizeConfig.imageSizeMultiplier * 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "White",
                style: textTheme.headlineSmall,
              ),
              Text(
                "fleet",
                style: textTheme.headlineSmall!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 5),
          Text(onBoardingList[cont.selectedIndex.value]['title'],
              style: textTheme.headlineMedium),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          SizedBox(
            width: SizeConfig.widthMultiplier * 80,
            child: Text(onBoardingList[cont.selectedIndex.value]['description'],
                textAlign: TextAlign.center, style: textTheme.bodyMedium),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 6),
          SizedBox(
            height: SizeConfig.heightMultiplier * 30,
            child: PageView.builder(
              itemCount: onBoardingList.length,
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (index) => cont.selectedIndex.value = index,
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  onBoardingList[cont.selectedIndex.value]["image"],
                );
              },
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 6),
          SmoothPageIndicator(
            controller: _pageController,
            count: onBoardingList.length,
            effect: WormEffect(
              activeDotColor: AppColors.primaryClr,
              dotColor: AppColors.greyClr,
              dotHeight: SizeConfig.heightMultiplier * 1,
              dotWidth: SizeConfig.widthMultiplier * 2,
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 5),
          AuthButton(
            title: "Login",
            onTap: () =>
                Get.to(() => LoginPage(), transition: Transition.rightToLeft),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          AuthButton(
            title: "Register",
            onTap: () {
              Get.to(() => SignUpPage(), transition: Transition.rightToLeft);
            },
            isBorder: true,
          ),
        ]),
      ),
    );
  }
}
