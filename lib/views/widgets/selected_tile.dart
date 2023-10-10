import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/utils/size_config.dart';

class CustomSelectedTile extends StatelessWidget {
  const CustomSelectedTile(
      {super.key,
      required this.onTap,
      required this.text,
      required this.isSelected,
      this.onRelease,
      this.preffix});
  final VoidCallback onTap;
  final String text;
  final bool isSelected;
  final Widget? preffix;
  final VoidCallback? onRelease;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeConfig.heightMultiplier * 6,
        width: SizeConfig.widthMultiplier * 90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 6)]),
        margin: EdgeInsets.only(
            left: SizeConfig.widthMultiplier * 2,
            right: SizeConfig.widthMultiplier * 2,
            bottom: SizeConfig.widthMultiplier * 2),
        child: Row(children: [
          SizedBox(width: SizeConfig.widthMultiplier * 5),
          preffix == null
              ? const SizedBox()
              : Padding(
                  padding:
                      EdgeInsets.only(right: SizeConfig.widthMultiplier * 3),
                  child: preffix,
                ),
          Text(text, style: Theme.of(context).textTheme.bodyMedium),
          const Spacer(),
          onRelease == null
              ? Icon(
                  isSelected
                      ? FeatherIcons.checkCircle
                      : Icons.add_circle_outline_sharp,
                  size: 20,
                  color: isSelected ? AppColors.greenClr : Colors.black,
                )
              : Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 2,
                    vertical: SizeConfig.heightMultiplier * .5,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.redClr),
                  child: Text(
                    "Release",
                    style: textTheme.bodySmall!
                        .copyWith(color: AppColors.whiteClr),
                  ),
                ),
          SizedBox(width: SizeConfig.widthMultiplier * 5),
        ]),
      ),
    );
  }
}
