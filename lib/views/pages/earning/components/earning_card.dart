import 'package:flutter/material.dart';
import '../../../../Constants/colors.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/icons.dart';
import '../../../../utils/size_config.dart';

class EarningCard extends StatelessWidget {
  const EarningCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*5),
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 4,
          vertical: SizeConfig.heightMultiplier * 2),
      decoration: BoxDecoration(
          boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 12)],
          borderRadius: BorderRadius.circular(12),
          color: AppColors.cardDarkColor),
      child: Row(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total',
                style: textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.w600, color: Colors.grey)),
            //TOTAL
            Text('56,750 \$',
                style: textTheme.headlineLarge!.copyWith(
                    color: Colors.white,
                    fontSize: SizeConfig.textMultiplier * 4,
                    fontWeight: FontWeight.w500)),
            //TOTAL DELIVERIES
            Text('From 215 deliveries',
                style: textTheme.bodySmall!
                    .copyWith(fontWeight: FontWeight.w600, color: Colors.grey)),
          ],
        ),
        const Spacer(),
        Image.asset(
          AppIcons.money,
          height: SizeConfig.heightMultiplier * 10,
        )
      ]),
    );
  }
}
