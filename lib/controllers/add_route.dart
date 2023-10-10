import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/api.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/controllers/bay.dart';
import 'package:whitefleet/controllers/routes.dart';
import 'package:whitefleet/models/bay.dart';
import 'package:whitefleet/models/routes.dart';
import 'package:whitefleet/services/api.dart';
import 'package:whitefleet/views/widgets/custom_snackbar.dart';

class AddRouteCont extends GetxController {
  final routeCont = Get.find<RoutesCont>();
  //TEXTEDITING CONTS
  TextEditingController nameCont = TextEditingController();
  //ADD BAY
  Future<void> addRoute() async {
    try {
      authCont.isLoading.value = true;
      if (_validator()) {
        final response = await ApiService.post(
            '${ApiConstants.endpoint}/inventory/routes/create', {
          "name": nameCont.text,
        });
        if (response != null) {
          if (response.statusCode == 200) {
            Get.back();
            final body = jsonDecode(response.body);
            print(body);
            String routeID = body["data"];
            print(routeID);
            //ADDING IN REAL TIME LIST
            routeCont.routes.value!.data!.add(RouteData(
              id: routeID,
              name: nameCont.text,
            ));
            routeCont.routes.refresh();
            clearValues();
            CustomSnackbar.showCustomSnackbar(false, 'Route added!');
          } else {
            CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
          }
        } else {
          CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
        }
      } else {
        CustomSnackbar.showCustomSnackbar(true, 'Please enter name');
      }
      authCont.isLoading.value = false;
    } catch (e) {
      authCont.isLoading.value = false;
      print(e);
    }
  }

  //EDIT BAY
  Future<void> editRoute(String id) async {
    try {
      authCont.isLoading.value = true;
      if (_validator()) {
        final response = await ApiService.post(
            '${ApiConstants.endpoint}/inventory/routes/edit', {
          "id": id,
          "name": nameCont.text,
        });
        if (response != null) {
          if (response.statusCode == 200) {
            Get.back();
            //GET ROUTE INDEX
            int index = 0;
            final data = routeCont.routes.value!.data!;
            for (int i = 0; i < data.length; i++) {
              if (data[i].id == id) {
                index = i;
                break;
              }
            }
            //UPDATE IN REAL TIME LIST
            routeCont.routes.value!.data![index] =
                RouteData(id: id, name: nameCont.text);
            routeCont.routes.refresh();
            CustomSnackbar.showCustomSnackbar(false, 'Route updated!');
          } else {
            CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
          }
        } else {
          CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
        }
      } else {
        CustomSnackbar.showCustomSnackbar(true, 'Please enter name');
      }
      authCont.isLoading.value = false;
    } catch (e) {
      authCont.isLoading.value = false;
      print(e);
    }
  }

  //SET ROUTE DATA IN THE ADD FORM
  void getRoute(RouteData data) {
    nameCont.text = data.name!;
  }

  bool _validator() {
    return nameCont.text.isNotEmpty;
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
