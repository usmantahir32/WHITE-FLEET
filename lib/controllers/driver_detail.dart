import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whitefleet/constants/api.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/constants/local_db.dart';
import 'package:whitefleet/constants/snackbar.dart';
import 'package:whitefleet/models/bay.dart';
import 'package:whitefleet/models/deppos.dart';
import 'package:whitefleet/models/driver_config_data.dart';
import 'package:whitefleet/models/driver_details.dart';
import 'package:whitefleet/models/driver_ids.dart';
import 'package:whitefleet/models/driver_invoice.dart';
import 'package:whitefleet/models/pickeups.dart';
import 'package:whitefleet/models/routes.dart';
import 'package:whitefleet/models/scanner.dart';
import 'package:whitefleet/models/schools.dart';
import 'package:whitefleet/models/vanrego.dart';
import 'package:whitefleet/models/wave.dart';
import 'package:whitefleet/services/api.dart';
import 'package:whitefleet/views/widgets/custom_snackbar.dart';

class DriverDetailCont extends GetxController {
  RxString driverConfigID = ''.obs;
  final rentType = ["Per Day", "Per Week", "Per Month", "Per Year"];
  RxBool isShowMore = false.obs;
  late DriverInvoiceConfigDataModel configData;
  Rxn<DriverDetailModel> _drivers = Rxn<DriverDetailModel>();
  DriverDetailModel? get driverDetail => _drivers.value;
  RxBool isLoading = false.obs;
  //FOR ASSIGN DRIVER ID
  Rxn<DriverIdsData> selectedDriverID = Rxn<DriverIdsData>();
  Rxn<ScannerData> selectedScannerID = Rxn<ScannerData>();
  Rxn<List<BayData>> selectedBays = Rxn<List<BayData>>();
  Rxn<List<WaveData>> selectedWaves = Rxn<List<WaveData>>();
  //ASSIGNING VEHICLES
  Rxn<VanRegoData> selectedVehicle = Rxn<VanRegoData>();
  TextEditingController vehiclePriceCont = TextEditingController();
  RxString selectedRentType = "".obs;
  //FOR DRIVER INVOICE
  Rxn<DriverInvoiceModel> _driverInvoice = Rxn<DriverInvoiceModel>();
  Rxn<List<DriverInvoiceData>> parcelInvoiceData =
      Rxn<List<DriverInvoiceData>>();
  Rxn<List<DriverInvoiceData>> schoolInvoiceData =
      Rxn<List<DriverInvoiceData>>();
  Rxn<List<DriverInvoiceData>> deppoInvoiceData =
      Rxn<List<DriverInvoiceData>>();
  Rxn<List<DriverInvoiceData>> pickupsInvoiceData =
      Rxn<List<DriverInvoiceData>>();

  //FOR ADD INVOICE
  Rxn<DeppoData> selectedInvoiceDeppo = Rxn<DeppoData>();
  TextEditingController deppoInvoicePriceCont = TextEditingController();
  Rxn<SchoolsData> selectedInvoiceSchool = Rxn<SchoolsData>();
  TextEditingController schoolInvoicePriceCont = TextEditingController();
  Rxn<RouteData> selectedInvoiceRoute = Rxn<RouteData>();
  TextEditingController routeInvoicePriceCont = TextEditingController();
  Rxn<PickupData> selectedInvoicePickup = Rxn<PickupData>();
  TextEditingController pickupInvoicePriceCont = TextEditingController();
  RxString selectedInvoiceSchoolRunType = ''.obs;
  RxString selectedInvoiceDeppoRunType = ''.obs;
  RxString selectedInvoiceRouteRunType = ''.obs;
  RxString selectedInvoicePickupRunType = ''.obs;

  Future<void> getDriverDetail(String driverID) async {
    try {
      selectedWaves.value = [];
      selectedBays.value = [];
      final response = await ApiService.get(
          'http://whitefleet-test.azurewebsites.net/api/identity/profile/$driverID');

      // print(response!.statusCode);
      //GET DRIVER CONFIG ID
      await getDriverConfigID(driverID);
      //GET DRIVER CONFIG DATA
      await getDriverConfig(driverID);

      if (response != null) {
        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);

          _drivers.value = DriverDetailModel.fromJson(jsonData);
          await getInvoiceConfigData();
          // await getDriverInvoiceData(driverID);
        } else {

          CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
        }
      } else {

        CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
      }
    } catch (e) {
      print(e.toString());
      CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
    }
  }

  //GET CONFIG ID
  getDriverConfigID(String driverId) async {
    final prefs = await SharedPreferences.getInstance();
    driverConfigID.value =
        await prefs.getString(LocalDbKeys.configId + '_' + driverId) ?? '';
  }

  //GET CONFIG DETAIL
  Future<void> getDriverConfig(String id) async {
    try {
      final response = await ApiService.get(
          '${ApiConstants.endpoint}/inventory/rate/driverconfiguration/$id');
      if (response != null) {
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          if (data != null) {
            final userDriverInfo = data['data']['userDriverInfo'];
            final driverConfigType = data['data']['driverConfigType'];
            final driverInvoiceData = data['driverRateConfiguration'];
            print(" $driverInvoiceData");

           if(userDriverInfo!=null){
             //GET SCANNER
            selectedScannerID.value = ScannerData(
                id: userDriverInfo['scannerId'],
                serialNumber: userDriverInfo['serialNumber']);
            //GET VEHICLE
            selectedVehicle.value = VanRegoData(
              id: userDriverInfo['vanRegoId'],
              vanNumber: userDriverInfo['vanNumber'],
            );
            //GET VEHICLE PRICE
            vehiclePriceCont.text = userDriverInfo['vehicleCharge'].toString();
            //GET VEHICLE RUN TYPE INFO
            selectedRentType.value = userDriverInfo['runType'];
           }
            if (driverConfigType != null) {
              driverConfigType.forEach((val) {
                if (val['bayname'] != null) {
                  //GET BAYS
                  selectedBays.value!
                      .add(BayData(id: val['bayId'], name: val['bayname']));
                } else {
                  //GET WAVES
                  selectedWaves.value!
                      .add(WaveData(id: val['waveId'], name: val['wavename']));
                }
              });
            }

            //GET DRIVER INVOICE DATA
           
            parcelInvoiceData.value = [];
            schoolInvoiceData.value = [];
            deppoInvoiceData.value = [];
            pickupsInvoiceData.value = [];
            if (driverInvoiceData != null) {
              _driverInvoice.value =
                  DriverInvoiceModel.fromJson(driverInvoiceData);
              
                _driverInvoice.value!.driverRateConfiguration!.forEach((element) {
              if (element.runType == 'Parcel') {
                parcelInvoiceData.value!.add(element);
              }
              if (element.runType == 'School') {
                schoolInvoiceData.value!.add(element);
              }
              if (element.runType == 'Deppo') {
                deppoInvoiceData.value!.add(element);
              }
              if (element.runType == 'Pickup') {
                pickupsInvoiceData.value!.add(element);
              }
            });
            }

            
          }
        }
      } else {

        CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
      }
    } catch (e) {
      print(e);
      CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
    }
  }

  //SET DRIVER CONFIG
  Future<void> setDriversConfigData(
    String driverID,
  ) async {
    try {
      authCont.isLoading.value = true;
      if (_configValidator()) {
        List<String> _bays = [];
        List<String> _waves = [];

        selectedBays.value!.forEach((element) => _bays.add(element.id!));
        selectedWaves.value!.forEach((element) => _waves.add(element.id!));

        final response = await ApiService.post(
            '${ApiConstants.endpoint}/inventory/rate/driver-config', {
          "id": driverID,
          "driverId": selectedDriverID.value!.id,
          "bayId": _bays,
          "waveId": _waves,
          "scannerId": selectedScannerID.value!.id,
          "vanId": selectedVehicle.value!.id,
          "vehicleCharge": vehiclePriceCont.text,
          "runType": selectedRentType.value,
        });
        //SAVE IN LOCAL DB
        if (response != null) {
          if (response.statusCode == 200) {
            final jsonData = jsonDecode(response.body);
            final prefs = await SharedPreferences.getInstance();

            prefs.setString(
                LocalDbKeys.configId + '_' + driverID, jsonData["data"]);
            driverConfigID.value = jsonData['data'];
            CustomSnackbar.showCustomSnackbar(false, 'Config updated');
          } else {
            CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
          }
        } else {
          CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
        }
      } else {
        CustomSnackbar.showCustomSnackbar(
            true, 'Please fill all inventory configuration to save');
      }
      authCont.isLoading.value = false;
    } catch (e) {
      authCont.isLoading.value = false;
      print(e.toString());
      CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
    }
  }

  bool _configValidator() {
    return selectedBays.value!.isNotEmpty &&
        selectedDriverID.value != null &&
        selectedScannerID.value != null &&
        selectedWaves.value!.isNotEmpty &&
        selectedVehicle.value != null &&
        vehiclePriceCont.text.isNotEmpty &&
        selectedRentType.value != '';
  }

  //GET CONFIG DATA
  Future<void> getInvoiceConfigData() async {
    try {
      final response = await ApiService.get(
          '${ApiConstants.endpoint}/inventory/rate/config');
      if (response != null) {
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          print(data);
          configData = DriverInvoiceConfigDataModel.fromJson(data);
        } else {
          CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
        }
      } else {
        CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
      }
    } catch (e) {
      print(e);
      CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
    }
  }

  //SET INVOICE TASK
  Future<void> addInvoiceTask(
      {required String configID,
      required String rateConfigId,
      required String runTypeID,
      required String runType,
      required String amount,
      required String relationID}) async {
    try {
      authCont.isLoading.value = true;

      final response = await ApiService.post(
          '${ApiConstants.endpoint}/inventory/rate/driver-config-type', {
        "driverConfigurationId": configID,
        "rateConfigId": rateConfigId,
        "runTypeId": runTypeID,
        "runType": runType,
        // "Amount": amount,
        "relationId": relationID
      });
      if (response != null) {
        if (response.statusCode == 200) {
          showSnackbar(false, 'Invoice added');
          Get.back();
        } else {
          showSnackbar(true, 'Something went wrong');
        }
      } else {
        showSnackbar(true, 'Something went wrong');
      }
      authCont.isLoading.value = false;
    } catch (e) {
      authCont.isLoading.value = false;
      print(e);
      showSnackbar(true, 'Something went wrong');
    }
  }

  // //GET DRIVER INVOICE DATA
  // Future<void> getDriverInvoiceData(String id) async {
  //   try {
  //     final response = await ApiService.get(
  //         '${ApiConstants.endpoint}/inventory/drivermap/globaldata/$id');
  //     if (response != null) {
  //       if (response.statusCode == 200) {
  //         final data = jsonDecode(response.body);

  //       } else {
  //         CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
  //       }
  //     } else {
  //       CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
  //     }
  //   } catch (e) {
  //     print('INVOICE $e');
  //     CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
  //   }
  // }
}
