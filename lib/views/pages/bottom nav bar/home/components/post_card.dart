import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/decorations.dart';
import '../../../../../utils/size_config.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: SizeConfig.widthMultiplier * 100,
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 4,
          vertical: SizeConfig.heightMultiplier * 2),
      decoration: AppDecorations.whiteBox
          .copyWith(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.greyClr,
                backgroundImage: const AssetImage("assets/images/profile.jpg"),
                radius: SizeConfig.imageSizeMultiplier * 6,
              ),
              SizedBox(width: SizeConfig.widthMultiplier * 4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jennifer Clark",
                    style: textTheme.bodySmall!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Karmangala 5th block",
                    style: textTheme.displaySmall!.copyWith(
                        color: AppColors.textLightClr,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              const Spacer(),
              Icon(FeatherIcons.moreHorizontal,
                  color: Colors.grey.shade600,
                  size: SizeConfig.imageSizeMultiplier * 6),
            ],
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          index == 0
              ? Text(
                  "Nice to meet you all.Living in karmangala in 4 months.Looking forward to meet you all.",
                  style: textTheme.bodySmall!
                      .copyWith(fontSize: SizeConfig.textMultiplier * 1.5),
                )
              : ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                    'https://mecaluxcom.cdnwm.com/blog/img/warehouse-machines.1.2.jpg'),
              ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          Row(
            // mainAxisAlignment: MainAxisAlignment.s,
            children: [
              Icon(FeatherIcons.heart,
                  color: Colors.grey, size: SizeConfig.imageSizeMultiplier * 5),
              SizedBox(width: SizeConfig.widthMultiplier * 1),
              Text(
                "45",
                style: textTheme.bodyMedium,
              ),
              SizedBox(width: SizeConfig.widthMultiplier * 2),
              Icon(FeatherIcons.messageCircle,
                  color: Colors.grey, size: SizeConfig.imageSizeMultiplier * 5),
              SizedBox(width: SizeConfig.widthMultiplier * 1),
              Text(
                "5",
                style: textTheme.bodyMedium,
              ),
              SizedBox(width: SizeConfig.widthMultiplier * 2),
              Icon(FeatherIcons.share2,
                  color: Colors.grey, size: SizeConfig.imageSizeMultiplier * 5),
            ],
          )
        ],
      ),
    );
  }
}
