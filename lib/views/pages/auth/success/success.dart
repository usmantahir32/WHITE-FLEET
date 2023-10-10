import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/constants.dart';
import 'package:whitefleet/constants/icons.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/widgets/auth_button.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.btnText,
      required this.btnTap});
  final String title, subtitle, btnText;
  final VoidCallback btnTap;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*5),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.heightMultiplier * 6),
            Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.arrow_back_ios_new)),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 8),
            Image.asset(
              AppIcons.success,
              height: SizeConfig.heightMultiplier * 11,
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 3),
            Text(title, style: textTheme.headlineLarge),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 9,
                  vertical: SizeConfig.heightMultiplier * 1.5),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium!.copyWith(
                    fontSize: SizeConfig.textMultiplier * 1.5,
                    color: Colors.blueGrey.shade300,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            AuthButton(title: btnText, onTap: btnTap),
          ],
        ),
      ),
    );
  }
}
