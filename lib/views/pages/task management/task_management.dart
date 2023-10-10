import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/constants/images.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/pages/map/admin_map.dart';
import 'package:whitefleet/views/pages/map/driver_map.dart';
import 'package:whitefleet/views/widgets/custom_appbar.dart';

class TaskManagementScreen extends StatelessWidget {
  const TaskManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    List<String> taskManagementImages = [
      AppImages.route,
      AppImages.route,
      AppImages.school,
      AppImages.deppo,
      AppImages.deppo,
      AppImages.deppo,
      AppImages.deppo,
      AppImages.task
    ];
    List<String> taskmanagementTitles = [
      "Route",
      "Second Run",
      "School",
      "Deppo",
      "Pick Up",
      "Others",
      "Homebase Transfer",
      "Training Task"
    ];
    return Scaffold(
      appBar: const CustomAppbar(isleading: true, title: "Task Management"),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            ...List.generate(
                taskmanagementTitles.length,
                (index) => GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Get.to(() => AdminMapScreen(),
                              transition: Transition.rightToLeft);
                        } else if (index == 1) {
                          Get.to(() => DriverMapScreen(),
                              transition: Transition.rightToLeft);
                        }
                      },
                      child: Container(
                        width: SizeConfig.widthMultiplier * 92,
                        margin: EdgeInsets.only(
                            bottom: SizeConfig.heightMultiplier * 1.5),
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.widthMultiplier * 4,
                            vertical: SizeConfig.heightMultiplier * 1),
                        decoration: BoxDecoration(
                          color: const Color(0xffE4EEFF),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              taskManagementImages[index],
                              height: SizeConfig.imageSizeMultiplier * 10,
                            ),
                            SizedBox(width: SizeConfig.widthMultiplier * 8),
                            Text(
                              taskmanagementTitles[index],
                              style: textTheme.bodyMedium!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            const Spacer(),
                            Container(
                              height: SizeConfig.heightMultiplier * 4,
                              width: SizeConfig.widthMultiplier * 8,
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.greyClr),
                              child: Center(
                                child: Text(
                                  "31",
                                  style: textTheme.bodySmall!
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}
