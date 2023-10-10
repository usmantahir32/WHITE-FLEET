import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:whitefleet/controllers/van_rego.dart';
import 'package:whitefleet/models/vanrego.dart';

import '../constants/api.dart';
import '../constants/cont.dart';
import '../services/api.dart';
import '../views/widgets/custom_snackbar.dart';

class AddVanRegoCont extends GetxController {
  final vangoCont = Get.find<VanRegoCont>();
  //// TextField Controller
  TextEditingController vanNoController = TextEditingController();
  TextEditingController regNohController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  //// Pick Date Time Variable
  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxBool isDateSelected = false.obs;

  //////    Add New  Van Rego////
  Future<void> addVanRego() async {
    try {
      authCont.isLoading.value = true;
      if (_validator()) {
        var convertDate = formatDateTimeToISO8601(selectedDate.value);
        final response = await ApiService.post(
            '${ApiConstants.endpoint}/inventory/vanrego/create', {
          "vanNumber": vanNoController.text,
          "regoNumber": regNohController.text,
          "company": nameController.text,
          "size": sizeController.text,
          "regoExpiry": convertDate,
        });
        if (response != null) {
          if (response.statusCode == 200) {
            print(response.statusCode);
            Get.back();
            final body = jsonDecode(response.body);
            print(body);
            String vanID = body["data"];
            print(vanID);
            //ADDING IN REAL TIME LIST
            var stringDate = editConvert(selectedDate.value.toString());
            vangoCont.venrego.value!.data!.add(VanRegoData(
              id: vanID,
              vanNumber: vanNoController.text,
              regoNumber: regNohController.text,
              company: nameController.text,
              size: sizeController.text,
              regoExpiry: stringDate,

              ///// Add Fielsd
            ));
            vangoCont.venrego.refresh();
            clearValues();
            CustomSnackbar.showCustomSnackbar(false, 'Van Rego added!');
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

  //EDIT DEPPO
  Future<void> editVanRego(String id) async {
    try {
      authCont.isLoading.value = true;
      if (_validator()) {
        var convertDate = formatDateTimeToISO8601(selectedDate.value);
        final response = await ApiService.post(
            '${ApiConstants.endpoint}/inventory/vanrego/edit', {
          "id": id,
          "vanNumber": vanNoController.text,
          "regoNumber": regNohController.text,
          "company": nameController.text,
          "size": sizeController.text,
          "regoExpiry": convertDate,
        });
        if (response != null) {
          if (response.statusCode == 200) {
            Get.back();
            //GET SCHOOL INDEX
            int index = 0;
            final data = vangoCont.venrego.value!.data!;
            for (int i = 0; i < data.length; i++) {
              if (data[i].id == id) {
                index = i;
                break;
              }
            }

            var stringDate = editConvert(selectedDate.value.toString());
            //UPDATE IN REAL TIME LIST
            vangoCont.venrego.value!.data![index] = VanRegoData(
              id: id,
              vanNumber: vanNoController.text,
              regoNumber: regNohController.text,
              company: nameController.text,
              size: sizeController.text,
              regoExpiry: stringDate,
            );
            vangoCont.venrego.refresh();
            clearValues();
            CustomSnackbar.showCustomSnackbar(false, 'Van Rego updated!');
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

  bool _validator() {
    return vanNoController.text.isNotEmpty &&
        regNohController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        sizeController.text.isNotEmpty &&
        isDateSelected.value == true;
  }

  void getVanrego(VanRegoData data) {
    vanNoController.text = data.vanNumber!;
    regNohController.text = data.regoNumber!;
    nameController.text = data.company!;
    sizeController.text = data.size!;
    selectedDate.value = getFormatedStringToDate(data.regoExpiry!);
    isDateSelected.value = true;

    // note.text = data.note!;
    // address.text = data.address!;
    // weekDay.value = data.weekdays!;
  }

  clearValues() {
    // nameCont.clear();
    // note.clear();
    // address.clear();
    // weekDay.value = [];
  }
  editConvert(dateTime) {
    DateTime now = DateTime.parse(dateTime);
    var formatter = DateFormat('yyyy-MM-dd');
    var formatted = formatter.format(now);

    return formatted;
  }

  getFormatedStringToDate(String date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(date);

    return inputDate;
  }

  String formatDateTimeToISO8601(DateTime dateTime) {
    final formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    final formattedDate = formatter.format(dateTime.toUtc());

    return formattedDate;
  }
}
