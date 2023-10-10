import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/controllers/add_school.dart';
import 'package:whitefleet/models/schools.dart';
import 'package:whitefleet/views/widgets/loading.dart';
import '../../constants/colors.dart';
import '../../constants/decorations.dart';
import '../../models/data.dart';
import '../../utils/size_config.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_textfield.dart';

class AddSchoolBS extends StatefulWidget {
  AddSchoolBS({
    super.key,
    this.schoolsData,
  });
  final SchoolsData? schoolsData;

  @override
  State<AddSchoolBS> createState() => _AddSchoolBSState();
}

class _AddSchoolBSState extends State<AddSchoolBS> {
  final cont = Get.put(AddSchoolCont());
  @override
  void initState() {
    super.initState();
    //GET DATA IF IT IS EDIT PAGE
    Future.delayed(Duration.zero, () {
      if (widget.schoolsData != null) {
        cont.getSchools(widget.schoolsData!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isEdit = widget.schoolsData != null;
    return Container(
      height: SizeConfig.heightMultiplier * 50,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    isEdit ? 'Edit ${widget.schoolsData!.name}' : "New School",
                    style: textTheme.headlineMedium,
                  ),
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
                        controller: cont.nameCont,
                      ),
                    )
                  ],
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
                        controller: cont.addressCont,
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
                        controller: cont.noteCont,
                      ),
                    )
                  ],
                ),
                // SizedBox(height: SizeConfig.heightMultiplier * 2),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       "Route:",
                //       style: textTheme.bodyMedium!.copyWith(
                //           color: const Color(0xff04104A),
                //           fontWeight: FontWeight.w600),
                //     ),
                //     SizedBox(
                //       height: SizeConfig.heightMultiplier * 4,
                //       width: SizeConfig.widthMultiplier * 55,
                //       child: CustomTextField(
                //         hintText: "Add new Route",
                //         prefix: Image.asset(AppIcons.plusOutlined),
                //         controller: cont.routeCont,
                //       ),
                //     )
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
                //         hinttext: "Search Driver",
                //         listdata: cont.allDrivers,
                //         currentSelectedValue: cont.selectedDriver.value == ""
                //             ? null
                //             : cont.selectedDriver.value,
                //         onChanged: (value) {
                //           if (value != null) cont.selectedDriver.value = value;
                //         },
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: SizeConfig.heightMultiplier * 2),
                //SELECT DAYS
                Text(
                  "Pickup Days:",
                  style: textTheme.bodyMedium!.copyWith(
                      color: const Color(0xff04104A),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...List.generate(
                      days.length,
                      (index) => GestureDetector(
                        onTap: () {
                          if (cont.selectedDays.contains(days[index])) {
                            cont.selectedDays.remove(days[index]);
                          } else {
                            cont.selectedDays.add(days[index]);
                          }
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          margin: EdgeInsets.only(
                              right: SizeConfig.widthMultiplier * 2),
                          decoration: BoxDecoration(
                              color: cont.selectedDays.contains(days[index])
                                  ? AppColors.greenClr
                                  : AppColors.whiteClr,
                              shape: BoxShape.circle,
                              boxShadow: [AppDecorations.defaultShadow]),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              days[index].substring(0, 3).toUpperCase(),
                              style: textTheme.bodySmall!.copyWith(
                                  color: cont.selectedDays.contains(days[index])
                                      ? AppColors.whiteClr
                                      : AppColors.textClr),
                            ),
                          ),
                        ),
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
                      title: isEdit ? "Update" : "Done",
                      onTap: () => isEdit
                          ? cont.editSchool(widget.schoolsData!.id!)
                          : cont.addSchool(),
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
