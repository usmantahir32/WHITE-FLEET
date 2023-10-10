import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:whitefleet/controllers/driver_controller.dart';
import '../../constants/colors.dart';
import '../../constants/decorations.dart';
import '../../constants/icons.dart';
import '../../models/data.dart';
import '../../utils/size_config.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_dropdownfield.dart';
import '../widgets/custom_textfield.dart';

class TaskAssinmemtBottomSheet extends StatelessWidget {
  const TaskAssinmemtBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final driverCtrl = Get.find<DriverController>();
    TextEditingController pickUpLocation = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController routeController = TextEditingController();

    return Obx(
      () => Container(
        height: SizeConfig.heightMultiplier * 60,
        width: SizeConfig.widthMultiplier * 100,
        padding:
            EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 2),
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
              children: [
                SizedBox(width: SizeConfig.widthMultiplier * 4),
                Text(
                  "Task Type:",
                  style: textTheme.bodyMedium!.copyWith(
                      color: const Color(0xff04104A),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(width: SizeConfig.widthMultiplier * 12),
                CustomDropDownField(
                  hinttext: "Select task",
                  listdata: driverCtrl.taskTypes,
                  currentSelectedValue: driverCtrl.selectedTaskType.value == ""
                      ? null
                      : driverCtrl.selectedTaskType.value,
                  onChanged: (value) {
                    driverCtrl.selectedTaskType.value = value.toString();
                  },
                ),
              ],
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Row(
              children: [
                SizedBox(width: SizeConfig.widthMultiplier * 4),
                Text(
                  "Pickup Location:",
                  style: textTheme.bodyMedium!.copyWith(
                      color: const Color(0xff04104A),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(width: SizeConfig.widthMultiplier * 1),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 4,
                  width: SizeConfig.widthMultiplier * 55,
                  child: CustomTextField(
                    hintText: "Search Location",
                    controller: pickUpLocation,
                  ),
                )
              ],
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Row(
              children: [
                SizedBox(width: SizeConfig.widthMultiplier * 4),
                Text(
                  "End Date:",
                  style: textTheme.bodyMedium!.copyWith(
                      color: const Color(0xff04104A),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(width: SizeConfig.widthMultiplier * 14.5),
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
              children: [
                SizedBox(width: SizeConfig.widthMultiplier * 4),
                Text(
                  "Price:",
                  style: textTheme.bodyMedium!.copyWith(
                      color: const Color(0xff04104A),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(width: SizeConfig.widthMultiplier * 22),
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
              children: [
                SizedBox(width: SizeConfig.widthMultiplier * 4),
                Text(
                  "Route:",
                  style: textTheme.bodyMedium!.copyWith(
                      color: const Color(0xff04104A),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(width: SizeConfig.widthMultiplier * 20),
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
                      driverCtrl.selectedDay.value = index;
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.widthMultiplier * 1),
                      decoration: BoxDecoration(
                          color: driverCtrl.selectedDay.value == index
                              ? AppColors.greenClr
                              : AppColors.whiteClr,
                          shape: BoxShape.circle,
                          boxShadow: [AppDecorations.defaultShadow]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          days[index],
                          style: textTheme.bodySmall!.copyWith(
                              color: driverCtrl.selectedDay.value == index
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
