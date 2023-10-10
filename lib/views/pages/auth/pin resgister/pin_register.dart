import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/Constants/colors.dart';
import 'package:whitefleet/constants/constants.dart';
import 'package:whitefleet/controllers/signup_cont.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/pages/auth/login/login.dart';
import 'package:whitefleet/views/pages/auth/success/success.dart';
import 'package:whitefleet/views/pages/auth/welcome/welcome.dart';
import 'package:whitefleet/views/widgets/auth_button.dart';
import 'package:whitefleet/views/widgets/otp_field.dart';

class PinRegisterPage extends StatelessWidget {
  final bool isLogin;
  PinRegisterPage({
    super.key,
    required this.isLogin,
  });

  final cont = Get.put(SignupCont());
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
            Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.arrow_back_ios_new)),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 4),
            Text(isLogin ? "PIN Verification" : "PIN Registration",
                style: textTheme.headlineLarge),
            SizedBox(height: SizeConfig.heightMultiplier * 1),
            Text(
              'For the safety of your account and personal information, kindly choose a 4-digit PIN. ',
              style: textTheme.bodyMedium!.copyWith(
                  fontSize: SizeConfig.textMultiplier * 1.5,
                  color: Colors.blueGrey.shade300,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OtpField(
                  first: true,
                  last: false,
                  controller: cont.firstOTPCont,
                ),
                OtpField(
                  first: false,
                  last: false,
                  controller: cont.secondOTPCont,
                ),
                OtpField(
                  first: false,
                  last: false,
                  controller: cont.thirdOTPCont,
                ),
                OtpField(
                  first: false,
                  last: true,
                  controller: cont.forthOTPCont,
                ),
              ],
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 5),
            AuthButton(
              title: isLogin ? "Verify Pin" : "Create Pin",
              onTap: () => isLogin
                  ? Get.to(const WelcomeScreen(),
                      transition: Transition.rightToLeft)
                  : Get.to(() => SuccessPage(
                      title: 'Pin Created!',
                      subtitle:
                          'Your 4 digit pin has been created successfully.',
                      btnText: 'Back to Login',
                      btnTap: () => Get.to(() => LoginPage()))),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 5),
            isLogin
                ? Center(
                    child: TextButton(
                        onPressed: () {
                          Get.to(() => LoginPage(),
                              transition: Transition.rightToLeft);
                        },
                        child: Text(
                          "Login with your password...",
                          style: textTheme.bodyMedium!
                              .copyWith(color: AppColors.primaryClr),
                        )),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
