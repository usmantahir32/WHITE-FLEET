// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:whitefleet/views/widgets/custom_btn.dart';
// import 'package:whitefleet/views/widgets/custom_textfield.dart';
// import 'package:whitefleet/constants/colors.dart';
// import 'package:whitefleet/constants/decorations.dart';
// import 'package:whitefleet/constants/textstyles.dart';
// import '../../../../constants/icons.dart';
// import '../../../../utils/size_config.dart';
// import '../../../../views/widgets/custom_appbar.dart';

// class RoutesEditScreen extends StatelessWidget {
//   RoutesEditScreen({super.key});
//   final routeCtrl = Get.put(RouteController());
//   TextEditingController streetController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Scaffold(
//         appBar: CustomAppbar(
//           title: "Routes",
//           isleading: true,
//           actions: [
//             IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 AppIcons.notification,
//                 color: Colors.black,
//                 size: SizeConfig.imageSizeMultiplier * 8,
//               ),
//             ),
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: SizedBox(
//             width: SizeConfig.widthMultiplier * 100,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: SizeConfig.heightMultiplier * 2),
//                 Align(
//                   alignment: Alignment.center,
//                   child: Container(
//                     height: SizeConfig.heightMultiplier * 40,
//                     width: SizeConfig.widthMultiplier * 70,
//                     padding: EdgeInsets.symmetric(
//                         horizontal: SizeConfig.widthMultiplier * 8,
//                         vertical: SizeConfig.heightMultiplier * 4),
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border.all(
//                           color: Colors.grey.shade300,
//                         ),
//                         borderRadius: BorderRadius.circular(6),
//                         boxShadow: [AppDecorations.defaultShadow]),
//                     child: Center(
//                       child: Image.asset("assets/images/strapper.png"),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: SizeConfig.heightMultiplier * 3),
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: SizeConfig.widthMultiplier * 4),
//                   child: routeCtrl.isAddStreet.value
//                       ? Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Add Street",
//                               style: AppTextStyles.headingMedium,
//                             ),
//                             SizedBox(height: SizeConfig.heightMultiplier * 3),
//                             Text(
//                               "Street Name",
//                               style: TextStyle( fontSize: SizeConfig.textMultiplier * 1.55).copyWith(
//                                   color: AppColors.textClr,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                             SizedBox(height: SizeConfig.heightMultiplier * .5),
//                             CustomTextField(
//                               hintText: "Name",
//                               controller: streetController,
//                               isSpacing: true,
//                             ),
//                             Text(
//                               "Place After",
//                               style: TextStyle( fontSize: SizeConfig.textMultiplier * 1.55).copyWith(
//                                   color: AppColors.textClr,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                             SizedBox(height: SizeConfig.heightMultiplier * .5),
//                             CustomTextField(
//                               hintText: "Name",
//                               controller: streetController,
//                               isSpacing: true,
//                             ),
//                             SizedBox(height: SizeConfig.heightMultiplier * 2),
//                             Align(
//                               alignment: Alignment.center,
//                               child: CustomButton(
//                                 title: "Done",
//                                 onTap: () {
//                                   routeCtrl.isAddStreet.value = false;
//                                 },
//                               ),
//                             )
//                           ],
//                         )
//                       : routeCtrl.isAddSubStreet.value
//                           ? Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Add Sub Street",
//                                   style: AppTextStyles.headingMedium,
//                                 ),
//                                 SizedBox(
//                                     height: SizeConfig.heightMultiplier * 3),
//                                 Text(
//                                   "Sub Street Name",
//                                   style: TextStyle( fontSize: SizeConfig.textMultiplier * 1.55).copyWith(
//                                       color: AppColors.textClr,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 SizedBox(
//                                     height: SizeConfig.heightMultiplier * .5),
//                                 CustomTextField(
//                                   hintText: "Name",
//                                   controller: streetController,
//                                   isSpacing: true,
//                                 ),
//                                 Text(
//                                   "Place In",
//                                   style: TextStyle( fontSize: SizeConfig.textMultiplier * 1.55).copyWith(
//                                       color: AppColors.textClr,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 SizedBox(
//                                     height: SizeConfig.heightMultiplier * .5),
//                                 CustomTextField(
//                                   hintText: "Name",
//                                   controller: streetController,
//                                   isSpacing: true,
//                                 ),
//                                 Text(
//                                   "Place After",
//                                   style: TextStyle( fontSize: SizeConfig.textMultiplier * 1.55).copyWith(
//                                       color: AppColors.textClr,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 SizedBox(
//                                     height: SizeConfig.heightMultiplier * .5),
//                                 CustomTextField(
//                                   hintText: "Name",
//                                   controller: streetController,
//                                   isSpacing: true,
//                                 ),
//                                 SizedBox(
//                                     height: SizeConfig.heightMultiplier * 2),
//                                 Align(
//                                   alignment: Alignment.center,
//                                   child: CustomButton(
//                                     title: "Done",
//                                     onTap: () {
//                                       routeCtrl.isAddSubStreet.value = false;
//                                     },
//                                   ),
//                                 )
//                               ],
//                             )
//                           : Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 CustomButton(
//                                   title: "Add Street",
//                                   onTap: () {
//                                     routeCtrl.isAddStreet.value = true;
//                                   },
//                                   isIcon: true,
//                                 ),
//                                 CustomButton(
//                                   title: "Add Sub Street",
//                                   onTap: () {
//                                     routeCtrl.isAddSubStreet.value = true;
//                                   },
//                                   isIcon: true,
//                                 )
//                               ],
//                             ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
