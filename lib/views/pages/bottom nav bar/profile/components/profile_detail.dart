import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../../../constants/colors.dart';
import '../../../../../utils/size_config.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: SizeConfig.widthMultiplier * 100,
      color: AppColors.cardDarkColor,
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 4,
          vertical: SizeConfig.heightMultiplier * 2),
      child: Column(
        children: [
          _rowInfo('Experience', '2 years', textTheme),
          _rowInfo('Clock In', '05:10 AM', textTheme),
          _rowInfo('Total leaves', '5', textTheme),
          _rowInfo('Descipline', 'Good', textTheme),
          SizedBox(height: SizeConfig.heightMultiplier * 3),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: const [
            ProgressWidget(progressVal: 50, title: "Enquiries completion"),
            ProgressWidget(progressVal: 70, title: "Job rate"),
            ProgressWidget(progressVal: 100, title: "Task completion"),
            ProgressWidget(progressVal: 20, title: "Rating"),
          ])
        ],
      ),
    );
  }

  Widget _rowInfo(String title, String subtitle, TextTheme textTheme) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * .5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title :",
            style: textTheme.bodyMedium!.copyWith(color: AppColors.whiteClr),
          ),
          Text(
            subtitle,
            style: textTheme.bodyMedium!.copyWith(color: AppColors.primaryClr),
          )
        ],
      ),
    );
  }
}

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({
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
          width: SizeConfig.widthMultiplier * 23,
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
