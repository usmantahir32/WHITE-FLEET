import 'package:get/get.dart';

class DriverController extends GetxController {
  RxString selectedTaskType = "".obs;
  final taskTypes = ["aaa", "bbb", "ccc"];
  RxInt selectedDay = 0.obs;

  RxBool isShowMore = false.obs;

  //driver information
  RxString selectedIdType = "".obs;
  final idType = ["Permanent", "Temporary"];

  //scanner detail
  RxString selectedScanner = "".obs;
  final scanner = ["Applicable", "Not Applicable"];

  //vehicle information
  RxString selectedVehicleType = "".obs;
  final vehicleType = ["Other", "Rented"];

}
