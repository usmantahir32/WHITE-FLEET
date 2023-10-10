import 'dart:convert';

import 'package:get/get.dart';

import '../constants/api.dart';
import '../constants/cont.dart';
import '../models/vanrego.dart';
import '../services/api.dart';
import '../views/widgets/custom_snackbar.dart';

class VanRegoCont extends GetxController {
  Rxn<VanRegoModel> venrego = Rxn<VanRegoModel>();
  VanRegoModel? get getVanrego => venrego.value;

  Rxn<List<VanRegoData>> availVans = Rxn<List<VanRegoData>>();
  List<VanRegoData>? get getAvailVans => availVans.value;
  Rxn<List<VanRegoData>> unAvailVans = Rxn<List<VanRegoData>>();
  List<VanRegoData>? get getUnAvailVans => unAvailVans.value;
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () => _getVanRego());
  }

  //GET Van Rego
  Future<void> _getVanRego() async {
    try {
      final response = await ApiService.post(
          '${ApiConstants.endpoint}/inventory/vanrego/search', {
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
          availVans.value=[];
          unAvailVans.value=[];
          final jsonData = jsonDecode(response.body);
          venrego.value = VanRegoModel.fromJson(jsonData);
          venrego.value!.data!.forEach((element) {
             if(element.driverId!=null){
              unAvailVans.value!.add(element);
            }else{
              availVans.value!.add(element);
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

  //DELETE Van Rego
  Future<void> deleteRego(String id) async {
    try {
      authCont.isLoading.value = true;
      final response = await ApiService.post(
          '${ApiConstants.endpoint}/inventory/vanrego/delete/$id', null);
      if (response != null) {
        if (response.statusCode == 200) {
          //GET DEPPO INDEX
          int index = 0;
          final data = venrego.value!.data!;
          for (int i = 0; i < data.length; i++) {
            if (data[i].id == id) {
              index = i;
              break;
            }
          }
          //DELETING IN REAL TIME LIST
          venrego.value!.data!.removeAt(index);
          venrego.refresh();
          Get.back();
          CustomSnackbar.showCustomSnackbar(false, 'Van Rego deleted!');
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
