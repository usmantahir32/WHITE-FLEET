import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:whitefleet/controllers/asset_controller.dart';
import 'package:whitefleet/views/widgets/custom_appbar.dart';
import 'package:whitefleet/views/widgets/custom_btn.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/widgets/custom_divider.dart';
import '../../../constants/constants.dart';
import '../../../models/data.dart';
import 'components/daily_chart.dart';
import 'components/earning_card.dart';
import 'components/my_activity_card.dart';

class MyEarningScreen extends StatelessWidget {
  MyEarningScreen({super.key});

  final assetCtrl = Get.put(AssetController());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Obx(
      () => Scaffold(
        appBar: const CustomAppbar(isleading: true, title: "Earning"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              DateRangeSelection(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              EarningCard(),
              Divider(
                  color: Colors.grey.shade300,
                  height: SizeConfig.heightMultiplier * 3),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 6),
                  child: Text(
                    "Daily Income Analysis",
                    style: textTheme.headlineSmall,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              DailyChart(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const CustomDivider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              MyActivityCard(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const CustomDivider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text("Download Payslip", style: textTheme.headlineSmall),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                "Select durantion",
                style: textTheme.bodySmall,
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    payslipDuration.length,
                    (index) => GestureDetector(
                      onTap: () {
                        assetCtrl.selectedPaySlip.value = index;
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.widthMultiplier * 3),
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.widthMultiplier * 2,
                            vertical: SizeConfig.heightMultiplier * 1),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: assetCtrl.selectedPaySlip.value == index
                                  ? AppColors.primaryClr
                                  : AppColors.greyClr),
                          color: assetCtrl.selectedPaySlip.value == index
                              ? AppColors.primaryClr
                              : AppColors.whiteClr,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          payslipDuration[index],
                          style: TextStyle(
                                  fontSize: SizeConfig.textMultiplier * 1.55)
                              .copyWith(
                                  color:
                                      assetCtrl.selectedPaySlip.value == index
                                          ? AppColors.whiteClr
                                          : AppColors.textClr),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              CustomButton(
                title: "Download",
                onTap: () {},
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 5)
            ],
          ),
        ),
      ),
    );
  }
}

class DateRangeSelection extends StatelessWidget {
  const DateRangeSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*5),
      child: Row(
        children: [
          Flexible(
            child: SizedBox(
              height: SizeConfig.heightMultiplier * 6,
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  suffixIcon: Icon(FeatherIcons.calendar,
                      size: SizeConfig.imageSizeMultiplier * 5.5),
                  hintText: "Start Date",
                  hintStyle: textTheme.bodyMedium!
                      .copyWith(color: AppColors.textMediumClr),
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: AppColors.greyClr)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: AppColors.greyClr)),
                ),
                style: textTheme.bodyMedium,
              ),
            ),
          ),
          SizedBox(width: SizeConfig.widthMultiplier * 4),
          Flexible(
            child: SizedBox(
              height: SizeConfig.heightMultiplier * 6,
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  suffixIcon: Icon(FeatherIcons.calendar,
                      size: SizeConfig.imageSizeMultiplier * 5.5),
                  hintText: "End Date",
                  hintStyle: textTheme.bodyMedium!
                      .copyWith(color: AppColors.textMediumClr),
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: AppColors.greyClr)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: AppColors.greyClr)),
                ),
                style: textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
