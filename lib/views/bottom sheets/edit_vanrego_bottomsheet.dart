// import 'package:flutter/material.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
// import 'package:get/get.dart';
// import '../../constants/colors.dart';
// import '../../controllers/job_and_inven_controller.dart';
// import '../../utils/size_config.dart';
// import '../widgets/custom_btn.dart';
// import '../widgets/custom_dropdownfield.dart';
// import '../widgets/custom_textfield.dart';

// class EditVanRegoBottomSheet extends StatelessWidget {
//   EditVanRegoBottomSheet({
//     super.key,
//   });
//   final jobAndInvenCtrl = Get.find<JobAndInvenController>();

//   TextEditingController vanNoController = TextEditingController();
//   TextEditingController regNohController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController sizeController = TextEditingController();
//   TextEditingController dateController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;

//     return Container(
//       height: SizeConfig.heightMultiplier * 60,
//       width: SizeConfig.widthMultiplier * 100,
//       padding: EdgeInsets.symmetric(
//           horizontal: SizeConfig.widthMultiplier * 4,
//           vertical: SizeConfig.heightMultiplier * 2),
//       decoration: BoxDecoration(
//         color: AppColors.whiteClr,
//         border: Border.all(color: Colors.black26),
//         borderRadius: const BorderRadius.vertical(
//           top: Radius.circular(16),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             "Update Van Rego",
//             style: textTheme.headlineMedium,
//           ),
//           SizedBox(height: SizeConfig.heightMultiplier * 2),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Van No:",
//                 style: textTheme.bodyMedium!.copyWith(
//                     color: const Color(0xff04104A),
//                     fontWeight: FontWeight.w600),
//               ),
//               SizedBox(
//                 height: SizeConfig.heightMultiplier * 4,
//                 width: SizeConfig.widthMultiplier * 55,
//                 child: CustomTextField(
//                   hintText: "Enter number",
//                   controller: vanNoController,
//                 ),
//               )
//             ],
//           ),
//           SizedBox(height: SizeConfig.heightMultiplier * 2),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Rego No:",
//                 style: textTheme.bodyMedium!.copyWith(
//                     color: const Color(0xff04104A),
//                     fontWeight: FontWeight.w600),
//               ),
//               SizedBox(
//                 height: SizeConfig.heightMultiplier * 4,
//                 width: SizeConfig.widthMultiplier * 55,
//                 child: CustomTextField(
//                   hintText: "Enter number",
//                   controller: regNohController,
//                 ),
//               )
//             ],
//           ),
//           SizedBox(height: SizeConfig.heightMultiplier * 2),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Company:",
//                 style: textTheme.bodyMedium!.copyWith(
//                     color: const Color(0xff04104A),
//                     fontWeight: FontWeight.w600),
//               ),
//               SizedBox(
//                 height: SizeConfig.heightMultiplier * 4,
//                 width: SizeConfig.widthMultiplier * 55,
//                 child: CustomTextField(
//                   hintText: "Enter name",
//                   controller: nameController,
//                 ),
//               )
//             ],
//           ),
//           SizedBox(height: SizeConfig.heightMultiplier * 2),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Size:",
//                 style: textTheme.bodyMedium!.copyWith(
//                     color: const Color(0xff04104A),
//                     fontWeight: FontWeight.w600),
//               ),
//               SizedBox(
//                 height: SizeConfig.heightMultiplier * 4,
//                 width: SizeConfig.widthMultiplier * 55,
//                 child: CustomTextField(
//                   hintText: "Enter weight",
//                   controller: sizeController,
//                 ),
//               )
//             ],
//           ),
//           SizedBox(height: SizeConfig.heightMultiplier * 2),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Rego Expiry:",
//                 style: textTheme.bodyMedium!.copyWith(
//                     color: const Color(0xff04104A),
//                     fontWeight: FontWeight.w600),
//               ),
//               SizedBox(
//                 height: SizeConfig.heightMultiplier * 4,
//                 width: SizeConfig.widthMultiplier * 55,
//                 child: CustomTextField(
//                   hintText: "select date",
//                   controller: dateController,
                 
//                   suffix: Icon(
//                     FeatherIcons.calendar,
//                     size: SizeConfig.imageSizeMultiplier * 5,
//                   ),
//                 ),
//               )
//             ],
//           ),
//           SizedBox(height: SizeConfig.heightMultiplier * 2),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Assign To:",
//                 style: textTheme.bodyMedium!.copyWith(
//                     color: const Color(0xff04104A),
//                     fontWeight: FontWeight.w600),
//               ),
//               Obx(
//                 () => CustomDropDownField(
//                   hinttext: "Assign to",
//                   listdata: jobAndInvenCtrl.editVanRegoAssignTo,
//                   currentSelectedValue:
//                       jobAndInvenCtrl.selectedEditVanRegoAssignTo.value == ""
//                           ? null
//                           : jobAndInvenCtrl.selectedEditVanRegoAssignTo.value,
//                   onChanged: (value) {
//                     jobAndInvenCtrl.selectedEditVanRegoAssignTo.value =
//                         value.toString();
//                   },
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: SizeConfig.heightMultiplier * 5),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               CustomButton(
//                 title: "Cancel",
//                 onTap: () {
//                   Get.back();
//                 },
//                 isBorder: true,
//               ),
//               CustomButton(
//                 title: "Done",
//                 onTap: () {},
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
