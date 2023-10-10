import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/decorations.dart';
import '../../constants/icons.dart';
import '../../controllers/job_and_inven_controller.dart';
import '../../models/data.dart';
import '../../utils/size_config.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_dropdownfield.dart';
import '../widgets/custom_textfield.dart';

// ignore: must_be_immutable
class EditPickupBottomSheet extends StatelessWidget {
  EditPickupBottomSheet({
    super.key,
  });

  final jobAndInvenCtrl = Get.find<JobAndInvenController>();

  TextEditingController addressController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController routeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Obx(
      () => Container(
        height: SizeConfig.heightMultiplier * 70,
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
              "Create New PickUp",
              style: textTheme.headlineMedium,
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Address:",
                  style: textTheme.bodyMedium!.copyWith(
                      color: const Color(0xff04104A),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 4,
                  width: SizeConfig.widthMultiplier * 55,
                  child: CustomTextField(
                    hintText: "Enter Address",
                    controller: addressController,
                  ),
                )
              ],
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Note:",
                  style: textTheme.bodyMedium!.copyWith(
                      color: const Color(0xff04104A),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 4,
                  width: SizeConfig.widthMultiplier * 55,
                  child: CustomTextField(
                    hintText: "Enter Note",
                    controller: noteController,
                  ),
                )
              ],
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Route:",
                  style: textTheme.bodyMedium!.copyWith(
                      color: const Color(0xff04104A),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 4,
                  width: SizeConfig.widthMultiplier * 55,
                  child: CustomTextField(
                    hintText: "Add new Route",
                    prefix: Image.asset(AppIcons.plusOutlined),
                    controller: routeController,
                  ),
                )
              ],
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Assign To:",
                  style: textTheme.bodyMedium!.copyWith(
                      color: const Color(0xff04104A),
                      fontWeight: FontWeight.w600),
                ),
                Obx(
                  () => CustomDropDownField(
                    hinttext: "Search Driver",
                    listdata: jobAndInvenCtrl.editPickupassignTo,
                    currentSelectedValue:
                        jobAndInvenCtrl.selectedEditPickupAssignTo.value == ""
                            ? null
                            : jobAndInvenCtrl.selectedEditPickupAssignTo.value,
                    onChanged: (value) {
                      jobAndInvenCtrl.selectedEditPickupAssignTo.value =
                          value.toString();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Text(
              "Pickup Days",
              style:
                  textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  days.length,
                  (index) => GestureDetector(
                    onTap: () {
                      jobAndInvenCtrl.editPickupselectedDay.value = index;
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.widthMultiplier * 1),
                      decoration: BoxDecoration(
                          color: jobAndInvenCtrl.editPickupselectedDay.value ==
                                  index
                              ? AppColors.greenClr
                              : AppColors.whiteClr,
                          shape: BoxShape.circle,
                          boxShadow: [AppDecorations.defaultShadow]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          days[index],
                          style: textTheme.bodySmall!.copyWith(
                              color:
                                  jobAndInvenCtrl.editPickupselectedDay.value ==
                                          index
                                      ? AppColors.whiteClr
                                      : AppColors.textClr),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            CustomButton(
              title: "Done",
              onTap: () {
                Get.back();
              },
            )
          ],
        ),
      ),
    );
  }
}
