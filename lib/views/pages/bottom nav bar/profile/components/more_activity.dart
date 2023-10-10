import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/views/pages/employee%20document/emplyee_documents.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/decorations.dart';
import '../../../../../models/data.dart';
import '../../../../../utils/size_config.dart';

class MoreActivity extends StatelessWidget {
  const MoreActivity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: SizeConfig.widthMultiplier * 92,
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 4,
          vertical: SizeConfig.heightMultiplier * 2),
      decoration: AppDecorations.shadowBox,
      child: Column(
        children: [
          ...List.generate(
            moreTitle.length,
            (index) => GestureDetector(
              onTap: () {
                if (index == 1) {
                  Get.to(() => EmployeeDocumentScreeen(),
                      transition: Transition.rightToLeft);
                }
              },
              child: Container(
                height: SizeConfig.heightMultiplier * 9,
                width: SizeConfig.widthMultiplier * 100,
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 4),
                margin:
                    EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 1),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.greyClr),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      moreImages[index],
                      height: SizeConfig.imageSizeMultiplier * 12,
                    ),
                    SizedBox(width: SizeConfig.widthMultiplier * 4),
                    Text(
                      moreTitle[index],
                      style: textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
