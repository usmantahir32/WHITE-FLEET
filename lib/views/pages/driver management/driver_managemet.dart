import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/controllers/drivers.dart';
import 'package:whitefleet/models/drivers.dart';
import 'package:whitefleet/views/pages/driver%20detail/driver_detail.dart';
import 'package:whitefleet/views/widgets/custom_appbar.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/widgets/loading.dart';
import 'package:whitefleet/views/widgets/no_data.dart';

class DriverManagementScreen extends StatelessWidget {
  DriverManagementScreen({super.key});
  final cont = Get.put(DriversCont());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: "Driver Management", isleading: true),
      body: Obx(
        () => cont.getDrivers == null
            ? LoadingWidget(height: SizeConfig.heightMultiplier * 80)
            : Center(
                child: cont.getDrivers!.data!.isEmpty
                    ? NoDataWidget(text: 'No drivers found yet!')
                    : Column(
                        children: [
                          SizedBox(height: SizeConfig.heightMultiplier * 2),
                          ...List.generate(cont.getDrivers!.data!.length,
                              (index) {
                            return GestureDetector(
                              onTap: () => Get.to(
                                  () => DriverDetailScreen(
                                      data: cont.getDrivers!.data![index]),
                                  transition: Transition.rightToLeft),
                              child: DriverTile(
                                  data: cont.getDrivers!.data![index]),
                            );
                          })
                        ],
                      ),
              ),
      ),
    );
  }
}

class DriverTile extends StatelessWidget {
  const DriverTile({
    super.key,
    required this.data,
  });

  final DriverData data;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: SizeConfig.widthMultiplier * 92,
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 4,
          vertical: SizeConfig.heightMultiplier * 2),
      margin: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyClr),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: SizeConfig.imageSizeMultiplier * 9,
            backgroundColor: AppColors.greyClr,
            backgroundImage: const AssetImage("assets/images/profile.jpg"),
          ),
          SizedBox(width: SizeConfig.widthMultiplier * 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.firstName! + ' ' + data.lastName!,
                style: textTheme.bodyLarge!.copyWith(
                    color: AppColors.textClr, fontWeight: FontWeight.w600),
              ),
              Text(
                "New South Wales, Australia",
                style: textTheme.bodySmall!.copyWith(
                    color: AppColors.textMediumClr,
                    fontSize: SizeConfig.textMultiplier * 1.5,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                data.email!,
                style: textTheme.displaySmall!.copyWith(
                    color: AppColors.textMediumClr,
                    fontWeight: FontWeight.w500),
              )
            ],
          )
        ],
      ),
    );
  }
}
