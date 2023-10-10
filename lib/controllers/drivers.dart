import 'dart:convert';

import 'package:get/get.dart';
import 'package:whitefleet/constants/api.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/models/drivers.dart';
import 'package:whitefleet/services/api.dart';
import 'package:whitefleet/views/widgets/custom_snackbar.dart';

class DriversCont extends GetxController {
  Rxn<DriversModel> drivers = Rxn<DriversModel>();
  DriversModel? get getDrivers => drivers.value;

  Future<void> _getDrivers() async {
    try {
      final response = await ApiService.get(
          '${ApiConstants.endpoint}/inventory/supervisor/approvals/${authCont.userID}');
      if (response != null) {
        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          drivers.value = DriversModel.fromJson(jsonData);
        } else {
          CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
        }
      } else {
        CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
      }
    } catch (e) {
      CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
    }
  }


  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero,()=>_getDrivers());
  }
}
