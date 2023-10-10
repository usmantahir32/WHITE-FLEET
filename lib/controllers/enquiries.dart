import 'dart:convert';

import 'package:get/get.dart';
import 'package:whitefleet/constants/api.dart';
import 'package:whitefleet/services/api.dart';
import 'package:whitefleet/views/widgets/custom_snackbar.dart';

import '../models/enquiries.dart';

class EnquiriesCont extends GetxController {
  Rxn<EnquiriesModel> allEnquiries = Rxn<EnquiriesModel>();
  EnquiriesModel? get getAllEnquiries => allEnquiries.value;

  Future<void> _getEnquiries() async {
    try {
      final response = await ApiService.get(
          '${ApiConstants.endpoint}enquiry/enquiries/all');
      if (response != null) {
        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          allEnquiries.value = EnquiriesModel.fromJson(jsonData);
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
    Future.delayed(Duration.zero,()=>_getEnquiries());
  }
}
