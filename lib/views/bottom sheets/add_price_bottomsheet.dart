import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/constants.dart';
import '../../constants/colors.dart';
import '../../utils/size_config.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_textfield.dart';

// ignore: must_be_immutable
class AddPriceBottomSheet extends StatelessWidget {
  AddPriceBottomSheet({
    super.key,
  });

  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: SizeConfig.heightMultiplier * 30,
      width: SizeConfig.widthMultiplier * 100,
      padding: EdgeInsets.only(top: SizeConfig.heightMultiplier * 2),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(16),
          ),
          color: AppColors.whiteClr),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 4),
            child: Text(
              "Price",
              style: textTheme.headlineMedium,
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 1),
          const Divider(
            height: 0,
            thickness: 2,
            color: Colors.black26,
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add Price:",
                  style: textTheme.bodyMedium!.copyWith(
                      color: const Color(0xff04104A),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 4,
                  width: SizeConfig.widthMultiplier * 55,
                  child: CustomTextField(
                    hintText: "Enter Price in AUD",
                    controller: priceController,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*5),
            child: Row(
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
                  onTap: () {
                    Get.back();
                  },
                )
              ],
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 5),
        ],
      ),
    );
  }
}
