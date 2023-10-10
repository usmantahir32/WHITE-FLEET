import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/controllers/add_deppo.dart';
import 'package:whitefleet/models/deppos.dart';
import 'package:whitefleet/views/widgets/loading.dart';
import '../../constants/colors.dart';
import '../../constants/decorations.dart';
import '../../models/data.dart';
import '../../utils/size_config.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_textfield.dart';

class AddDeppoBS extends StatefulWidget {
  AddDeppoBS({
    super.key,
    this.data,
  });
  final DeppoData? data;

  @override
  State<AddDeppoBS> createState() => _AddDeppoBSState();
}

class _AddDeppoBSState extends State<AddDeppoBS> {
  final cont = Get.put(AddDeppoCont());
  @override
  void initState() {
    super.initState();
    //GET DATA IF IT IS EDIT PAGE
    Future.delayed(Duration.zero, () {
      if (widget.data != null) {
        cont.getDeppos(widget.data!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isEdit = widget.data != null;
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
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    isEdit ? 'Edit ${widget.data!.name}' : "New Deppo",
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
                      "Note:",
                      style: textTheme.bodyMedium!.copyWith(
                          color: const Color(0xff04104A),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 4,
                      width: SizeConfig.widthMultiplier * 55,
                      child: CustomTextField(
                        hintText: "Enter Notes",
                        controller: cont.note,
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
                        hintText: "Enter Adress",
                        controller: cont.address,
                      ),
                    )
                  ],
                ),

                SizedBox(height: SizeConfig.heightMultiplier * 2),
                //SELECT DAYS
                Text(
                  "Week Days:",
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
                          if (cont.weekDay.contains(days[index])) {
                            cont.weekDay.remove(days[index]);
                          } else {
                            cont.weekDay.add(days[index]);
                          }
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          margin: EdgeInsets.only(
                              right: SizeConfig.widthMultiplier * 2),
                          decoration: BoxDecoration(
                              color: cont.weekDay.contains(days[index])
                                  ? AppColors.greenClr
                                  : AppColors.whiteClr,
                              shape: BoxShape.circle,
                              boxShadow: [AppDecorations.defaultShadow]),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              days[index].substring(0, 3).toUpperCase(),
                              style: textTheme.bodySmall!.copyWith(
                                  color: cont.weekDay.contains(days[index])
                                      ? AppColors.whiteClr
                                      : AppColors.textClr),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                // SizedBox(height: SizeConfig.heightMultiplier * 2),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       "Address:",
                //       style: textTheme.bodyMedium!.copyWith(
                //           color: const Color(0xff04104A),
                //           fontWeight: FontWeight.w600),
                //     ),
                //     SizedBox(
                //       height: SizeConfig.heightMultiplier * 4,
                //       width: SizeConfig.widthMultiplier * 55,
                //       child: CustomTextField(
                //         hintText: "Enter Address",
                //         controller: addressController,
                //       ),
                //     )
                //   ],
                // ),
                // SizedBox(height: SizeConfig.heightMultiplier * 2),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       "Note:",
                //       style: textTheme.bodyMedium!.copyWith(
                //           color: const Color(0xff04104A),
                //           fontWeight: FontWeight.w600),
                //     ),
                //     SizedBox(
                //       height: SizeConfig.heightMultiplier * 4,
                //       width: SizeConfig.widthMultiplier * 55,
                //       child: CustomTextField(
                //         hintText: "Enter Note",
                //         controller: noteController,
                //       ),
                //     )
                //   ],
                // ),
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
                //         controller: routeController,
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
                //         listdata: jobAndInvenCtrl.newDeppoassignTo,
                //         currentSelectedValue:
                //             jobAndInvenCtrl.selectedNewDeppoAssignTo.value == ""
                //                 ? null
                //                 : jobAndInvenCtrl.selectedNewDeppoAssignTo.value,
                //         onChanged: (value) {
                //           jobAndInvenCtrl.selectedNewDeppoAssignTo.value =
                //               value.toString();
                //         },
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: SizeConfig.heightMultiplier * 2),
                // Text(
                //   "Pickup Days",
                //   style:
                //       textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                // ),
                // SizedBox(height: SizeConfig.heightMultiplier * 2),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     ...List.generate(
                //       days.length,
                //       (index) => GestureDetector(
                //         onTap: () {
                //           jobAndInvenCtrl.newDepposelectedDay.value = index;
                //         },
                //         child: AnimatedContainer(
                //           duration: const Duration(milliseconds: 400),
                //           margin: EdgeInsets.symmetric(
                //               horizontal: SizeConfig.widthMultiplier * 1),
                //           decoration: BoxDecoration(
                //               color:
                //                   jobAndInvenCtrl.newDepposelectedDay.value == index
                //                       ? AppColors.greenClr
                //                       : AppColors.whiteClr,
                //               shape: BoxShape.circle,
                //               boxShadow: [AppDecorations.defaultShadow]),
                //           child: Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Text(
                //               days[index],
                //               style: textTheme.bodySmall!.copyWith(
                //                   color:
                //                       jobAndInvenCtrl.newDepposelectedDay.value ==
                //                               index
                //                           ? AppColors.whiteClr
                //                           : AppColors.textClr),
                //             ),
                //           ),
                //         ),
                //       ),
                //     )
                //   ],
                // ),
                SizedBox(height: SizeConfig.heightMultiplier * 3),
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
                          ? cont.editDeppo(widget.data!.id!)
                          : cont.addDeppo(),
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
