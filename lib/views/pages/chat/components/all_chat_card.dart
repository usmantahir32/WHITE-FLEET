import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';
import '../../../../utils/size_config.dart';

class AllChatCard extends StatelessWidget {
  const AllChatCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.heightMultiplier * 1.5,
          horizontal: SizeConfig.widthMultiplier * 4),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/profile.jpg"),
            backgroundColor: AppColors.greyClr,
            radius: SizeConfig.imageSizeMultiplier * 7,
          ),
          SizedBox(width: SizeConfig.widthMultiplier * 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sales team",
                style:
                    textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 1),
              Text(
                "Danny, Bobby, Morrison",
                style: textTheme.bodySmall!
                    .copyWith(color: AppColors.textMediumClr),
              )
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Text(
                "23 March",
                style: textTheme.bodySmall!
                    .copyWith(color: AppColors.textMediumClr),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 1),
              Visibility(
                visible: true,
                child: Text(
                  "Team Chat",
                  style: textTheme.bodySmall,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
