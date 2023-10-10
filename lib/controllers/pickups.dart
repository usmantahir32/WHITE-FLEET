import 'dart:convert';
import 'package:get/get.dart';
import 'package:whitefleet/constants/api.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/models/pickeups.dart';
import 'package:whitefleet/services/api.dart';
import 'package:whitefleet/views/widgets/custom_snackbar.dart';

class PickupsCont extends GetxController {
  //OBS VARABILES
  Rxn<PickupsModel> pickups = Rxn<PickupsModel>();
  PickupsModel? get getPickup => pickups.value;
  Rxn<PickupData> selectedPickup =Rxn<PickupData>();
  //AVAIL AND UNAVAIL PICKUPS
  Rxn<List<PickupData>> availPickups = Rxn<List<PickupData>>();
  List<PickupData>? get getAvailPickups =>availPickups.value;
  Rxn<List<PickupData>> unAvailPickups = Rxn<List<PickupData>>();
   List<PickupData>? get getUnAvailPickups =>unAvailPickups.value;

  //INIT
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () => _getPickups());
  }

  //GET PICKUPS
  Future<void> _getPickups() async {
    try {
      final response = await ApiService.post(
          '${ApiConstants.endpoint}/inventory/deppopickup/search', {
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
          final jsonData = jsonDecode(response.body);
          pickups.value = PickupsModel.fromJson(jsonData);
          availPickups.value=[];
          unAvailPickups.value=[];
          pickups.value!.data!.forEach((element) { 
            if(element.driverId==null){
              availPickups.value!.add(element);
            }else{
              unAvailPickups.value!.add(element);
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

  //DELETE PICKUPS
  Future<void> deletePickup(String id) async {
    try {
      authCont.isLoading.value = true;
      final response = await ApiService.post(
          '${ApiConstants.endpoint}/inventory/deppopickup/delete/$id', null);
      if (response != null) {
        if (response.statusCode == 200) {
          //GET DEPPO INDEX
          int index = 0;
          final data = pickups.value!.data!;
          for (int i = 0; i < data.length; i++) {
            if (data[i].id == id) {
              index = i;
              break;
            }
          }
          //DELETING IN REAL TIME LIST
          pickups.value!.data!.removeAt(index);
          pickups.refresh();
          Get.back();
          CustomSnackbar.showCustomSnackbar(false, 'Pickup deleted!');
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
