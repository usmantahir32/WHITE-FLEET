import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/constants.dart';
import 'package:whitefleet/controllers/signup_cont.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/pages/auth/sign%20up/components/login_info.dart';
import 'package:whitefleet/views/pages/auth/sign%20up/components/personal_info.dart';
import 'package:whitefleet/views/pages/auth/sign%20up/components/phone.dart';
import 'package:whitefleet/views/pages/auth/email%20verification/email_verification.dart';
import 'package:whitefleet/views/widgets/auth_button.dart';

import 'components/progress_bar.dart';

// ignore: must_be_immutable
class SignUpPage extends GetWidget {
  SignUpPage({super.key});
  final cont = Get.put(SignupCont());
  List<Widget> sections = [PersonalInfo(), LoginInfo(), PhoneInfo()];
  List<String> sectionsName = [
    "Personal Information",
    "Login Information",
    "Phone number",
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.heightMultiplier * 6),
            InkWell(
                onTap: () => Get.back(),
                child: const Icon(Icons.arrow_back_ios_new)),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Obx(
              () => Text("Your ${sectionsName[cont.currentSection.value]}",
                  style: textTheme.headlineMedium),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            CustomProgressBar(),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            SizedBox(
              height: SizeConfig.heightMultiplier * 51,
              width: SizeConfig.widthMultiplier * 100,
              child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: cont.pageCont,
                  itemCount: sections.length,
                  onPageChanged: (val) => cont.currentSection.value = val,
                  allowImplicitScrolling: false,
                  itemBuilder: (_, i) => Obx(() => Padding(
                        padding: EdgeInsets.only(
                            top: SizeConfig.heightMultiplier * 2),
                        child: sections[cont.currentSection.value],
                      ))),
            ),
            Obx(() => AuthButton(
                onTap: () => cont.currentSection.value == 2
                    ? Get.to(() => const EmailVerificationPage())
                    : _onNext(),
                title: cont.currentSection.value == 2 ? 'Finish' : 'Next'))
          ],
        ),
      ),
    );
  }

  _onNext() {
    cont.pageCont.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}
