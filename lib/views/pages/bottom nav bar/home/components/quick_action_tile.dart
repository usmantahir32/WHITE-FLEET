import 'package:flutter/material.dart';
import '../../../../../constants/colors.dart';
import '../../../../../utils/size_config.dart';

class QuickActionTile extends StatelessWidget {
  const QuickActionTile({
    super.key,
    required this.title,
    required this.images,
    required this.ontap,
  });

  final String title, images;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            height: SizeConfig.heightMultiplier * 6,
            width: SizeConfig.widthMultiplier * 14,
            decoration: BoxDecoration(
              color: AppColors.cardClr,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Image.asset(images,
                  height: SizeConfig.imageSizeMultiplier * 8),
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 1),
          Text(
            title,
            style:
                textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
