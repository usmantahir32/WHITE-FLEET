import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/views/pages/bays/bays.dart';
import 'package:whitefleet/controllers/job_and_inven_controller.dart';
import 'package:whitefleet/views/pages/deppos/deppos.dart';
import 'package:whitefleet/views/pages/driver%20id/driver_id.dart';
import 'package:whitefleet/views/pages/pickups/pickups.dart';
import 'package:whitefleet/views/pages/route/routes.dart';
import 'package:whitefleet/views/pages/scanners/scanners.dart';
import 'package:whitefleet/views/pages/schools/schools.dart';
import 'package:whitefleet/views/pages/van%20rego/van_rego.dart';
import 'package:whitefleet/views/pages/wave/wave.dart';
import 'package:whitefleet/views/widgets/custom_appbar.dart';
import 'package:whitefleet/views/widgets/custom_btn.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/constants/constants.dart';
import 'package:whitefleet/constants/decorations.dart';
import 'package:whitefleet/utils/size_config.dart';
import '../../../models/data.dart';

class JobAndInventoryScreen extends StatelessWidget {
  JobAndInventoryScreen({super.key});
  final jobAndInvenCtrl = Get.put(JobAndInvenController());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const CustomAppbar(
        title: "Jobs & Inventory",
        isleading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                "Jobs",
                style: textTheme.headlineSmall,
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Container(
                height: SizeConfig.heightMultiplier * 29,
                width: SizeConfig.widthMultiplier * 100,
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.heightMultiplier * 2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [AppDecorations.defaultShadow]),
                child: Wrap(
                  runSpacing: SizeConfig.heightMultiplier * 2,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  runAlignment: WrapAlignment.center,
                  children: [
                    ...List.generate(
                      jobsTitle.length,
                      (index) => GestureDetector(
                        onTap: () {
                          if (index == 0) {
                            Get.to(() =>  RoutesScreen(),
                                transition: Transition.rightToLeft);
                          } else if (index == 1) {
                            Get.to(() => DepposScreen(),
                                transition: Transition.rightToLeft);
                          } else if (index == 2) {
                            Get.to(() => SchoolsScreen(),
                                transition: Transition.rightToLeft);
                          } else if (index == 3) {
                            Get.to(() => PickupScreen(),
                                transition: Transition.rightToLeft);
                          }
                        },
                        child: Container(
                          height: SizeConfig.heightMultiplier * 11,
                          width: SizeConfig.widthMultiplier * 24,
                          margin: EdgeInsets.only(left: SizeConfig.widthMultiplier*4),
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.heightMultiplier * 1),
                          decoration: BoxDecoration(
                            color: AppColors.cardClr,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [AppDecorations.defaultShadow],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                jobsTitle[index],
                                style: textTheme.bodySmall!.copyWith(
                                    color: AppColors.textClr,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: SizeConfig.heightMultiplier * 1),
                              Image.asset(
                                jobImages[index],
                                height: SizeConfig.imageSizeMultiplier * 11,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                  title: "Create New Job",
                  onTap: () {},
                  isLarged: true,
                  isIcon: true,
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                "Inventory",
                style: textTheme.headlineSmall,
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Container(
                height: SizeConfig.heightMultiplier * 29,
                width: SizeConfig.widthMultiplier * 100,
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.heightMultiplier * 2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [AppDecorations.defaultShadow]),
                child: Wrap(
                  runSpacing: SizeConfig.heightMultiplier * 2,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  runAlignment: WrapAlignment.center,
                  children: [
                    ...List.generate(
                      inventorysTitle.length,
                      (index) => GestureDetector(
                        onTap: () {
                          if (index == 0) {
                            Get.to(() => BayScreen(),
                                transition: Transition.rightToLeft);
                          } else if (index == 1) {
                            Get.to(() => WaveScreen(),
                                transition: Transition.rightToLeft);
                          } else if (index == 2) {
                            Get.to(() => DriverIdsScreen(),
                                transition: Transition.rightToLeft);
                          } else if (index == 3) {
                            Get.to(() => ScannerScreen(),
                                transition: Transition.rightToLeft);
                          } else if (index == 4) {
                            Get.to(() => VanRegoScreen(),
                                transition: Transition.rightToLeft);
                          }
                        },
                        child: Container(
                          height: SizeConfig.heightMultiplier * 11,
                          width: SizeConfig.widthMultiplier * 24,
                            margin: EdgeInsets.only(left: SizeConfig.widthMultiplier*4),
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.heightMultiplier * 1),
                          decoration: BoxDecoration(
                            color: AppColors.cardClr,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [AppDecorations.defaultShadow],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                inventorysTitle[index],
                                style: textTheme.bodySmall!.copyWith(
                                    color: AppColors.textClr,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: SizeConfig.heightMultiplier * 1),
                              Image.asset(
                                inventoryImages[index],
                                height: SizeConfig.imageSizeMultiplier * 11,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                  title: "Create Inventory",
                  onTap: () {},
                  isLarged: true,
                  isIcon: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
