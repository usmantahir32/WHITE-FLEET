import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.greyClr,
      height: 0,
      thickness: 3,
    );
  }
}
