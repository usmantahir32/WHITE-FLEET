import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupCont extends GetxController {
  RxInt currentSection = 0.obs;
  PageController pageCont = PageController(initialPage: 0);
  TextEditingController firstName = TextEditingController();
  TextEditingController middleName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  TextEditingController firstOTPCont = TextEditingController();
  TextEditingController secondOTPCont = TextEditingController();
  TextEditingController thirdOTPCont = TextEditingController();
  TextEditingController forthOTPCont = TextEditingController();
}
