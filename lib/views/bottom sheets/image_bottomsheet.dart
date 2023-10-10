import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whitefleet/Constants/colors.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/widgets/custom_btn.dart';
import 'package:whitefleet/views/widgets/custom_textfield.dart';

class ImageBotttomSheet extends StatefulWidget {
  final XFile picture;
  const ImageBotttomSheet({super.key, required this.picture});

  @override
  State<ImageBotttomSheet> createState() => _ImageBotttomSheetState();
}

class _ImageBotttomSheetState extends State<ImageBotttomSheet> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier * 50,
      width: SizeConfig.widthMultiplier * 100,
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 4,
          vertical: SizeConfig.heightMultiplier * 2),
      decoration: BoxDecoration(
          color: AppColors.whiteClr, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Container(
            height: SizeConfig.heightMultiplier * 24,
            width: SizeConfig.widthMultiplier * 40,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                image: DecorationImage(
                    image: FileImage(File(widget.picture.path)),
                    fit: BoxFit.contain),
                borderRadius: BorderRadius.circular(8)),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          CustomTextField(hintText: "Enter Number", controller: nameController),
          SizedBox(height: SizeConfig.heightMultiplier * 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                title: "Cancel",
                isBorder: true,
                onTap: () => Get.back(),
              ),
              CustomButton(
                title: "Done",
                onTap: () => Get.back(),
              )
            ],
          )
        ],
      ),
    );
  }
}
