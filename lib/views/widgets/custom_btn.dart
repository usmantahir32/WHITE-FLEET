
import 'package:flutter/material.dart';
import 'package:whitefleet/constants/icons.dart';
import 'package:whitefleet/utils/size_config.dart';
import '../../constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.isBorder = false,
    this.isLarged = false,
    this.isIcon = false,
  }) : super(key: key);
  final VoidCallback onTap;
  final bool isBorder;
  final String title;
  final bool isLarged;
  final bool isIcon;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: SizeConfig.heightMultiplier * 5,
      minWidth: isLarged
          ? SizeConfig.widthMultiplier * 60
          : SizeConfig.widthMultiplier * 40,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side:
            BorderSide(color: isBorder ? AppColors.redClr : AppColors.greenClr),
        borderRadius: BorderRadius.circular(12),
      ),
      color: isBorder ? Colors.white : AppColors.greenClr,
      onPressed: onTap,
      child: isIcon
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppIcons.plusOutlined,
                  color: AppColors.whiteClr,
                  height: SizeConfig.imageSizeMultiplier * 5,
                ),
                SizedBox(width: SizeConfig.widthMultiplier * 2),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: SizeConfig.textMultiplier * 1.6,
                      color: isBorder ? AppColors.redClr : AppColors.whiteClr,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )
          : Text(
              title,
              style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 1.6,
                  color: isBorder ? AppColors.redClr : AppColors.whiteClr,
                  fontWeight: FontWeight.w500),
            ),
    );
  }
}
