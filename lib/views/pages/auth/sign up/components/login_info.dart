import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/controllers/signup_cont.dart';
import 'package:whitefleet/views/widgets/custom_auth_textfield.dart';
class LoginInfo extends StatelessWidget {
   LoginInfo({super.key});
final cont=Get.find<SignupCont>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAuthTextField(hintText: 'Email address', controller: cont.email),
        CustomAuthTextField(hintText: 'Password', controller: cont.pass,isPassword: true,),
        CustomAuthTextField(hintText: 'Confirm Password', controller: cont.confirmPass,isPassword: true,),

      ],
    );
  }
}