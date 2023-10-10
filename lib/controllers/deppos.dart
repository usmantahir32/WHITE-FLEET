import 'dart:convert';

import 'package:get/get.dart';
import 'package:whitefleet/constants/api.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/models/deppos.dart';
import 'package:whitefleet/services/api.dart';
import 'package:whitefleet/views/widgets/custom_snackbar.dart';

class DepposCont extends GetxController {
  //OBS VARABILES
  Rxn<DepposModel> deppos = Rxn<DepposModel>();
  DepposModel? get getDeppo => deppos.value;
  Rxn<DeppoData> selectedDeppo  = Rxn<DeppoData>();
  //AVAIL OR UNAVAIL DEPPOS
  Rxn<List<DeppoData>> availDeppos = Rxn<List<DeppoData>>();
  List<DeppoData>? get getAvailDeppos =>availDeppos.value;
  Rxn<List<DeppoData>> unavailDeppos = Rxn<List<DeppoData>>();
    List<DeppoData>? get getUnAvailDeppos =>unavailDeppos.value;

  //INIT
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () => _getDeppos());
  }

  //GET DEPPOS
  Future<void> _getDeppos() async {
    try {
      final response = await ApiService.post(
          '${ApiConstants.endpoint}/inventory/deppo/search', {
        "advancedSearch": {
          "fields": [""],
          "keyword": ""
        },
        "keyword": "",
        "pageNumber": 0,
        "pageSize": 100,
        "orderBy": [""]
      });
      if (response != null) {
        if (response.statusCode == 200) {
          availDeppos.value = [];
          unavailDeppos.value = [];
          final jsonData = jsonDecode(response.body);
          deppos.value = DepposModel.fromJson(jsonData);
          deppos.value!.data!.forEach((element) {
            if (element.driverId == null) {
              availDeppos.value!.add(element);
            } else {
              unavailDeppos.value!.add(element);
            }
          });
        } else {
          CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
        }
      } else {
        CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
      }
    } catch (e) {
      print(e);
    }
  }

  //DELETE DEPPO
  Future<void> deleteDeppo(String id) async {
    try {
      authCont.isLoading.value = true;
      final response = await ApiService.post(
          '${ApiConstants.endpoint}/inventory/deppo/delete/$id', null);
      if (response != null) {
        if (response.statusCode == 200) {
          //GET DEPPO INDEX
          int index = 0;
          final data = deppos.value!.data!;
          for (int i = 0; i < data.length; i++) {
            if (data[i].id == id) {
              index = i;
              break;
            }
          }
          //DELETING IN REAL TIME LIST
          deppos.value!.data!.removeAt(index);
          deppos.refresh();
          Get.back();
          CustomSnackbar.showCustomSnackbar(false, 'Deppo deleted!');
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
