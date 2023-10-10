import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:whitefleet/constants/colors.dart';

class CustomReadMore extends StatelessWidget {
  const CustomReadMore({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ReadMoreText(text,
        trimLines: 1,
        trimMode: TrimMode.Line,
        style: textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.w500, color: AppColors.textMediumClr));
  }
}
