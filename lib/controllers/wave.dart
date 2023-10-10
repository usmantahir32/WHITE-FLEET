import 'package:get/get.dart';
import 'dart:convert';
import 'package:whitefleet/constants/api.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/models/wave.dart';
import 'package:whitefleet/services/api.dart';
import 'package:whitefleet/views/widgets/custom_snackbar.dart';

class WaveCont extends GetxController {
  Rxn<WaveModel> waves = Rxn<WaveModel>();
  WaveModel? get getWave => waves.value;

  //FOR ASSIGN TO DRIVER
  Rxn<List<WaveData>> availWaves = Rxn<List<WaveData>>();
  List<WaveData>? get getAvailWaves => availWaves.value;
  Rxn<List<WaveData>> unAvailWaves = Rxn<List<WaveData>>();
  List<WaveData>? get getUnAvailWaves => unAvailWaves.value;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () => _getWaves());
  }

  //GET WAVES
  Future<void> _getWaves() async {
    try {
      final response = await ApiService.post(
          '${ApiConstants.endpoint}/inventory/wave/search', {
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
          waves.value = WaveModel.fromJson(jsonData);
          availWaves.value = [];
          unAvailWaves.value = [];
          waves.value!.data!.forEach((element) {
            if (element.driverId == null) {
              availWaves.value!.add(element);
            } else {
              unAvailWaves.value!.add(element);
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

  //DELETE WAVE
  Future<void> deleteWave(String id) async {
    try {
      authCont.isLoading.value = true;
      final response = await ApiService.post(
          '${ApiConstants.endpoint}/inventory/wave/delete/$id', null);
      if (response != null) {
        if (response.statusCode == 200) {
          //GET WAVE INDEX
          int index = 0;
          final data = waves.value!.data!;
          for (int i = 0; i < data.length; i++) {
            if (data[i].id == id) {
              index = i;
              break;
            }
          }
          //DELETING IN REAL TIME LIST
          waves.value!.data!.removeAt(index);
          waves.refresh();
          Get.back();
          CustomSnackbar.showCustomSnackbar(false, 'Wave deleted!');
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
