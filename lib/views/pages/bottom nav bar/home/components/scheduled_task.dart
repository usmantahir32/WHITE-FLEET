import 'package:flutter/material.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/decorations.dart';
import '../../../../../utils/size_config.dart';

class ScheduledTask extends StatefulWidget {
  const ScheduledTask({
    super.key,
  });

  @override
  State<ScheduledTask> createState() => _ScheduledTaskState();
}

class _ScheduledTaskState extends State<ScheduledTask> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: AppDecorations.whiteBox
          .copyWith(borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * .5),
      child: ExpansionTile(
        // collapsedIconColor: AppColors.whiteClr,
        iconColor: Colors.black,
        textColor: Colors.black,
        // collapsedTextColor: AppColors.whiteClr,
        // backgroundColor: AppColors.whiteClr,
        // collapsedBackgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        tilePadding:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 3),
        title: Row(
          children: [
            CircleAvatar(
              radius: SizeConfig.widthMultiplier * 6,
              backgroundColor: AppColors.randomAccentColors[1].withOpacity(0.4),
              child: Icon(Icons.calendar_month,
                  color: AppColors.randomAccentColors[1], size: 22),
            ),
            SizedBox(width: SizeConfig.widthMultiplier * 5),
            Text(
              "Scheduled Tasks (2/2)",
              style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 1.8,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        childrenPadding:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 2),
        children: [
          ...List.generate(
            2,
            (index) => Container(
              height: SizeConfig.heightMultiplier * 8,
              width: SizeConfig.widthMultiplier * 92,
              margin: EdgeInsets.only(top: SizeConfig.heightMultiplier * 2),
              decoration: AppDecorations.whiteBox,
              child: Row(
                children: [
                  Container(
                    width: SizeConfig.widthMultiplier * 3,
                    decoration: BoxDecoration(
                      color: AppColors.yellowClr,
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(6),
                      ),
                    ),
                  ),
                  SizedBox(width: SizeConfig.widthMultiplier * 3),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Quality Analysis Test",
                        style: TextStyle(
                                fontSize: SizeConfig.textMultiplier * 1.55)
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text("Duration: 30 min", style: textTheme.displaySmall),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier * 6,
                        vertical: SizeConfig.heightMultiplier * .5,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.primaryClr),
                      child: Text(
                        "Start",
                        style: textTheme.bodySmall!.copyWith(
                          color: AppColors.whiteClr,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: SizeConfig.widthMultiplier * 3),
                ],
              ),
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
        ],
      ),
    );
  }
}
