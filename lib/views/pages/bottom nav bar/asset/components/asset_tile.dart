import 'package:flutter/material.dart';
import 'package:whitefleet/constants/decorations.dart';
import '../../../../../constants/colors.dart';
import '../../../../../utils/size_config.dart';

class AssetTile extends StatelessWidget {
  const AssetTile({
    super.key,
    required this.title,
    required this.images,
    required this.ontap,
    required this.color,
  });
  final String title, images;
  final VoidCallback ontap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: SizeConfig.heightMultiplier * 16,
        width: SizeConfig.widthMultiplier * 44,
        padding:
            EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 1.5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [AppDecorations.defaultShadow],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: textTheme.bodySmall!.copyWith(
                  color: AppColors.whiteClr, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 1),
            Image.asset(
              images,
              height: SizeConfig.imageSizeMultiplier * 18,
            )
          ],
        ),
      ),
    );
  }
}
