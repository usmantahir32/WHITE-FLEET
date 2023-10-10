import 'package:flutter/material.dart';
import '../../constants/decorations.dart';
import '../../utils/size_config.dart';

class CustomOnTapField extends StatelessWidget {
  CustomOnTapField(
      {super.key,
      required this.selectedVal,
      required this.hinttext,
      required this.onTap});
  final String hinttext;
  final String selectedVal;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeConfig.heightMultiplier * 4,
        width: SizeConfig.widthMultiplier * 55,
        decoration: AppDecorations.whiteBox,
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 4),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(selectedVal == '' ? hinttext : selectedVal,
              style: selectedVal == ''
                  ? textTheme.bodySmall
                  : textTheme.bodyMedium),
        ),
      ),
    );
  }
}
