import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/api.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/controllers/deppos.dart';
import 'package:whitefleet/models/deppos.dart';
import 'package:whitefleet/services/api.dart';
import 'package:whitefleet/views/widgets/custom_snackbar.dart';

class AddDeppoCont extends GetxController {
  final depposCont = Get.find<DepposCont>();
  //TEXTEDITING CONTS
  TextEditingController nameCont = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController address = TextEditingController();

  RxList weekDay = [].obs;
//ADD DEPPO
  Future<void> addDeppo() async {
    try {
      authCont.isLoading.value = true;
      if (_validator()) {
        print(weekDay);
        final response = await ApiService.post(
            '${ApiConstants.endpoint}/inventory/deppo/create', {
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
            String deppoID = body["data"];
            print(deppoID);
            //ADDING IN REAL TIME LIST
            depposCont.deppos.value!.data!.add(DeppoData(
              id: deppoID,
              name: nameCont.text,
              address: address.text,
              note: note.text,
              weekdays: weekDay,

              ///// Add Fielsd
            ));
            depposCont.deppos.refresh();
            clearValues();
            CustomSnackbar.showCustomSnackbar(false, 'Deppo added!');
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
  Future<void> editDeppo(String id) async {
    try {
      authCont.isLoading.value = true;
      if (_validator()) {
        final response = await ApiService.post(
            '${ApiConstants.endpoint}/inventory/deppo/edit', {
          "id": id,
          "name": nameCont.text,
          "note": note.text,
          "address": address.text,
          "weekdays": weekDay
        });
        if (response != null) {
          if (response.statusCode == 200) {
            Get.back();
            //GET SCHOOL INDEX
            int index = 0;
            final data = depposCont.deppos.value!.data!;
            for (int i = 0; i < data.length; i++) {
              if (data[i].id == id) {
                index = i;
                break;
              }
            }
            //UPDATE IN REAL TIME LIST
            depposCont.deppos.value!.data![index] = DeppoData(
              id: id,
              name: nameCont.text,
              address: address.text,
              note: note.text,
              weekdays: weekDay,
            );
            depposCont.deppos.refresh();
            clearValues();
            CustomSnackbar.showCustomSnackbar(false, 'Deppo updated!');
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

  //SET DEPPO DATA IN THE ADD FORM
  void getDeppos(DeppoData data) {
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
    note.dispose();
    address.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    disposeValues();
  }
}
