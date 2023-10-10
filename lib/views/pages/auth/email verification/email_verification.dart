import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/constants/constants.dart';
import 'package:whitefleet/constants/icons.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/pages/auth/pin%20resgister/pin_register.dart';
import 'package:whitefleet/views/pages/auth/success/success.dart';
import 'package:whitefleet/views/widgets/auth_button.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*5),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.heightMultiplier * 6),
            Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.arrow_back_ios_new)),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 8),
            Image.asset(
              AppIcons.email,
              height: SizeConfig.heightMultiplier * 11,
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 3),
            Text('Email sent for verification', style: textTheme.headlineLarge),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 9,
                  vertical: SizeConfig.heightMultiplier * 1.5),
              child: Text(
                'Please verify your account with the email we sent to Uday.sri450@gmail.com before continuing. It may take a few minutes before you receive the email.',
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium!.copyWith(
                    fontSize: SizeConfig.textMultiplier * 1.5,
                    color: Colors.blueGrey.shade300,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            AuthButton(
                title: 'Verified? Tap here',
                onTap: () {
                  Get.to(() => SuccessPage(
                      title: 'Email Verified!',
                      subtitle:
                          'Hi Uday, Your Email has been verified successfully.',
                      btnText: 'Enable pin access',
                      btnTap: () => Get.to(() => PinRegisterPage(
                            isLogin: false,
                          ))));
                }),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't receive the email?",
                  style: textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Resend Now",
                      style: textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryClr),
                    ))
              ],
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2)
          ],
        ),
      ),
    );
  }
}
