import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../utils/size_config.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_textfield.dart';

// ignore: must_be_immutable
class EditRouteBottomSheet extends StatelessWidget {
  EditRouteBottomSheet({
    super.key,
  });

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: SizeConfig.heightMultiplier * 40,
      width: SizeConfig.widthMultiplier * 100,
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 4,
          vertical: SizeConfig.heightMultiplier * 2),
      decoration: BoxDecoration(
        color: AppColors.whiteClr,
        border: Border.all(color: Colors.black26),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Edit Route",
            style: textTheme.headlineMedium,
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          SizedBox(
            height: SizeConfig.heightMultiplier * 4,
            width: SizeConfig.widthMultiplier * 90,
            child: CustomTextField(
              hintText: "Edit tilte",
              controller: searchController,
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          SizedBox(
            height: SizeConfig.heightMultiplier * 4,
            width: SizeConfig.widthMultiplier * 90,
            child: CustomTextField(
              hintText: "Edit subtitle",
              controller: searchController,
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                title: "Cancel",
                onTap: () {
                  Get.back();
                },
                isBorder: true,
              ),
              CustomButton(
                title: "Done",
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
