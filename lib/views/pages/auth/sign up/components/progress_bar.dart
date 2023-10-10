import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/controllers/signup_cont.dart';
import 'package:whitefleet/utils/size_config.dart';

class CustomProgressBar extends StatelessWidget {
  final cont = Get.find<SignupCont>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.heightMultiplier * 4,
      width: SizeConfig.widthMultiplier * 90,
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(2, (index) {
              final Color selectedColor = AppColors.primaryClr;
              final bool isSelected = index < cont.currentSection.value;
              return SizedBox(
                height: SizeConfig.heightMultiplier * 4,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      height: 2,
                      width: index == 0
                          ? SizeConfig.widthMultiplier * 45
                          : SizeConfig.widthMultiplier * 40,
                      margin: EdgeInsets.only(
                          right:
                              index == 1 ? SizeConfig.widthMultiplier * 1 : 0,
                          left:
                              index == 0 ? SizeConfig.widthMultiplier * 1 : 0),
                      color: isSelected ? selectedColor : Colors.grey.shade200,
                    ),
                    index == 0
                        ? Positioned(
                            left: 0,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(Icons.circle,
                                    size: SizeConfig.widthMultiplier * 5,
                                    color: AppColors.primaryClr),
                                cont.currentSection.value > index
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 12,
                                      )
                                    : const SizedBox()
                              ],
                            ))
                        : const SizedBox(),
                    Positioned(
                        right: 0,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.circle,
                              size: SizeConfig.widthMultiplier * 5,
                              color: isSelected
                                  ? selectedColor
                                  : Colors.grey.shade200,
                            ),
                            cont.currentSection.value - 1 > index
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 12,
                                  )
                                : const SizedBox()
                          ],
                        ))
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
