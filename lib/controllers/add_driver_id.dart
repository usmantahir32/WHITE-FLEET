import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/api.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/controllers/driver_ids.dart';
import 'package:whitefleet/models/driver_ids.dart';
import 'package:whitefleet/services/api.dart';
import 'package:whitefleet/views/widgets/custom_snackbar.dart';

class AddDriverIDCont extends GetxController {
  final driverIdsCont = Get.find<DriverIdsCont>();
  //TEXTEDITING CONTS
  TextEditingController tempID = TextEditingController();
  //ADD DRIVER ID
  Future<void> addDriverID() async {
    try {
      authCont.isLoading.value = true;
      if (_validator()) {
        final response = await ApiService.post(
            '${ApiConstants.endpoint}/inventory/driverid/create', {
          "temparoryId": tempID.text,
        });
        if (response != null) {
          if (response.statusCode == 200) {
            Get.back();
            final body = jsonDecode(response.body);
            print(body);
            String driverID = body["data"];

            //ADDING IN REAL TIME LIST
            driverIdsCont.driverIDs.value!.data!.add(DriverIdsData(
              id: driverID,
              temparoryId: tempID.text,
            ));
            driverIdsCont.driverIDs.refresh();
            clearValues();
            CustomSnackbar.showCustomSnackbar(false, 'Driver id added!');
          } else {
            CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
          }
        } else {
          CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
        }
      } else {
        CustomSnackbar.showCustomSnackbar(true, 'Please enter driver id');
      }
      authCont.isLoading.value = false;
    } catch (e) {
      authCont.isLoading.value = false;
      print(e);
    }
  }

  //EDIT DRIVER ID
  Future<void> editDriverId(String id) async {
    try {
      authCont.isLoading.value = true;
      if (_validator()) {
        final response = await ApiService.post(
            '${ApiConstants.endpoint}/inventory/driverid/edit', {
          "id": id,
          "temparoryId": tempID.text,
        });
        if (response != null) {
          if (response.statusCode == 200) {
            Get.back();
            //GET PICKUP INDEX
            int index = 0;
            final data = driverIdsCont.driverIDs.value!.data!;
            for (int i = 0; i < data.length; i++) {
              if (data[i].id == id) {
                index = i;
                break;
              }
            }
            //UPDATE IN REAL TIME LIST
            driverIdsCont.driverIDs.value!.data![index] =
                DriverIdsData(id: id, temparoryId: tempID.text);
            driverIdsCont.driverIDs.refresh();
            CustomSnackbar.showCustomSnackbar(false, 'Driver id updated!');
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

  //SET DRIVER ID DATA IN THE ADD FORM
  void getDriverId(DriverIdsData data) {
    tempID.text = data.temparoryId!;
  }

  bool _validator() {
    return tempID.text.isNotEmpty;
  }

  clearValues() {
    tempID.clear();
  }

  disposeValues() {
    tempID.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    disposeValues();
  }
}
