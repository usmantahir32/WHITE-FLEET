import 'package:flutter/material.dart';
import 'package:whitefleet/models/data.dart';
import '../../../../../constants/colors.dart';
import '../../../../../utils/size_config.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Align(
      alignment: Alignment.center,
      child: Container(
        // height: SizeConfig.heightMultiplier * 24,
        width: SizeConfig.widthMultiplier * 92,
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.heightMultiplier * 2,
            horizontal: SizeConfig.widthMultiplier * 4),
        decoration: BoxDecoration(
            boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 12)],
            borderRadius: BorderRadius.circular(16),
            color: AppColors.cardDarkColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: SizeConfig.imageSizeMultiplier * 8,
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage:
                      const AssetImage("assets/images/profile.jpg"),
                ),
                SizedBox(width: SizeConfig.widthMultiplier * 4),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "John Doe",
                      style: textTheme.bodyLarge!.copyWith(
                          color: AppColors.whiteClr,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "john@gmail.com",
                      style: textTheme.labelSmall,
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Divider(
                height: 0, thickness: 2, color: Colors.grey.withOpacity(0.2)),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _columnInfo('ID', '9QA82719', textTheme),
                _columnInfo('Bay', '14', textTheme)
              ],
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _columnInfo('Vehicle', 'BMI 24 -J', textTheme),
                _columnInfo('Wave', '10:00-12:00', textTheme),
              ],
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            //Achievements
            Text(
              'Achievements',
              style: textTheme.labelSmall,
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 1),
            Row(
              children: [
                ...List.generate(
                    achievements.length,
                    (index) => Padding(
                          padding: EdgeInsets.only(
                              right: SizeConfig.widthMultiplier * 1),
                          child: CircleAvatar(
                            radius: SizeConfig.widthMultiplier * 3.5,
                            backgroundColor: Colors.white.withOpacity(0.1),
                            child: Image.asset(
                              achievements[index],
                              height: SizeConfig.heightMultiplier * 2,
                            ),
                          ),
                        ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _columnInfo(String title, String subtitle, TextTheme textTheme) {
    return SizedBox(
      width: SizeConfig.widthMultiplier * 30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.labelSmall,
          ),
          Text(
            subtitle,
            style: textTheme.bodyLarge!.copyWith(
                color: AppColors.whiteClr, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
