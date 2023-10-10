import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/constants/constants.dart';
import 'package:whitefleet/controllers/login_cont.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/pages/auth/forgot%20pass/forgot_pass.dart';
import 'package:whitefleet/views/pages/auth/sign%20up/sign_up.dart';
import 'package:whitefleet/views/widgets/auth_button.dart';
import 'package:whitefleet/views/pages/bottom%20nav%20bar/bottom_nav_bar.dart';
import 'package:whitefleet/views/widgets/custom_auth_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final cont = Get.put(LoginCont());
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
              SizedBox(height: SizeConfig.heightMultiplier * 4),
              Text('Welcome back! Glad to see you, Again!',
                  style: textTheme.headlineLarge),
              SizedBox(height: SizeConfig.heightMultiplier * 5),
              CustomAuthTextField(
                  hintText: 'Email address', controller: cont.email),
              CustomAuthTextField(
                hintText: 'Password',
                controller: cont.pass,
                isSpacing: false,
                isPassword: true,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () => Get.to(() => ForgotPassPage()),
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(color: Colors.grey.shade700),
                    )),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              AuthButton(
                  title: 'Login',
                  onTap: () => Get.to(() => const BottomNavBarScreen())),
              SizedBox(height: SizeConfig.heightMultiplier * 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: textTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                      onPressed: () => Get.to(() => SignUpPage()),
                      child: Text(
                        "Register?",
                        style: textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryClr),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
