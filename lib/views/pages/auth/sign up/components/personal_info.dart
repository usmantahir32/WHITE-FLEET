import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/controllers/signup_cont.dart';
import 'package:whitefleet/views/widgets/custom_auth_textfield.dart';
import 'package:intl/intl.dart';

class PersonalInfo extends StatelessWidget {
  PersonalInfo({super.key});
  final cont = Get.find<SignupCont>();
  final dateFormat = DateFormat('MMMM dd, yyyy');
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAuthTextField(hintText: 'First name', controller: cont.firstName),
        CustomAuthTextField(
            hintText: 'Middle name', controller: cont.middleName),
        CustomAuthTextField(hintText: 'Last name', controller: cont.lastName),
        CustomAuthTextField(
            hintText: 'Date Of Birth',
            onTap: () => _openDatePicker(context),
            controller: cont.dob),
        CustomAuthTextField(hintText: 'Gender', controller: cont.gender),
        CustomAuthTextField(hintText: 'Address', controller: cont.address),
      ],
    );
  }

  _openDatePicker(BuildContext context) async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if (selectedDate != null) {
      cont.dob.text = dateFormat.format(selectedDate);
    }
  }
}
