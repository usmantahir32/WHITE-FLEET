import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/api.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/controllers/wave.dart';
import 'package:whitefleet/models/wave.dart';
import 'package:whitefleet/services/api.dart';
import 'package:whitefleet/views/widgets/custom_snackbar.dart';

class AddWaveCont extends GetxController {
  final waveCont = Get.find<WaveCont>();

  TextEditingController nameCont = TextEditingController();
  Rxn<TimeOfDay> startTime = Rxn<TimeOfDay>();
  Rxn<TimeOfDay> endTime = Rxn<TimeOfDay>();

  //ADD WAVE
  Future<void> addWave() async {
    try {
      authCont.isLoading.value = true;

      if (_validator()) {
        final response = await ApiService.post(
            '${ApiConstants.endpoint}/inventory/wave/create', {
          "name": nameCont.text,
          "startTime": _addFormattedTime(startTime.value!),
          "endTime": _addFormattedTime(endTime.value!)
        });
        if (response != null) {
          if (response.statusCode == 200) {
            Get.back();
            final body = jsonDecode(response.body);
            print(body);
            String waveID = body["data"];

            //ADDING IN REAL TIME LIST
            waveCont.waves.value!.data!.add(WaveData(
                id: waveID,
                name: nameCont.text,
                startTime: _addFormattedTime(startTime.value!),
                endTime: _addFormattedTime(endTime.value!)));
            waveCont.waves.refresh();
            clearValues();
            CustomSnackbar.showCustomSnackbar(false, 'Wave added!');
          } else {
            CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
          }
        } else {
          CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
        }
      } else {
        CustomSnackbar.showCustomSnackbar(
            true, 'Please provide all information');
      }
      authCont.isLoading.value = false;
    } catch (e) {
      authCont.isLoading.value = false;
      print(e);
    }
  }

  //EDIT WAVE
  Future<void> editWave(String id) async {
    try {
      authCont.isLoading.value = true;
      if (_validator()) {
        final response = await ApiService.post(
            '${ApiConstants.endpoint}/inventory/wave/edit', {
          "id": id,
          "name": nameCont.text,
          "startTime": _addFormattedTime(startTime.value!),
          "endTime": _addFormattedTime(endTime.value!)
        });
        if (response != null) {
          if (response.statusCode == 200) {
            Get.back();
            //GET WAVE INDEX
            int index = 0;
            final data = waveCont.waves.value!.data!;
            for (int i = 0; i < data.length; i++) {
              if (data[i].id == id) {
                index = i;
                break;
              }
            }
            //UPDATE IN REAL TIME LIST
            waveCont.waves.value!.data![index] = WaveData(
                id: id,
                name: nameCont.text,
                startTime: _addFormattedTime(startTime.value!),
                endTime: _addFormattedTime(endTime.value!));
            waveCont.waves.refresh();
            CustomSnackbar.showCustomSnackbar(false, 'Wave updated!');
          } else {
            CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
          }
        } else {
          CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
        }
      } else {
        CustomSnackbar.showCustomSnackbar(
            true, 'Please provide all information');
      }
      authCont.isLoading.value = false;
    } catch (e) {
      authCont.isLoading.value = false;
      print(e);
    }
  }

  //SET WAVE DATA IN THE ADD FORM
  void getWave(WaveData data) {
    nameCont.text = data.name!;
    startTime.value = _showFormattedTime(data.startTime!);
    endTime.value = _showFormattedTime(data.endTime!);
  }

  bool _validator() {
    return nameCont.text.isNotEmpty &&
        startTime.value != null &&
        endTime.value != null;
  }

  String _addFormattedTime(TimeOfDay time) {
    String formattedTime =
        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00';
    return formattedTime;
  }

  TimeOfDay _showFormattedTime(String value) {
    // Parse the input string and extract hours and minutes
    List<String> parts = value.split(':');
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    TimeOfDay time = TimeOfDay(hour: hours, minute: minutes);
    return time;
  }

  clearValues() {
    nameCont.clear();
  }

  disposeValues() {
    nameCont.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    disposeValues();
  }
}
