import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/controllers/add_wave.dart';
import 'package:whitefleet/models/wave.dart';
import 'package:whitefleet/views/widgets/custom_ontap_field.dart';
import 'package:whitefleet/views/widgets/loading.dart';
import '../../constants/colors.dart';
import '../../utils/size_config.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_textfield.dart';

class AddWaveBS extends StatefulWidget {
  AddWaveBS({
    super.key,
    this.data,
  });
  final WaveData? data;

  @override
  State<AddWaveBS> createState() => _AddWaveBSState();
}

class _AddWaveBSState extends State<AddWaveBS> {
  final cont = Get.put(AddWaveCont());
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (widget.data != null) {
        cont.getWave(widget.data!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isEdit = widget.data != null;
    return Container(
      height: SizeConfig.heightMultiplier * 40,
      width: SizeConfig.widthMultiplier * 100,
      decoration: BoxDecoration(
        color: AppColors.whiteClr,
        border: Border.all(color: Colors.black26),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Obx(
        () => ShowLoading(
          inAsyncCall: authCont.isLoading.value,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 4,
                vertical: SizeConfig.heightMultiplier * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  isEdit ? "Edit ${widget.data!.name}" : "New Wave",
                  style: textTheme.headlineMedium,
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 2),
                //WAVE NAME
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
                        hintText: "Enter number",
                        controller: cont.nameCont,
                      ),
                    )
                  ],
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 2),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       "Assign To:",
                //       style: textTheme.bodyMedium!.copyWith(
                //           color: const Color(0xff04104A),
                //           fontWeight: FontWeight.w600),
                //     ),
                // Obx(
                //   () => CustomDropDownField(
                //     hinttext: "Assign to",
                //     listdata: jobAndInvenCtrl.newWaveAssignTo,
                //     currentSelectedValue:
                //         jobAndInvenCtrl.selectedNewWaveAssignTo.value == ""
                //             ? null
                //             : jobAndInvenCtrl.selectedNewWaveAssignTo.value,
                //     onChanged: (value) {
                //       jobAndInvenCtrl.selectedNewWaveAssignTo.value =
                //           value.toString();
                //     },
                //   ),
                // ),
                //   ],
                // ),
                //START TIME
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Start Time:",
                      style: textTheme.bodyMedium!.copyWith(
                          color: const Color(0xff04104A),
                          fontWeight: FontWeight.w600),
                    ),
                    CustomOnTapField(
                        selectedVal: cont.startTime.value == null
                            ? ''
                            : cont.startTime.value!.format(context),
                        hinttext: 'Start Time',
                        onTap: () async =>
                            cont.startTime.value = await _pickedTime(context))
                  ],
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 2),
                //END TIME
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "End Time:",
                      style: textTheme.bodyMedium!.copyWith(
                          color: const Color(0xff04104A),
                          fontWeight: FontWeight.w600),
                    ),
                    CustomOnTapField(
                        selectedVal: cont.endTime.value == null
                            ? ''
                            : cont.endTime.value!.format(context),
                        hinttext: 'End Time',
                        onTap: () async =>
                            cont.endTime.value = await _pickedTime(context))
                  ],
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      title: "Cancel",
                      onTap: () => Get.back(),
                      isBorder: true,
                    ),
                    CustomButton(
                      title: isEdit ? "Update" : "Done",
                      onTap: () => isEdit
                          ? cont.editWave(widget.data!.id!)
                          : cont.addWave(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<TimeOfDay?> _pickedTime(BuildContext context) async {
    final selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    return selectedTime;
  }
}
