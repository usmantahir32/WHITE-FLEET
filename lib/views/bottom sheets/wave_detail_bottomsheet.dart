import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../controllers/driver_controller.dart';
import '../../utils/size_config.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_textfield.dart';

// ignore: must_be_immutable
class WaveDetailBottomSheet extends StatelessWidget {
  WaveDetailBottomSheet({
    super.key,
  });

  final driverCtrl = Get.find<DriverController>();
  TextEditingController waveController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: SizeConfig.heightMultiplier * 30,
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
            "Wave Details",
            style: textTheme.headlineMedium,
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Wave:",
                style: textTheme.bodyMedium!.copyWith(
                    color: const Color(0xff04104A),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 4,
                width: SizeConfig.widthMultiplier * 55,
                child: CustomTextField(
                  hintText: "Enter Wave",
                  controller: waveController,
                ),
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
