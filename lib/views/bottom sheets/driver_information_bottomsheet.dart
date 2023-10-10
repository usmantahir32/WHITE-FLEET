import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:whitefleet/views/bottom%20sheets/assign_driver_id.dart';
import '../../constants/colors.dart';
import '../../controllers/driver_controller.dart';
import '../../utils/size_config.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_dropdownfield.dart';
import '../widgets/custom_textfield.dart';

// ignore: must_be_immutable
class DriverInformationBottomSheet extends StatelessWidget {
  DriverInformationBottomSheet({
    super.key,
  });

  final driverCtrl = Get.find<DriverController>();
  TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: SizeConfig.heightMultiplier * 50,
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
            "Driver Information",
            style: textTheme.headlineMedium,
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Name:",
                style: textTheme.bodyMedium!.copyWith(
                    color: const Color(0xff04104A),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 4,
                width: SizeConfig.widthMultiplier * 55,
                child: CustomTextField(
                  hintText: "Enter Name",
                  controller: idController,
                ),
              )
            ],
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Number:",
                style: textTheme.bodyMedium!.copyWith(
                    color: const Color(0xff04104A),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 4,
                width: SizeConfig.widthMultiplier * 55,
                child: CustomTextField(
                  hintText: "Enter Number",
                  controller: idController,
                ),
              )
            ],
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Email:",
                style: textTheme.bodyMedium!.copyWith(
                    color: const Color(0xff04104A),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 4,
                width: SizeConfig.widthMultiplier * 55,
                child: CustomTextField(
                  hintText: "Enter Email",
                  controller: idController,
                ),
              )
            ],
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Id Type:",
                style: textTheme.bodyMedium!.copyWith(
                    color: const Color(0xff04104A),
                    fontWeight: FontWeight.w600),
              ),
              Obx(
                () => CustomDropDownField(
                  hinttext: "select type",
                  listdata: driverCtrl.idType,
                  currentSelectedValue: driverCtrl.selectedIdType.value == ""
                      ? null
                      : driverCtrl.selectedIdType.value,
                  onChanged: (value) {
                    driverCtrl.selectedIdType.value = value.toString();
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
                "Driver id:",
                style: textTheme.bodyMedium!.copyWith(
                    color: const Color(0xff04104A),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 4,
                width: SizeConfig.widthMultiplier * 55,
                child: CustomTextField(
                    hintText: "Search id",
                    controller: idController,
                    suffix: IconButton(
                      onPressed: () {
                        Get.bottomSheet(AssignDriverIdBS(),
                            isScrollControlled: true);
                      },
                      icon: Icon(FeatherIcons.search,
                          size: SizeConfig.imageSizeMultiplier * 5),
                    )),
              )
            ],
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 5),
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
