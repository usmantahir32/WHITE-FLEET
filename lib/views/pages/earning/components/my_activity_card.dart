import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:whitefleet/constants/constants.dart';
import '../../../../Constants/colors.dart';
import '../../../../constants/decorations.dart';
import '../../../../utils/size_config.dart';

class MyActivityCard extends StatelessWidget {
  const MyActivityCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("My Activity", style: textTheme.headlineSmall),
          ),
        ),
        ...List.generate(
          2,
          (index) => Container(
            width: SizeConfig.widthMultiplier * 92,
            margin: EdgeInsets.only(top: SizeConfig.heightMultiplier * 2),
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 4,
                vertical: SizeConfig.heightMultiplier * 1),
            decoration: AppDecorations.whiteBox,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: SizeConfig.heightMultiplier * 5,
                      width: SizeConfig.widthMultiplier * 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.primaryClr.withOpacity(.4)),
                      child: Center(
                        child: Icon(
                          FeatherIcons.briefcase,
                          color: AppColors.primaryClr,
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.widthMultiplier * 4),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\$70",
                          style: textTheme.bodyMedium!.copyWith(
                              color: AppColors.primaryClr,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Spanbit Depot",
                          style: TextStyle(
                                  fontSize: SizeConfig.textMultiplier * 1.55)
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 2),
                Row(
                  children: [
                    CircleAvatar(
                      radius: SizeConfig.imageSizeMultiplier * 4,
                      backgroundColor: Colors.grey.shade300,
                      backgroundImage: AssetImage("assets/images/profile.jpg"),
                    ),
                    SizedBox(width: SizeConfig.widthMultiplier * 4),
                    Text(
                      "Emily Nelson",
                      style: textTheme.bodySmall,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: SizeConfig.widthMultiplier * 28,
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.widthMultiplier * 2,
                            vertical: SizeConfig.heightMultiplier * .5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: AppColors.greenClr),
                        child: Center(
                          child: Text(
                            "Completed",
                            style: textTheme.bodySmall!.copyWith(
                                color: AppColors.whiteClr,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.grey,
                ),
                Text(
                  "Due in 13h 36m",
                  style: textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
