import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:whitefleet/constants/constants.dart';
import 'package:whitefleet/views/widgets/custom_search_field.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/constants/icons.dart';
import 'package:whitefleet/views/widgets/custom_btn.dart';
import '../../utils/size_config.dart';

class SearchTaskBottomSheet extends StatefulWidget {
  SearchTaskBottomSheet({
    super.key,
  });

  @override
  State<SearchTaskBottomSheet> createState() => _SearchTaskBottomSheetState();
}

class _SearchTaskBottomSheetState extends State<SearchTaskBottomSheet> {
  TextEditingController searchCotroller = TextEditingController();

  List<String> tasktitle = ["Deppo", "Pick Up", "School", "Homebase Transfer"];
  bool selectedTask = false;

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
          border: Border.all(color: Colors.black38),
          color: AppColors.whiteClr),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 4),
            child: Text(
              "Search Tasks",
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
            controller: searchCotroller,
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 1.5),
          Column(
            children: [
              ...List.generate(
                tasktitle.length,
                (index) => Container(
                  height: SizeConfig.heightMultiplier * 6,
                  width: SizeConfig.widthMultiplier * 92,
                  margin:
                      EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 3),
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: SizeConfig.imageSizeMultiplier * 4,
                        ),
                        SizedBox(width: SizeConfig.widthMultiplier * 4),
                        Text(
                          tasktitle[index],
                          style: textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.textMultiplier * 2),
                        ),
                        const Spacer(),
                        selectedTask
                            ? Icon(
                                FeatherIcons.checkCircle,
                                color: AppColors.greenClr,
                                size: SizeConfig.imageSizeMultiplier * 6,
                              )
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                    selectedTask = true;
                                  });
                                },
                                icon: Image.asset(
                                  AppIcons.plusOutlined,
                                  height: SizeConfig.imageSizeMultiplier * 6,
                                ))
                      ],
                    ),
                  ),
                ),
              ),
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
                      onTap: () {},
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
