import 'package:flutter/material.dart';
import '../../../../../constants/colors.dart';
import '../../../../../utils/size_config.dart';

class OngoingShiftDetail extends StatelessWidget {
  const OngoingShiftDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: SizeConfig.widthMultiplier * 100,
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 4,
          vertical: SizeConfig.heightMultiplier * 2),
      decoration: BoxDecoration(
         boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 12)],
          borderRadius: BorderRadius.circular(12),
          color: AppColors.cardDarkColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ongoing Shift",
                style: textTheme.labelSmall,
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 1),
              Row(
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(right: SizeConfig.widthMultiplier * 4),
                    height: SizeConfig.heightMultiplier * 1.5,
                    width: SizeConfig.widthMultiplier * 3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.greenClr, width: 1.5),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier * 2,
                        vertical: SizeConfig.heightMultiplier * .5),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "MCG Sydney",
                      style: textTheme.displaySmall!
                          .copyWith(color: AppColors.whiteClr),
                    ),
                  )
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Started at 1:02 pm",
                style: textTheme.labelSmall,
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 1),
              Row(
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(right: SizeConfig.widthMultiplier * 4),
                    height: SizeConfig.heightMultiplier * 1.5,
                    width: SizeConfig.widthMultiplier * 3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: AppColors.yellowClr, width: 1.5),
                    ),
                  ),
                  Text(
                    "08:12:37",
                    style: textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  )
                ],
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(SizeConfig.widthMultiplier * 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white.withOpacity(0.1),
            ),
            child: Icon(Icons.arrow_forward_ios_rounded,
                color: AppColors.whiteClr,
                size: SizeConfig.imageSizeMultiplier * 4),
          )
        ],
      ),
    );
  }
}
