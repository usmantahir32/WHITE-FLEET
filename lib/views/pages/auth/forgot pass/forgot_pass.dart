import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/constants.dart';
import 'package:whitefleet/controllers/login_cont.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/pages/auth/otp/otp.dart';
import 'package:whitefleet/views/widgets/auth_button.dart';
import 'package:whitefleet/views/widgets/custom_auth_textfield.dart';

class ForgotPassPage extends StatelessWidget {
  ForgotPassPage({super.key});
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
            Text('Forgot Password?', style: textTheme.headlineLarge),
            SizedBox(height: SizeConfig.heightMultiplier * 1),
            Text(
              "Don't worry! It occurs. Please enter the email address linked with your account.",
              style: textTheme.bodyMedium!.copyWith(
                  fontSize: SizeConfig.textMultiplier * 1.5,
                  color: Colors.blueGrey.shade300,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            CustomAuthTextField(
                hintText: 'Email address', controller: cont.forgotEmail),
            SizedBox(height: SizeConfig.heightMultiplier * 5),
            AuthButton(title: 'Send Code', onTap: () => Get.to(() => OTPPage()))
          ],
        ),
      ),
    );
  }
}
