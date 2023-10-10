import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:whitefleet/controllers/driver_controller.dart';
import 'package:whitefleet/controllers/driver_detail.dart';
import 'package:whitefleet/models/driver_details.dart';
import 'package:whitefleet/models/drivers.dart';
import 'package:whitefleet/views/pages/driver%20detail/components/progress.dart';
import '../../../../../constants/colors.dart';
import '../../../../../utils/size_config.dart';

class DriverProfileDetail extends StatelessWidget {
  DriverProfileDetail({
    super.key,
    required this.detailData,
    required this.data,
  });
  final DriverDetailData detailData;
  final DriverData data;
  final driverCtrl = Get.find<DriverDetailCont>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 400),
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
                      data.firstName! + ' ' + data.lastName!,
                      style: textTheme.bodyLarge!.copyWith(
                          color: AppColors.whiteClr,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                     data.email!,
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
                _columnInfo('Date of Birth', 'December, 07, 2020', textTheme),
                _columnInfo('Address', 'Pasadena, California', textTheme)
              ],
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _columnInfo('Phone Number', '+91 9883244432', textTheme),
                _columnInfo('Driving Preference', 'Automatic', textTheme),
              ],
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            driverCtrl.isShowMore.value
                ? Column(
                    children: [
                      Divider(
                          height: 0,
                          thickness: 2,
                          color: Colors.grey.withOpacity(0.2)),
                      SizedBox(height: SizeConfig.heightMultiplier * 2),
                      _rowInfo('Experience', '2 years', textTheme),
                      _rowInfo('Clock In', '05:10 AM', textTheme),
                      _rowInfo('Total leaves', '5', textTheme),
                      _rowInfo('Descipline', 'Good', textTheme),
                      SizedBox(height: SizeConfig.heightMultiplier * 3),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            DriverProgressWidget(
                                progressVal: 50, title: "Enquiries completion"),
                            DriverProgressWidget(
                                progressVal: 70, title: "Job rate"),
                            DriverProgressWidget(
                                progressVal: 100, title: "Task completion"),
                            DriverProgressWidget(
                                progressVal: 20, title: "Rating"),
                          ]),
                      SizedBox(height: SizeConfig.heightMultiplier * 2),
                    ],
                  )
                : const SizedBox(),
            Center(
              child: GestureDetector(
                onTap: () {
                  driverCtrl.isShowMore.value = !driverCtrl.isShowMore.value;
                },
                child: Container(
                  height: SizeConfig.heightMultiplier * 3.5,
                  width: SizeConfig.widthMultiplier * 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.textMediumClr),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        driverCtrl.isShowMore.value ? "show less" : "show more",
                        style: textTheme.bodySmall!.copyWith(
                            color: AppColors.whiteClr,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: SizeConfig.widthMultiplier * 3),
                      Icon(
                        driverCtrl.isShowMore.value
                            ? FeatherIcons.arrowUpCircle
                            : FeatherIcons.arrowDownCircle,
                        color: AppColors.whiteClr,
                        size: SizeConfig.imageSizeMultiplier * 5,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _columnInfo(String title, String subtitle, TextTheme textTheme) {
    return SizedBox(
      width: SizeConfig.widthMultiplier * 37,
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
