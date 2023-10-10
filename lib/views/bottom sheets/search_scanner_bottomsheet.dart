import 'package:flutter/material.dart';
import 'package:whitefleet/constants/constants.dart';
import '../../constants/colors.dart';
import '../../utils/size_config.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_search_field.dart';
import '../widgets/id_tile.dart';

class SearchScannerBottomSheet extends StatefulWidget {
  const SearchScannerBottomSheet({
    super.key,
  });

  @override
  State<SearchScannerBottomSheet> createState() =>
      _SearchScannerBottomSheetState();
}

class _SearchScannerBottomSheetState extends State<SearchScannerBottomSheet>
    with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: SizeConfig.heightMultiplier * 80,
      width: SizeConfig.widthMultiplier * 100,
      padding: EdgeInsets.only(top: SizeConfig.heightMultiplier * 2),
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
              "Search Scanner",
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
          Container(
            height: SizeConfig.heightMultiplier * 5,
            margin: EdgeInsets.only(
              left: SizeConfig.widthMultiplier * 4,
              right: SizeConfig.widthMultiplier * 4,
            ),
            decoration: BoxDecoration(
              color: const Color(0xffE2E5EC),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              unselectedLabelColor: AppColors.primaryClr,
              labelColor: Colors.white,
              labelPadding: EdgeInsets.zero,
              tabs: const [
                Tab(text: "Available"),
                Tab(text: "Un Available"),
              ],
              unselectedLabelStyle:
                  textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
              labelStyle:
                  textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
              indicator: BoxDecoration(
                color: AppColors.primaryClr,
                gradient: LinearGradient(colors: [
                  AppColors.primaryClr,
                  AppColors.primaryClr.withOpacity(.6)
                ]),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [SearchAvailable(), SearchUnAvailable()],
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 1),
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
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 5),
        ],
      ),
    );
  }
}

class SearchAvailable extends StatelessWidget {
  const SearchAvailable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.heightMultiplier * 2),
        SizedBox(
          height: SizeConfig.heightMultiplier * 45,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...List.generate(
                  10,
                  (index) => IdTile(
                    index: 0,
                    image: "assets/images/profile.jpg",
                    title: "Stanley Hudson",
                    id: "AGH72394624",
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SearchUnAvailable extends StatelessWidget {
  const SearchUnAvailable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.heightMultiplier * 2),
        SizedBox(
          height: SizeConfig.heightMultiplier * 45,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...List.generate(
                  10,
                  (index) => IdTile(
                    index: 1,
                    image: "assets/images/profile.jpg",
                    title: "Stanley Hudson",
                    id: "AGH72394624",
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
