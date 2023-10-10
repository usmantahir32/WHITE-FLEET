import 'package:flutter/material.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/models/data.dart';
import '../../../../../utils/size_config.dart';

class AchievementAndRecord extends StatelessWidget {
  const AchievementAndRecord({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          ...List.generate(
            achievements.length,
            (index) => Container(
              height: SizeConfig.heightMultiplier * 18,
              width: SizeConfig.widthMultiplier * 90,
              margin: EdgeInsets.only(left: SizeConfig.widthMultiplier * 4),
              decoration: BoxDecoration(
                color: AppColors.randomAccentColors[index].withOpacity(.7),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.heightMultiplier * 1,
                  horizontal: SizeConfig.widthMultiplier * 4),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Best Salesperson",
                        style: textTheme.headlineLarge!.copyWith(
                            color: AppColors.whiteClr,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 50,
                        child: Text(
                          "Closed out 150 sales in Financial Year 2022.",
                          style: textTheme.bodySmall!.copyWith(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "January 25, 2023",
                        style: textTheme.bodySmall!.copyWith(
                            color: AppColors.whiteClr,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Transform.rotate(
                      angle: 56,
                      child: Image.asset(achievements[index],
                          height: SizeConfig.imageSizeMultiplier * 28),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: SizeConfig.widthMultiplier * 4)
        ],
      ),
    );
  }
}
