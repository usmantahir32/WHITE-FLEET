import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/api.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/controllers/schools.dart';
import 'package:whitefleet/models/schools.dart';
import 'package:whitefleet/services/api.dart';
import 'package:whitefleet/views/widgets/custom_snackbar.dart';

class AddSchoolCont extends GetxController {
  final schoolsCont = Get.find<SchoolsCont>();
  //TEXT EDITING CONTROLLERS
  TextEditingController nameCont = TextEditingController();
  TextEditingController addressCont = TextEditingController();
  TextEditingController noteCont = TextEditingController();
  // TextEditingController routeCont = TextEditingController();
  //OBSERVABLES
  RxList selectedDays = [].obs;
  RxList<String> allDrivers = ['aa', 'bb', 'cc', 'dd'].obs;
  // RxString selectedDriver = ''.obs;
  //ADD SCHOOL
  Future<void> addSchool() async {
    try {
      authCont.isLoading.value = true;
      if (_validator()) {
        final response = await ApiService.post(
            '${ApiConstants.endpoint}/inventory/school/create', {
          "name": nameCont.text,
          "address": addressCont.text,
          "note": noteCont.text,
          "weekdays": selectedDays
        });
        if (response != null) {
          if (response.statusCode == 200) {
            Get.back();
            final body = jsonDecode(response.body);
            String schoolID = body["data"];
            //ADDING IN REAL TIME LIST
            List<String> weekDays =
                selectedDays.map((item) => item.toString()).toList();
            schoolsCont.schools.value!.data!.add(SchoolsData(
                id: schoolID,
                name: nameCont.text,
                address: addressCont.text,
                note: noteCont.text,
                weekDays: weekDays));
            schoolsCont.schools.refresh();
            clearValues();
            CustomSnackbar.showCustomSnackbar(false, 'School added!');
          } else {
            CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
          }
        } else {
          CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
        }
      } else {
        CustomSnackbar.showCustomSnackbar(true, 'Provide all Information');
      }
      authCont.isLoading.value = false;
    } catch (e) {
      authCont.isLoading.value = false;
      print(e);
    }
  }

  //EDIT SCHOOL
  Future<void> editSchool(String id) async {
    try {
      authCont.isLoading.value = true;
      if (_validator()) {
        final response = await ApiService.post(
            '${ApiConstants.endpoint}/inventory/school/edit', {
          "id": id,
          "name": nameCont.text,
          "address": addressCont.text,
          "note": noteCont.text,
          "weekdays": selectedDays
        });
        if (response != null) {
          if (response.statusCode == 200) {
            Get.back();
            //GET SCHOOL INDEX
            int index = 0;
            final data = schoolsCont.schools.value!.data!;
            for (int i = 0; i < data.length; i++) {
              if (data[i].id == id) {
                index = i;
                break;
              }
            }
            //UPDATE IN REAL TIME LIST
            List<String> weekDays =
                selectedDays.map((item) => item.toString()).toList();
            schoolsCont.schools.value!.data![index] = SchoolsData(
                id: id,
                address: addressCont.text,
                name: nameCont.text,
                note: noteCont.text,
                weekDays: weekDays);
            schoolsCont.schools.refresh();
            CustomSnackbar.showCustomSnackbar(false, 'School updated!');
          } else {
            CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
          }
        } else {
          CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
        }
      } else {
        CustomSnackbar.showCustomSnackbar(true, 'Provide all Information');
      }
      authCont.isLoading.value = false;
    } catch (e) {
      authCont.isLoading.value = false;
      print(e);
    }
  }

  //SET SCHOOL DATA IN THE ADD FORM
  void getSchools(SchoolsData data) {
    nameCont.text = data.name!;
    addressCont.text = data.address!;
    noteCont.text = data.note!;
    selectedDays.value = data.weekDays!;
  }

  bool _validator() {
    return nameCont.text.isNotEmpty &&
        addressCont.text.isNotEmpty &&
        noteCont.text.isNotEmpty;
  }

  clearValues() {
    nameCont.clear();
    addressCont.clear();
    noteCont.clear();
  }

  //DISPOSE
  disposeValues() {
    nameCont.dispose();
    addressCont.dispose();
    noteCont.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    disposeValues();
  }
}
