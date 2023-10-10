import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../controllers/job_and_inven_controller.dart';
import '../../utils/size_config.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_dropdownfield.dart';
import '../widgets/custom_textfield.dart';

// ignore: must_be_immutable
class EditWaveBottomSheet extends StatelessWidget {
  EditWaveBottomSheet({
    super.key,
  });

  final jobAndInvenCtrl = Get.find<JobAndInvenController>();

  TextEditingController numberController = TextEditingController();

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
            "Update Wave",
            style: textTheme.headlineMedium,
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Wave Number:",
                style: textTheme.bodyMedium!.copyWith(
                    color: const Color(0xff04104A),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 4,
                width: SizeConfig.widthMultiplier * 55,
                child: CustomTextField(
                  hintText: "Enter number",
                  controller: numberController,
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
                  hinttext: "Assign",
                  listdata: jobAndInvenCtrl.editWaveAssignTo,
                  currentSelectedValue:
                      jobAndInvenCtrl.selectedEditWaveAssignTo.value == ""
                          ? null
                          : jobAndInvenCtrl.selectedEditWaveAssignTo.value,
                  onChanged: (value) {
                    jobAndInvenCtrl.selectedEditWaveAssignTo.value =
                        value.toString();
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                title: "Cancel",
                isBorder: true,
                onTap: () {
                  Get.back();
                },
              ),
              CustomButton(
                title: "Done",
                onTap: () {
                  Get.back();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
