import 'dart:convert';

import 'package:get/get.dart';
import 'package:whitefleet/services/api.dart';
import 'package:whitefleet/views/widgets/custom_snackbar.dart';

import '../models/enquiries.dart';
import '../models/driver_enquiry.dart';

class DriverEnquiryCont extends GetxController {
  Rxn<DriverEnquiryModel> driverEnquiry= Rxn<DriverEnquiryModel>();
  DriverEnquiryModel? get getDriverEnquiries => driverEnquiry.value;

  Future<void> _getDrivers() async {
    try {
      final response = await ApiService.get(
          'http://whitefleet-test.azurewebsites.net/api/v1/enquiry/enquiries/all');
      if (response != null) {
        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          driverEnquiry.value = DriverEnquiryModel.fromJson(jsonData);
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
