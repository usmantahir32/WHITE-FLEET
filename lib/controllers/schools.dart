import 'dart:convert';
import 'package:get/get.dart';
import 'package:whitefleet/constants/api.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/models/schools.dart';
import 'package:whitefleet/services/api.dart';
import 'package:whitefleet/views/widgets/custom_snackbar.dart';

class SchoolsCont extends GetxController {
  Rxn<SchoolsModel> schools = Rxn<SchoolsModel>();
  SchoolsModel? get getSchool => schools.value;
  Rxn<SchoolsData> selectedSchool =Rxn<SchoolsData>();
  //AVAIL AND UNAVAIL SCHOOLS
  Rxn<List<SchoolsData>> availSchools = Rxn<List<SchoolsData>>();
  List<SchoolsData>? get getAvailSchools =>availSchools.value;
  Rxn<List<SchoolsData>> unAvailSchools = Rxn<List<SchoolsData>>();
    List<SchoolsData>? get getUnAvailSchools =>unAvailSchools.value;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () => _getSchools());
  }

  //GET SCHOOLS
  Future<void> _getSchools() async {
    try {
      final response = await ApiService.post(
          '${ApiConstants.endpoint}/inventory/school/search', {
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
          schools.value = SchoolsModel.fromJson(jsonData);
          availSchools.value=[];
          unAvailSchools.value=[];
          schools.value!.data!.forEach((element) { 
            if(element.driverId==null){
              availSchools.value!.add(element);
            }else{
              unAvailSchools.value!.add(element);
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

  //DELETE SCHOOLS
  Future<void> deleteSchool(String id) async {
    try {
      authCont.isLoading.value = true;
      final response = await ApiService.post(
          '${ApiConstants.endpoint}/inventory/school/delete/$id', null);
      if (response != null) {
        if (response.statusCode == 200) {
          //GET SCHOOL INDEX
          int index = 0;
          final data = schools.value!.data!;
          for (int i = 0; i < data.length; i++) {
            if (data[i].id == id) {
              index = i;
              break;
            }
          }
          //DELETING IN REAL TIME LIST
          schools.value!.data!.removeAt(index);
          schools.refresh();
          Get.back();
          CustomSnackbar.showCustomSnackbar(false, 'School deleted!');
        } else {
          CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
        }
      } else {
        CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
      }
      authCont.isLoading.value = false;
    } catch (e) {}
  }
}
