import 'package:flutter/material.dart';
import 'package:whitefleet/utils/size_config.dart';
import '../../constants/colors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.isBorder = false,
  }) : super(key: key);
  final VoidCallback onTap;
  final bool isBorder;
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: SizeConfig.heightMultiplier * 6,
      minWidth: SizeConfig.widthMultiplier * 90,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: isBorder ? AppColors.textClr : AppColors.primaryClr),
        borderRadius: BorderRadius.circular(12),
      ),
      color: isBorder ? Colors.white : AppColors.primaryClr,
      onPressed: onTap,
      child: Text(
        title,
        style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 1.6,
            color: isBorder ? AppColors.textClr : AppColors.whiteClr,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
