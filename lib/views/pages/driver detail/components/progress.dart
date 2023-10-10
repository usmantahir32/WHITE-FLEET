import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../../constants/colors.dart';
import '../../../../utils/size_config.dart';

class DriverProgressWidget extends StatelessWidget {
  const DriverProgressWidget({
    super.key,
    required this.progressVal,
    required this.title,
  });

  final double progressVal;
  final String title;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularPercentIndicator(
          animation: true,
          radius: 32,
          animationDuration: 1100,
          percent: progressVal / 100,
          center: Text(
            "${progressVal.toInt()}%",
            style: textTheme.bodyLarge!.copyWith(color: AppColors.whiteClr),
          ),
          lineWidth: 2,
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: Colors.grey,
          progressColor: AppColors.primaryClr,
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 2),
        SizedBox(
          width: SizeConfig.widthMultiplier * 21,
          child: Text(
            textAlign: TextAlign.center,
            title,
            style: textTheme.bodySmall!.copyWith(color: AppColors.whiteClr),
          ),
        )
      ],
    );
  }
}
