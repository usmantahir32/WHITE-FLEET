import 'package:get/get.dart';
import 'dart:convert';
import 'package:whitefleet/constants/api.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/models/driver_ids.dart';
import 'package:whitefleet/services/api.dart';
import 'package:whitefleet/views/widgets/custom_snackbar.dart';

class DriverIdsCont extends GetxController {
  Rxn<DriverIDsModel> driverIDs = Rxn<DriverIDsModel>();
  DriverIDsModel? get getDriverIDs => driverIDs.value;

  Rxn<List<DriverIdsData>> availDriverIDs = Rxn<List<DriverIdsData>>();
  List<DriverIdsData>? get getAvailDriverIDs => availDriverIDs.value;
  Rxn<List<DriverIdsData>> unAvailDriverIDs = Rxn<List<DriverIdsData>>();
  List<DriverIdsData>? get getUnAvailDriverIDs => unAvailDriverIDs.value;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () => _getDriverIds());
  }

  //GET DRIVER IDS
  Future<void> _getDriverIds() async {
    try {
      final response = await ApiService.post(
          '${ApiConstants.endpoint}/inventory/driverid/search', {
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
          availDriverIDs.value = [];
          unAvailDriverIDs.value = [];
          final jsonData = jsonDecode(response.body);
          driverIDs.value = DriverIDsModel.fromJson(jsonData);
          getDriverIDs!.data!.forEach((element) {
            if (element.driverId != null) {
              unAvailDriverIDs.value!.add(element);
            } else {
              availDriverIDs.value!.add(element);
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

  //DELETE DRIVER ID
  Future<void> deleteDriverID(String id) async {
    try {
      authCont.isLoading.value = true;
      final response = await ApiService.delete(
          '${ApiConstants.endpoint}/inventory/wave/driverid/$id', null);
      if (response != null) {
        if (response.statusCode == 200) {
          //GET IDS INDEX
          int index = 0;
          final data = driverIDs.value!.data!;
          for (int i = 0; i < data.length; i++) {
            if (data[i].id == id) {
              index = i;
              break;
            }
          }
          //DELETING IN REAL TIME LIST
          driverIDs.value!.data!.removeAt(index);
          driverIDs.refresh();

          Get.back();
          CustomSnackbar.showCustomSnackbar(false, 'Id deleted!');
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
