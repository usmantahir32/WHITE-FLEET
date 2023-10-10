import 'dart:convert';

import 'package:get/get.dart';

import '../constants/api.dart';
import '../constants/cont.dart';
import '../services/api.dart';
import '../views/widgets/custom_snackbar.dart';

class OCRCont extends GetxController {
  Future<void> scanOCR(var bytesFile) async {
    try {
      authCont.isLoading.value = true;

      final response = await ApiService.post(
          '${ApiConstants.endpoint}/api/ocr', <String, String>{
        "file": bytesFile,
        // "note": note.text,
        // "address": address.text,
        // "weekdays": weekDay
      });
      print(response);
      if (response != null) {
        if (response.statusCode == 200) {
          Get.back();
          final body = jsonDecode(response.body);
          print(body);
        } else {
          CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
        }
      } else {
        CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
      }

      authCont.isLoading.value = false;
    } catch (e) {
      authCont.isLoading.value = false;
      print(e);
    }
  }
}
     // CustomSnackbar.showCustomSnackbar(false, 'Deppo added!');