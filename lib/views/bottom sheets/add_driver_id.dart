import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/controllers/add_driver_id.dart';
import 'package:whitefleet/models/driver_ids.dart';
import 'package:whitefleet/views/widgets/loading.dart';
import '../../constants/colors.dart';
import '../../utils/size_config.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_textfield.dart';

class AddDriverIdBS extends StatefulWidget {
  AddDriverIdBS({
    super.key,
    this.data,
  });
  final DriverIdsData? data;
  @override
  State<AddDriverIdBS> createState() => _AddDriverIdBSState();
}

class _AddDriverIdBSState extends State<AddDriverIdBS> {
  final cont = Get.put(AddDriverIDCont());
  @override
  void initState() {
    super.initState();
    //GET DATA IF IT IS EDIT PAGE
    Future.delayed(Duration.zero, () {
      if (widget.data != null) {
        cont.getDriverId(widget.data!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isEdit = widget.data != null;
    return Container(
      height: SizeConfig.heightMultiplier * 25,
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
                  "New Id",
                  style: textTheme.headlineMedium,
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Id:",
                      style: textTheme.bodyMedium!.copyWith(
                          color: const Color(0xff04104A),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 4,
                      width: SizeConfig.widthMultiplier * 55,
                      child: CustomTextField(
                        hintText: "Enter Id",
                        controller: cont.tempID,
                      ),
                    )
                  ],
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 2),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       "Type:",
                //       style: textTheme.bodyMedium!.copyWith(
                //           color: const Color(0xff04104A),
                //           fontWeight: FontWeight.w600),
                //     ),
                //     Obx(
                //       () => CustomDropDownField(
                //         hinttext: "type",
                //         listdata: jobAndInvenCtrl.newIdType,
                //         currentSelectedValue:
                //             jobAndInvenCtrl.selectedNewIdType.value == ""
                //                 ? null
                //                 : jobAndInvenCtrl.selectedNewIdType.value,
                //         onChanged: (value) {
                //           jobAndInvenCtrl.selectedNewIdType.value = value.toString();
                //         },
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: SizeConfig.heightMultiplier * 2),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       "Assign To:",
                //       style: textTheme.bodyMedium!.copyWith(
                //           color: const Color(0xff04104A),
                //           fontWeight: FontWeight.w600),
                //     ),
                //     Obx(
                //       () => CustomDropDownField(
                //         hinttext: "Assign to",
                //         listdata: jobAndInvenCtrl.newIdAssignTo,
                //         currentSelectedValue:
                //             jobAndInvenCtrl.selectedNewIdAssignTo.value == ""
                //                 ? null
                //                 : jobAndInvenCtrl.selectedNewIdAssignTo.value,
                //         onChanged: (value) {
                //           jobAndInvenCtrl.selectedNewIdAssignTo.value =
                //               value.toString();
                //         },
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: SizeConfig.heightMultiplier * 2),
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
                      title: isEdit ? "Update" : "Done",
                      onTap: () => isEdit
                          ? cont.editDriverId(widget.data!.id!)
                          : cont.addDriverID(),
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
}
