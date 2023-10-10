import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:whitefleet/views/pages/enquiries/enquiries.dart';
import 'package:whitefleet/views/widgets/custom_appbar.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/constants/images.dart';
import 'package:whitefleet/utils/size_config.dart';

class EmployeeDocumentScreeen extends StatelessWidget {
  const EmployeeDocumentScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const CustomAppbar(isleading: true, title: "Employee Documents"),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mandatory Documents",
              style:
                  textTheme.headlineMedium!.copyWith(color: AppColors.textClr),
            ),
            ...List.generate(
              4,
              (index) => GestureDetector(
                onTap: () {
                  Get.to(() => EnquirieScreen(),
                      transition: Transition.rightToLeft);
                },
                child: Container(
                  height: SizeConfig.heightMultiplier * 8,
                  width: SizeConfig.widthMultiplier * 92,
                  margin: EdgeInsets.only(top: SizeConfig.heightMultiplier * 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.greyClr),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: SizeConfig.widthMultiplier * 3,
                        decoration: BoxDecoration(
                          color: AppColors.primaryClr,
                          borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(6),
                          ),
                        ),
                      ),
                      SizedBox(width: SizeConfig.widthMultiplier * 3),
                      Image.asset(
                        AppImages.id,
                        height: SizeConfig.imageSizeMultiplier * 10,
                      ),
                      SizedBox(width: SizeConfig.widthMultiplier * 4),
                      Text(
                        "Australia Post Id",
                        style: TextStyle(
                                fontSize: SizeConfig.textMultiplier * 1.55)
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.widthMultiplier * 2,
                            vertical: SizeConfig.heightMultiplier * .5,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: AppColors.primaryClr),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                FeatherIcons.uploadCloud,
                                color: AppColors.whiteClr,
                              ),
                              SizedBox(width: SizeConfig.widthMultiplier * 2),
                              Text(
                                "Upload",
                                style: TextStyle(
                                        fontSize:
                                            SizeConfig.textMultiplier * 1.55)
                                    .copyWith(color: AppColors.whiteClr),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: SizeConfig.widthMultiplier * 3),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
