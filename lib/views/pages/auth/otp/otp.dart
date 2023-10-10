import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/constants.dart';
import 'package:whitefleet/controllers/login_cont.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/pages/auth/new%20pass/new_pass.dart';
import 'package:whitefleet/views/widgets/auth_button.dart';
import 'package:whitefleet/views/widgets/otp_field.dart';

class OTPPage extends StatelessWidget {
  OTPPage({
    super.key,
  });

  final cont = Get.find<LoginCont>();
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
            Text('OTP Verification', style: textTheme.headlineLarge),
            SizedBox(height: SizeConfig.heightMultiplier * 1),
            Text(
              'Enter the verification code we just sent on your email address.',
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
                title: 'Verify', onTap: () => Get.to(() => NewPassPage()))
          ],
        ),
      ),
    );
  }
}
