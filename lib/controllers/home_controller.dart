import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whitefleet/views/bottom%20sheets/image_bottomsheet.dart';

class HomeController extends GetxController {
  RxString currentSelectedTaskType = "".obs;
  final taskTypes = ["aaa", "bbb", "ccc"];
  RxString currentSelectedTaskName = "".obs;
  final taskName = ["aaa", "bbb", "ccc"];
  RxString currentSelectedAssignTo = "".obs;
  final assignTo = ["aaa", "bbb", "ccc"];

  RxInt selectedDay = (-1).obs;

  void selectingImages(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      Get.back();
      Get.bottomSheet(
          ImageBotttomSheet(
            picture: pickedImage,
          ),
          isScrollControlled: true);
      // cont.uploadMessageImages.add(pickedImage.path);
    }
  }
}
