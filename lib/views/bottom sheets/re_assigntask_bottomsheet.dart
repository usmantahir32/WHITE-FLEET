import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:whitefleet/views/widgets/custom_btn.dart';
import 'package:whitefleet/views/widgets/custom_dropdownfield.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/constants/decorations.dart';
import 'package:whitefleet/constants/icons.dart';
import '../../controllers/home_controller.dart';
import '../../models/data.dart';
import '../../utils/size_config.dart';
import '../widgets/custom_textfield.dart';

// ignore: must_be_immutable
class ReAssignTaskBottomSheet extends StatelessWidget {
  ReAssignTaskBottomSheet({
    super.key,
  });

  final homeCtrl = Get.find<HomeController>();

  TextEditingController locationController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController priceController = TextEditingController();
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
              "Re Assign Tasks",
              style: textTheme.headlineMedium,
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Task Type:",
                  style: textTheme.bodyMedium!.copyWith(
                      color: const Color(0xff04104A),
                      fontWeight: FontWeight.w600),
                ),
                Obx(
                  () => CustomDropDownField(
                    hinttext: "Select type",
                    listdata: homeCtrl.taskTypes,
                    currentSelectedValue:
                        homeCtrl.currentSelectedTaskType.value == ""
                            ? null
                            : homeCtrl.currentSelectedTaskType.value,
                    onChanged: (value) {
                      homeCtrl.currentSelectedTaskType.value = value.toString();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Task Name:",
                  style: textTheme.bodyMedium!.copyWith(
                      color: const Color(0xff04104A),
                      fontWeight: FontWeight.w600),
                ),
                Obx(
                  () => CustomDropDownField(
                    hinttext: "Select name",
                    listdata: homeCtrl.taskName,
                    currentSelectedValue:
                        homeCtrl.currentSelectedTaskName.value == ""
                            ? null
                            : homeCtrl.currentSelectedTaskName.value,
                    onChanged: (value) {
                      homeCtrl.currentSelectedTaskName.value = value.toString();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Assign to:",
                  style: textTheme.bodyMedium!.copyWith(
                      color: const Color(0xff04104A),
                      fontWeight: FontWeight.w600),
                ),
                Obx(
                  () => CustomDropDownField(
                    hinttext: "Select assign",
                    listdata: homeCtrl.assignTo,
                    currentSelectedValue:
                        homeCtrl.currentSelectedAssignTo.value == ""
                            ? null
                            : homeCtrl.currentSelectedAssignTo.value,
                    onChanged: (value) {
                      homeCtrl.currentSelectedAssignTo.value = value.toString();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pickup Location:",
                  style: textTheme.bodyMedium!.copyWith(
                      color: const Color(0xff04104A),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 4,
                  width: SizeConfig.widthMultiplier * 55,
                  child: CustomTextField(
                    hintText: "Search Location",
                    controller: locationController,
                  ),
                )
              ],
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "End Date:",
                  style: textTheme.bodyMedium!.copyWith(
                      color: const Color(0xff04104A),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 4,
                  width: SizeConfig.widthMultiplier * 55,
                  child: CustomTextField(
                    hintText: "Select Date",
                    controller: dateController,
                    suffix: Icon(
                      FeatherIcons.calendar,
                      size: SizeConfig.imageSizeMultiplier * 5,
                      color: Colors.black45,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Price:",
                  style: textTheme.bodyMedium!.copyWith(
                      color: const Color(0xff04104A),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 4,
                  width: SizeConfig.widthMultiplier * 55,
                  child: CustomTextField(
                    hintText: "Enter Price",
                    controller: priceController,
                    prefix: const Icon(
                      Icons.price_check,
                      color: Colors.black45,
                    ),
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
                      homeCtrl.selectedDay.value = index;
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.widthMultiplier * 1),
                      decoration: BoxDecoration(
                          color: homeCtrl.selectedDay.value == index
                              ? AppColors.greenClr
                              : AppColors.whiteClr,
                          shape: BoxShape.circle,
                          boxShadow: [AppDecorations.defaultShadow]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          days[index],
                          style: textTheme.bodySmall!.copyWith(
                              color: homeCtrl.selectedDay.value == index
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
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
