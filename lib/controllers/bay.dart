import 'package:get/get.dart';
import 'dart:convert';
import 'package:whitefleet/constants/api.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/models/bay.dart';
import 'package:whitefleet/services/api.dart';
import 'package:whitefleet/views/widgets/custom_snackbar.dart';

class BayCont extends GetxController {
  Rxn<BayModel> bays = Rxn<BayModel>();
  BayModel? get getBay => bays.value;
  //FOR ASSIGN
  Rxn<List<BayData>> availBays = Rxn<List<BayData>>();
  List<BayData>? get getAvailBays => availBays.value;
  Rxn<List<BayData>> unAvailBays = Rxn<List<BayData>>();
  List<BayData>? get getUnAvailBays => unAvailBays.value;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () => _getBays());
  }

  //GET BAY
  Future<void> _getBays() async {
    try {
      final response = await ApiService.post(
          '${ApiConstants.endpoint}/inventory/bay/search', {
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
          availBays.value = [];
          unAvailBays.value = [];
          final jsonData = jsonDecode(response.body);
          bays.value = BayModel.fromJson(jsonData);
          bays.value!.data!.forEach((element) {
            if (element.driverID == null) {
              availBays.value!.add(element);
            } else {
              unAvailBays.value!.add(element);
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

  //DELETE BAY
  Future<void> deleteBay(String id) async {
    try {
      authCont.isLoading.value = true;
      final response = await ApiService.post(
          '${ApiConstants.endpoint}/inventory/bay/delete/$id', null);
      if (response != null) {
        if (response.statusCode == 200) {
          //GET BAYS INDEX
          int index = 0;
          final data = bays.value!.data!;
          for (int i = 0; i < data.length; i++) {
            if (data[i].id == id) {
              index = i;
              break;
            }
          }
          //DELETING IN REAL TIME LIST
          bays.value!.data!.removeAt(index);
          bays.refresh();

          Get.back();
          CustomSnackbar.showCustomSnackbar(false, 'Bay deleted!');
        } else {
          CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
        }
      } else {
        CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
      }
      authCont.isLoading.value = false;
    } catch (e) {
      authCont.isLoading.value = false;
    }
  }
}
