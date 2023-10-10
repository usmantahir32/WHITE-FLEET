import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/controllers/add_pickup.dart';
import 'package:whitefleet/controllers/add_route.dart';
import 'package:whitefleet/controllers/routes.dart';
import 'package:whitefleet/models/pickeups.dart';
import 'package:whitefleet/models/routes.dart';
import 'package:whitefleet/views/widgets/loading.dart';
import '../../constants/colors.dart';
import '../../constants/decorations.dart';
import '../../models/data.dart';
import '../../utils/size_config.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_textfield.dart';

class AddRouteBS extends StatefulWidget {
  AddRouteBS({
    super.key,
    this.data,
  });
  final RouteData? data;

  @override
  State<AddRouteBS> createState() => _AddRouteBSState();
}

class _AddRouteBSState extends State<AddRouteBS> {
  final cont = Get.put(AddRouteCont());

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (widget.data != null) {
        cont.getRoute(widget.data!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.data != null;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: SizeConfig.heightMultiplier * 22,
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
                    isEdit ? "Edit ${widget.data!.name}" : "New Route",
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
                //         listdata: jobAndInvenCtrl.newPickupassignTo,
                //         currentSelectedValue:
                //             jobAndInvenCtrl.selectedNewPickupAssignTo.value == ""
                //                 ? null
                //                 : jobAndInvenCtrl.selectedNewPickupAssignTo.value,
                //         onChanged: (value) {
                //           jobAndInvenCtrl.selectedNewPickupAssignTo.value =
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
                //           jobAndInvenCtrl.newPickupselectedDay.value = index;
                //         },
                //         child: AnimatedContainer(
                //           duration: const Duration(milliseconds: 400),
                //           margin: EdgeInsets.symmetric(
                //               horizontal: SizeConfig.widthMultiplier * 1),
                //           decoration: BoxDecoration(
                //               color: jobAndInvenCtrl.newPickupselectedDay.value ==
                //                       index
                //                   ? AppColors.greenClr
                //                   : AppColors.whiteClr,
                //               shape: BoxShape.circle,
                //               boxShadow: [AppDecorations.defaultShadow]),
                //           child: Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Text(
                //               days[index],
                //               style: textTheme.bodySmall!.copyWith(
                //                   color:
                //                       jobAndInvenCtrl.newPickupselectedDay.value ==
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
                          ? cont.editRoute(widget.data!.id!)
                          : cont.addRoute(),
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
