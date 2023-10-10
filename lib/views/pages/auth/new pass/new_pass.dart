import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/constants.dart';
import 'package:whitefleet/controllers/login_cont.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/pages/auth/success/success.dart';
import 'package:whitefleet/views/widgets/auth_button.dart';
import 'package:whitefleet/views/pages/bottom%20nav%20bar/bottom_nav_bar.dart';
import 'package:whitefleet/views/widgets/custom_auth_textfield.dart';

class NewPassPage extends StatelessWidget {
  NewPassPage({super.key});
  final cont = Get.put(LoginCont());
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
              Text('Create new password', style: textTheme.headlineLarge),
              SizedBox(height: SizeConfig.heightMultiplier * 1),
              Text(
                "Your new password must be unique from those\npreviously used.",
                style: textTheme.bodyMedium!.copyWith(
                    fontSize: SizeConfig.textMultiplier * 1.5,
                    color: Colors.blueGrey.shade300,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              CustomAuthTextField(
                  hintText: 'New Password',
                  controller: cont.newpass,
                  isPassword: true),
              CustomAuthTextField(
                hintText: 'Confirm Password',
                controller: cont.confirmNewpass,
                isPassword: true,
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              AuthButton(
                  title: 'Reset Password',
                  onTap: () => Get.to(() => SuccessPage(
                      title: 'Password Changed!',
                      subtitle: 'Your password has been changed\nsuccessfully/',
                      btnText: 'Back to Login',
                      btnTap: () => Get.to(() => const BottomNavBarScreen())))),
            ],
          ),
        ),
      ),
    );
  }
}
