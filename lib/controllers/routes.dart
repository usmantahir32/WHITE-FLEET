import 'package:get/get.dart';
import 'dart:convert';
import 'package:whitefleet/constants/api.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/models/bay.dart';
import 'package:whitefleet/models/routes.dart';
import 'package:whitefleet/services/api.dart';
import 'package:whitefleet/views/widgets/custom_snackbar.dart';

class RoutesCont extends GetxController {
  Rxn<RouteModel> routes = Rxn<RouteModel>();
  RouteModel? get getRoutes => routes.value;
  Rxn<RouteData> selectedRoute = Rxn<RouteData>();
  //FOR ASSIGN
  Rxn<List<RouteData>> availRoutes = Rxn<List<RouteData>>();
  List<RouteData>? get getAvailRoutes => availRoutes.value;
  Rxn<List<RouteData>> unAvailRoutes = Rxn<List<RouteData>>();
  List<RouteData>? get getUnAvailRoutes => unAvailRoutes.value;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () => _getRoutes());
  }

  //GET BAY
  Future<void> _getRoutes() async {
    try {
      final response = await ApiService.post(
          '${ApiConstants.endpoint}/inventory/routes/search', {
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
          availRoutes.value = [];
          unAvailRoutes.value = [];
          final jsonData = jsonDecode(response.body);
          routes.value = RouteModel.fromJson(jsonData);
          routes.value!.data!.forEach((element) {
            if (element.driverId == null) {
              availRoutes.value!.add(element);
            } else {
              unAvailRoutes.value!.add(element);
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

  //DELETE BAY
  Future<void> deleteRoute(String id) async {
    try {
      authCont.isLoading.value = true;
      final response = await ApiService.post(
          '${ApiConstants.endpoint}/inventory/route/delete/$id', null);
      if (response != null) {
        if (response.statusCode == 200) {
          //GET ROUTES INDEX
          int index = 0;
          final data = routes.value!.data!;
          for (int i = 0; i < data.length; i++) {
            if (data[i].id == id) {
              index = i;
              break;
            }
          }
          //DELETING IN REAL TIME LIST
          routes.value!.data!.removeAt(index);
          routes.refresh();

          Get.back();
          CustomSnackbar.showCustomSnackbar(false, 'Routes deleted!');
        } else {
          CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
        }
      } else {
        CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
      }
      authCont.isLoading.value = false;
    } catch (e) {
      print(e);
      authCont.isLoading.value = false;
    }
  }
}
