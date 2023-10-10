import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../../constants/decorations.dart';
import '../../utils/size_config.dart';

// ignore: must_be_immutable
class CustomDropDownField extends StatelessWidget {
  CustomDropDownField({
    super.key,
    this.currentSelectedValue,
    required this.listdata,
    this.onChanged,
    this.hinttext,
  });
  final String? hinttext;
  final String? currentSelectedValue;
  final List<String> listdata;
  Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: SizeConfig.heightMultiplier * 4,
      width: SizeConfig.widthMultiplier * 55,
      decoration: AppDecorations.whiteBox,
      padding: EdgeInsets.only(right: SizeConfig.widthMultiplier * 2),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          iconStyleData: const IconStyleData(
              icon: Icon(
            Icons.keyboard_arrow_down_rounded,
          )),

          hint: Text(
            hinttext.toString(),
            style: textTheme.bodySmall,
          ),
          items: listdata
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: textTheme.bodySmall,
                    ),
                  ))
              .toList(),
          value: currentSelectedValue,
          onChanged: onChanged,
          // buttonStyleData: const ButtonStyleData(
          //   padding: EdgeInsets.symmetric(horizontal: 16),
          //   height: 40,
          //   width: 140,
          // ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ),
      ),
    );
  }
}
