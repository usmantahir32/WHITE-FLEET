import 'package:flutter/material.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/constants/constants.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/pages/bottom%20nav%20bar/profile/components/performance_chart.dart';
import 'package:whitefleet/views/pages/bottom%20nav%20bar/profile/components/weekly_chart.dart';
import 'package:whitefleet/views/widgets/custom_divider.dart';
import '../../../../models/data.dart';
import 'components/achievement_and_record.dart';
import 'components/more_activity.dart';
import 'components/profile_detail.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteClr,
        elevation: 0,
        leadingWidth: 0,
        title: Text(
          "John Doe",
          style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: SizeConfig.widthMultiplier * 4),
            child: CircleAvatar(
              radius: SizeConfig.imageSizeMultiplier * 5,
              backgroundColor: AppColors.greyClr,
              backgroundImage: const AssetImage("assets/images/profile.jpg"),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileDetail(),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            const AchievementAndRecord(),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            const CustomDivider(),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 6),
                child: Text(
                  "Reports",
                  style: textTheme.headlineMedium,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            WeeklyChart(),
            SizedBox(height: SizeConfig.heightMultiplier * 1),
            Text(
              "weekly task completion analysis",
              style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            ChartView(),
            SizedBox(height: SizeConfig.heightMultiplier * 1),
            Text(
              "weekly performance analysis",
              style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            const CustomDivider(),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 6),
                child: Text(
                  "Edit Details",
                  style: textTheme.headlineMedium,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  editDetailsTitle.length,
                  (index) => Column(
                    children: [
                      Container(
                        height: SizeConfig.heightMultiplier * 8,
                        width: SizeConfig.widthMultiplier * 17,
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.widthMultiplier * 3),
                        decoration: BoxDecoration(
                          color: editDetailColors[index],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Image.asset(
                            editDetailIcons[index],
                            height: SizeConfig.imageSizeMultiplier * 12,
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.heightMultiplier * 1),
                      Text(editDetailsTitle[index],
                          style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 1.55))
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            const CustomDivider(),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 6),
                child: Text(
                  "More",
                  style: textTheme.headlineMedium,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            const MoreActivity(),
            SizedBox(height: SizeConfig.heightMultiplier * 2)
          ],
        ),
      ),
    );
  }
}
