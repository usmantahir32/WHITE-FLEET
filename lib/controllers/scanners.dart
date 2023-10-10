import 'dart:convert';
import 'package:get/get.dart';
import 'package:whitefleet/constants/api.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/models/scanner.dart';
import 'package:whitefleet/services/api.dart';
import 'package:whitefleet/views/widgets/custom_snackbar.dart';

class ScannersCont extends GetxController {
  Rxn<ScannerModel> scanners = Rxn<ScannerModel>();
  ScannerModel? get getScanner => scanners.value;
  //FOR ASSIGN SCANNER ID
 Rxn<List<ScannerData>> availScannerIDs = Rxn<List<ScannerData>>();
  List<ScannerData>? get getAvailScannerIDs => availScannerIDs.value;
  Rxn<List<ScannerData>> unAvailScannerIDs = Rxn<List<ScannerData>>();
  List<ScannerData>? get getUnAvailScannerIDs => unAvailScannerIDs.value;
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () => _getScanners());
  }

  //GET SCANNERS
  Future<void> _getScanners() async {
    try {
      final response = await ApiService.post(
          '${ApiConstants.endpoint}/inventory/scanner/search', {
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
          unAvailScannerIDs.value=[];
          availScannerIDs.value=[];
          final jsonData = jsonDecode(response.body);
          scanners.value = ScannerModel.fromJson(jsonData);
          scanners.value!.data!.forEach((element) { 
            if(element.driverId!=null){
              unAvailScannerIDs.value!.add(element);
            }else{
              availScannerIDs.value!.add(element);
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

  //DELETE SCANNER
  Future<void> deleteScanner(String id) async {
    try {
      authCont.isLoading.value = true;
      final response = await ApiService.delete(
          '${ApiConstants.endpoint}/inventory/scanner/delete/$id', null);
      if (response != null) {
        if (response.statusCode == 200) {
          //GET SCANNER INDEX
          int index = 0;
          final data = scanners.value!.data!;
          for (int i = 0; i < data.length; i++) {
            if (data[i].id == id) {
              index = i;
              break;
            }
          }
          //DELETING IN REAL TIME LIST
          scanners.value!.data!.removeAt(index);
          scanners.refresh();
          authCont.isLoading.value = false;
          Get.back();
          CustomSnackbar.showCustomSnackbar(false, 'Scanner deleted!');
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
