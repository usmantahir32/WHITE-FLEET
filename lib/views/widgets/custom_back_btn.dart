import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:whitefleet/utils/size_config.dart';

class CustomBackBtn extends StatelessWidget {
  const CustomBackBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Get.back(),
      icon: Icon(
        FeatherIcons.arrowLeft,
        color: Colors.black,
        size: SizeConfig.imageSizeMultiplier * 8,
      ),
    );
  }
}
