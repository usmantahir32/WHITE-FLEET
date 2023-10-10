import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:get/get.dart';

showSnackbar(bool isError, String text) {
  return AnimatedSnackBar.material(text,
          type: isError
              ? AnimatedSnackBarType.error
              : AnimatedSnackBarType.success)
      .show(Get.overlayContext!);
}
