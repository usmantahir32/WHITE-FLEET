import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/views/widgets/auth_button.dart';
import 'package:whitefleet/views/widgets/custom_textfield.dart';
import '../../../../utils/size_config.dart';

// ignore: must_be_immutable
class OCRBottomSheet extends StatelessWidget {
  final XFile picture;
  OCRBottomSheet({
    super.key,
    required this.picture,
  });

  TextEditingController expressPostController = TextEditingController();
  TextEditingController signItemController = TextEditingController();
  TextEditingController callForReturnController = TextEditingController();
  TextEditingController eParcelItemController = TextEditingController();
  TextEditingController eParcelSubsequentController = TextEditingController();
  TextEditingController unknownArticlesController = TextEditingController();
  TextEditingController bdmItemController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: SizeConfig.heightMultiplier * 87,
      width: SizeConfig.widthMultiplier * 100,
      padding: EdgeInsets.only(
          top: SizeConfig.heightMultiplier * 2,
          left: SizeConfig.widthMultiplier * 4,
          right: SizeConfig.widthMultiplier * 4),
      decoration: BoxDecoration(
        color: AppColors.whiteClr,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: SizeConfig.widthMultiplier * 40),
              Text(
                "OCR",
                style: textTheme.headlineMedium,
              ),
              const Spacer(),
              IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    FeatherIcons.xCircle,
                    size: SizeConfig.imageSizeMultiplier * 7,
                  ))
            ],
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: SizeConfig.heightMultiplier * 25,
              width: SizeConfig.widthMultiplier * 31,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                    image: FileImage(File(picture.path)), fit: BoxFit.contain),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _columnInfo(
                  textTheme, "EXPRESS POST", "express", expressPostController),
              _columnInfo(textTheme, "SIGN ITEMS", "sign", signItemController),
            ],
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _columnInfo(textTheme, "Call For Return", "return",
                  callForReturnController),
              _columnInfo(
                  textTheme, "E-Parcel Items", "items", eParcelItemController),
            ],
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _columnInfo(textTheme, "E-PARCEL SUBSEQUENT", "subsequent",
                  eParcelSubsequentController),
              _columnInfo(textTheme, "UNKNOWN ARTICLES", "unknown",
                  unknownArticlesController),
            ],
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          _columnInfo(
              textTheme, "BDM ITEMS", "unknown", unknownArticlesController),
          SizedBox(
            height: SizeConfig.heightMultiplier * 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AuthButton(
                title: "Submit For Approval",
                onTap: () {
                  Get.back();
                  Get.back();
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _columnInfo(TextTheme textTheme, String title, String hintText,
      TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.bodyMedium!
              .copyWith(color: AppColors.textClr, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: SizeConfig.heightMultiplier * .5),
        SizedBox(
          width: SizeConfig.widthMultiplier * 40,
          child: CustomTextField(hintText: hintText, controller: controller),
        )
      ],
    );
  }
}
