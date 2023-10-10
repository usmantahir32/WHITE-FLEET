import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/widgets/auth_button.dart';
import 'package:whitefleet/views/widgets/loading.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onContinue,
      this.height});
  final String title, subtitle;
  final VoidCallback onContinue;
  final double? height;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          height: height ?? SizeConfig.heightMultiplier * 35,
          width: SizeConfig.widthMultiplier * 75,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthMultiplier * 6,
              vertical: SizeConfig.heightMultiplier * 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: SizeConfig.widthMultiplier * 70,
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: textTheme.headlineSmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 3),
              Text(subtitle,
                  textAlign: TextAlign.center, style: textTheme.bodyMedium),
              SizedBox(height: SizeConfig.heightMultiplier * 3),
              Obx(
                () => authCont.isLoading.value
                    ? LoadingWidget(height: SizeConfig.heightMultiplier * 11.5)
                    : Column(
                        children: [
                          AuthButton(title: 'Continue', onTap: onContinue),
                          TextButton(
                              onPressed: () => Get.back(),
                              child: Text(
                                'Cancel',
                                style: textTheme.bodyMedium,
                              ))
                        ],
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
