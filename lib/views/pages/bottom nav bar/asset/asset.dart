import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/views/pages/achievement/achievement.dart';
import 'package:whitefleet/views/pages/bottom%20nav%20bar/asset/components/asset_tile.dart';
import 'package:whitefleet/views/pages/earning/my_earning.dart';
import 'package:whitefleet/views/pages/employee%20document/emplyee_documents.dart';
import 'package:whitefleet/views/widgets/custom_appbar.dart';
import 'package:whitefleet/views/widgets/custom_search_field.dart';

import '../../../../models/data.dart';

// ignore: must_be_immutable
class AssetScreen extends StatelessWidget {
  AssetScreen({super.key});
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppbar(title: "Assets"),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: size.height*0.01),
            CustomSearchField(hintText: "Search", controller: searchController),
            SizedBox(height:size.height*0.03),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Wrap(
                  runSpacing: size.height*0.02,
                  alignment: WrapAlignment.center,
                  spacing: size.width*0.05,
                  children: [
                    ...List.generate(
                      assetTitle.length,
                      (index) => AssetTile(
                        title: assetTitle[index],
                        images: assetImages[index],
                        color:
                            AppColors.randomAccentColors[index].withOpacity(.7),
                        ontap: () {
                          if (index == 1) {
                            Get.to(() => MyEarningScreen(),
                                transition: Transition.rightToLeft);
                          } else if (index == 2) {
                            Get.to(() => AchievementScreen(),
                                transition: Transition.rightToLeft);
                          } else if (index == 4) {
                            Get.to(() => EmployeeDocumentScreeen(),
                                transition: Transition.rightToLeft);
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
              SizedBox(height:size.height*0.03),
          ],
        ),
      ),
    );
  }
}
