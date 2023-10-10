import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/views/widgets/custom_btn.dart';
import 'package:whitefleet/views/widgets/id_tile.dart';
import '../../constants/constants.dart';
import '../../utils/size_config.dart';
import '../widgets/custom_search_field.dart';

// ignore: must_be_immutable
class SearchDriverBottomSheet extends StatelessWidget {
  SearchDriverBottomSheet({
    super.key,
  });
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: SizeConfig.heightMultiplier * 80,
      width: SizeConfig.widthMultiplier * 100,
      padding: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 2),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(16),
          ),
          color: AppColors.whiteClr),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 4),
            child: Text(
              "Search Drivers",
              style: textTheme.headlineMedium,
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 1),
          const Divider(
            height: 0,
            thickness: 2,
            color: Colors.black26,
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          CustomSearchField(
            hintText: "Search",
            controller: searchController,
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 1.5),
          SizedBox(
            height: SizeConfig.heightMultiplier * 50,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(
                    10,
                    (index) => IdTile(
                      index: 0,
                      image: "assets/images/profile.jpg",
                      title: "Jim Halpert",
                      id: "AHG324324324",
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  title: "Cancel",
                  onTap: () {},
                  isBorder: true,
                ),
                CustomButton(
                  title: "Done",
                  onTap: () {
                    Get.back();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
