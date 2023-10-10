import 'package:flutter/material.dart';
import 'package:whitefleet/constants/decorations.dart';
import '../../constants/colors.dart';
import '../../constants/icons.dart';
import '../../utils/size_config.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    required this.hintText,
    required this.controller, this.onChange,
  });

  final String hintText;
  final Function(String?)? onChange;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: SizeConfig.heightMultiplier * 6,
      width: SizeConfig.widthMultiplier * 90,
      decoration: AppDecorations.whiteBox,
      child: TextField(
        controller: controller,
        onChanged: onChange,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:
              textTheme.bodyMedium!.copyWith(color: AppColors.textMediumClr),
          filled: true,
          fillColor: AppColors.whiteClr,
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.heightMultiplier * 1.7),
            child: Image.asset(AppIcons.cancelFilled,
                height: SizeConfig.imageSizeMultiplier * 4),
          ),
          contentPadding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 4),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
