import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/controllers/add_bay.dart';
import 'package:whitefleet/models/bay.dart';
import 'package:whitefleet/views/widgets/loading.dart';
import '../../constants/colors.dart';
import '../../utils/size_config.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_textfield.dart';

class AddBayBS extends StatefulWidget {
  AddBayBS({
    super.key,
    this.data,
  });
  final BayData? data;
  @override
  State<AddBayBS> createState() => _AddBayBSState();
}

class _AddBayBSState extends State<AddBayBS> {
  final cont = Get.put(AddBayCont());
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (widget.data != null) {
        cont.getBay(widget.data!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isEdit = widget.data != null;
    final textTheme = Theme.of(context).textTheme;

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
                  isEdit ? "Edit ${widget.data!.name}" : "New Bay",
                  style: textTheme.headlineMedium,
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Name",
                      style: textTheme.bodyMedium!.copyWith(
                          color: const Color(0xff04104A),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 4,
                      width: SizeConfig.widthMultiplier * 55,
                      child: CustomTextField(
                        hintText: "Enter Name",
                        controller: cont.nameCont,
                      ),
                    )
                  ],
                ),
                const Spacer(),
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
                //         listdata: jobAndInvenCtrl.newBayAssignTo,
                //         currentSelectedValue:
                //             jobAndInvenCtrl.selectedNewBayAssignTo.value == ""
                //                 ? null
                //                 : jobAndInvenCtrl.selectedNewBayAssignTo.value,
                //         onChanged: (value) {
                //           jobAndInvenCtrl.selectedNewBayAssignTo.value =
                //               value.toString();
                //         },
                //       ),
                //     ),
                //   ],
                // ),
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
                          ? cont.editBay(widget.data!.id!)
                          : cont.addBay(),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 2)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
