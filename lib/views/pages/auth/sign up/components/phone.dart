import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/controllers/signup_cont.dart';
import 'package:whitefleet/views/widgets/custom_auth_textfield.dart';
class PhoneInfo extends StatelessWidget {
   PhoneInfo({super.key});
final cont=Get.find<SignupCont>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAuthTextField(hintText: 'Phone number', controller: cont.phone)
      ],
    );
  }
}