import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/api.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/controllers/bay.dart';
import 'package:whitefleet/models/bay.dart';
import 'package:whitefleet/services/api.dart';
import 'package:whitefleet/views/widgets/custom_snackbar.dart';

class AddBayCont extends GetxController {
  final bayCont = Get.find<BayCont>();
  //TEXTEDITING CONTS
  TextEditingController nameCont = TextEditingController();
  //ADD BAY
  Future<void> addBay() async {
    try {
      authCont.isLoading.value = true;
      if (_validator()) {
        final response = await ApiService.post(
            '${ApiConstants.endpoint}/inventory/bay/create', {
          "name": nameCont.text,
        });
        if (response != null) {
          if (response.statusCode == 200) {
            Get.back();
            final body = jsonDecode(response.body);
            print(body);
            String bayID = body["data"];
            print(bayID);
            //ADDING IN REAL TIME LIST
            bayCont.bays.value!.data!.add(BayData(
              id: bayID,
              name: nameCont.text,
            ));
            bayCont.bays.refresh();
            clearValues();
            CustomSnackbar.showCustomSnackbar(false, 'Bay added!');
          } else {
            CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
          }
        } else {
          CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
        }
      } else {
        CustomSnackbar.showCustomSnackbar(true, 'Please enter name');
      }
      authCont.isLoading.value = false;
    } catch (e) {
      authCont.isLoading.value = false;
      print(e);
    }
  }

  //EDIT BAY
  Future<void> editBay(String id) async {
    try {
      authCont.isLoading.value = true;
      if (_validator()) {
        final response = await ApiService.post(
            '${ApiConstants.endpoint}/inventory/bay/edit', {
          "id": id,
          "name": nameCont.text,
        });
        if (response != null) {
          if (response.statusCode == 200) {
            Get.back();
            //GET BAY INDEX
            int index = 0;
            final data = bayCont.bays.value!.data!;
            for (int i = 0; i < data.length; i++) {
              if (data[i].id == id) {
                index = i;
                break;
              }
            }
            //UPDATE IN REAL TIME LIST
            bayCont.bays.value!.data![index] =
                BayData(id: id, name: nameCont.text);
            bayCont.bays.refresh();
            CustomSnackbar.showCustomSnackbar(false, 'Bay updated!');
          } else {
            CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
          }
        } else {
          CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
        }
      } else {
        CustomSnackbar.showCustomSnackbar(true, 'Please enter name');
      }
      authCont.isLoading.value = false;
    } catch (e) {
      authCont.isLoading.value = false;
      print(e);
    }
  }

  //SET BAY DATA IN THE ADD FORM
  void getBay(BayData data) {
    nameCont.text = data.name!;
  }

  bool _validator() {
    return nameCont.text.isNotEmpty;
  }

  clearValues() {
    nameCont.clear();
  }

  disposeValues() {
    nameCont.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    disposeValues();
  }
}
