import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/api.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/controllers/pickups.dart';
import 'package:whitefleet/models/pickeups.dart';
import 'package:whitefleet/services/api.dart';
import 'package:whitefleet/views/widgets/custom_snackbar.dart';

class AddPickupCont extends GetxController {
  final pickeUpCont = Get.find<PickupsCont>();
  //TEXTEDITING CONTS
  TextEditingController nameCont = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController address = TextEditingController();

  RxList weekDay = [].obs;
  //ADD PICKUP
  Future<void> addPickup() async {
    try {
      authCont.isLoading.value = true;
      if (_validator()) {
        final response = await ApiService.post(
            '${ApiConstants.endpoint}/inventory/deppopickup/create', {
          "name": nameCont.text,
          "note": note.text,
          "address": address.text,
          "weekdays": weekDay
        });
        if (response != null) {
          if (response.statusCode == 200) {
            Get.back();
            final body = jsonDecode(response.body);
            print(body);
            String pickupID = body["data"];
            print(pickupID);
            //ADDING IN REAL TIME LIST
            pickeUpCont.pickups.value!.data!.add(PickupData(
              id: pickupID,
              name: nameCont.text,
              address: address.text,
              note: note.text,
              weekdays: weekDay,
            ));
            pickeUpCont.pickups.refresh();
            clearValues();
            CustomSnackbar.showCustomSnackbar(false, 'Pickup added!');
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

  //EDIT BAY
  Future<void> editPickup(String id) async {
    try {
      authCont.isLoading.value = true;
      if (_validator()) {
        final response = await ApiService.post(
            '${ApiConstants.endpoint}/inventory/deppopickup/edit', {
          "id": id,
          "name": nameCont.text,
          "note": note.text,
          "address": address.text,
          "weekdays": weekDay
        });
        if (response != null) {
          if (response.statusCode == 200) {
            Get.back();
            //GET PICKUP INDEX
            int index = 0;
            final data = pickeUpCont.pickups.value!.data!;
            for (int i = 0; i < data.length; i++) {
              if (data[i].id == id) {
                index = i;
                break;
              }
            }
            //UPDATE IN REAL TIME LIST
            pickeUpCont.pickups.value!.data![index] = PickupData(
              id: id,
              name: nameCont.text,
              address: address.text,
              note: note.text,
              weekdays: weekDay,
            );
            pickeUpCont.pickups.refresh();
            CustomSnackbar.showCustomSnackbar(false, 'Pickup updated!');
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

  //SET PICKUP DATA IN THE ADD FORM
  void getPickups(PickupData data) {
    nameCont.text = data.name!;
    note.text = data.note!;
    address.text = data.address!;
    weekDay.value = data.weekdays!;
  }

  bool _validator() {
    return nameCont.text.isNotEmpty &&
        note.text.isNotEmpty &&
        address.text.isNotEmpty &&
        weekDay.isNotEmpty;
  }

  clearValues() {
    nameCont.clear();
    note.clear();
    address.clear();
    weekDay.value = [];
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
