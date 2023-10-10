import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/api.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/controllers/scanners.dart';
import 'package:whitefleet/models/scanner.dart';
import 'package:whitefleet/services/api.dart';
import 'package:whitefleet/views/widgets/custom_snackbar.dart';

class AddScannerCont extends GetxController {
  final scannerCont = Get.find<ScannersCont>();
  //TEXTEDITING CONTS
  TextEditingController serialNumber = TextEditingController();
  TextEditingController make = TextEditingController();
  TextEditingController model = TextEditingController();

  //ADD SCANNER
  Future<void> addScanner() async {
    try {
      authCont.isLoading.value = true;
      if (_validator()) {
        final response = await ApiService.post(
            '${ApiConstants.endpoint}/inventory/scanner/create', {
          "serialNumber": serialNumber.text,
          "make": make.text,
          "model": model.text
        });
        if (response != null) {
          if (response.statusCode == 200) {
            Get.back();
            final body = jsonDecode(response.body);
            print(body);
            String scannerID = body["data"];
            print(scannerID);
            //ADDING IN REAL TIME LIST
            scannerCont.scanners.value!.data!.add(ScannerData(
                id: scannerID,
                serialNumber: serialNumber.text,
                make: make.text,
                model: model.text));
            scannerCont.scanners.refresh();
            clearValues();
            CustomSnackbar.showCustomSnackbar(false, 'Scanner added!');
          } else {
            CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
          }
        } else {
          CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
        }
      } else {
        CustomSnackbar.showCustomSnackbar(true, 'Please provide all information');
      }
      authCont.isLoading.value = false;
    } catch (e) {
      authCont.isLoading.value = false;
      print(e);
    }
  }

  //EDIT SCANNER
  Future<void> editScanner(String id) async {
    try {
      authCont.isLoading.value = true;
      if (_validator()) {
        final response = await ApiService.put(
            '${ApiConstants.endpoint}/inventory/scanner/edit', {
          "id": id,
          "serialNumber": serialNumber.text,
          "make": make.text,
          "model": model.text
        });
        if (response != null) {

          if (response.statusCode == 200) {
            Get.back();
            //GET SCANNER INDEX
            int index = 0;
            final data = scannerCont.scanners.value!.data!;
            for (int i = 0; i < data.length; i++) {
              if (data[i].id == id) {
                index = i;
                break;
              }
            }
            //UPDATE IN REAL TIME LIST
            scannerCont.scanners.value!.data![index] = ScannerData(
                id: id,
                serialNumber: serialNumber.text,
                make: make.text,
                model: model.text);
            scannerCont.scanners.refresh();
            CustomSnackbar.showCustomSnackbar(false, 'Scanner updated!');
          } else {
            CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
          }
        } else {
          CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
        }
      } else {
        CustomSnackbar.showCustomSnackbar(true, 'Please provide all information');
      }
      authCont.isLoading.value = false;
    } catch (e) {
      authCont.isLoading.value = false;
      print(e);
    }
  }

  //SET SCANNER DATA IN THE ADD FORM
  void getScanner(ScannerData data) {
    serialNumber.text = data.serialNumber!;
    make.text = data.make!;
    model.text = data.model!;
  }

  bool _validator() {
    return serialNumber.text.isNotEmpty &&
        make.text.isNotEmpty &&
        model.text.isNotEmpty;
  }

  clearValues() {
    serialNumber.clear();
    make.clear();
    model.clear();
  }

  disposeValues() {
    serialNumber.dispose();
    make.dispose();
    model.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    disposeValues();
  }
}
