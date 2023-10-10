// import 'package:flutter/material.dart';
// import 'package:whitefleet/constants/decorations.dart';
// import '../../utils/size_config.dart';

// class DropDown extends StatelessWidget {
//   final String? hinttext;
//   String? currentSelectedValue;
//   final List<String> listdata;
//   Function(String?)? onChanged;
//   DropDown({
//     super.key,
//     this.currentSelectedValue,
//     required this.listdata,
//     this.onChanged,
//     this.hinttext,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;

//     return Container(
//       height: SizeConfig.heightMultiplier * 4,
//       width: SizeConfig.widthMultiplier * 55,
//       padding: EdgeInsets.only(
//           left: SizeConfig.widthMultiplier * 4,
//           right: SizeConfig.widthMultiplier * 2),
//       decoration: AppDecorations.whiteBox,
//       child: DropdownButtonFormField(
//           hint: Text(hinttext!),
//           value: currentSelectedValue,
//           isExpanded: true,
//           icon: const Icon(Icons.keyboard_arrow_down_sharp),
//           decoration: InputDecoration.collapsed(hintText: hinttext),
//           onChanged: onChanged,
//           items: listdata.map<DropdownMenuItem<String>>((value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(
//                 value,
//                 style: textTheme.bodySmall,
//               ),
//             );
//           }).toList()),
//     );
//   }
// }
