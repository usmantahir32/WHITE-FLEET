import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/snackbar.dart';
import 'package:whitefleet/controllers/schools.dart';
import 'package:whitefleet/controllers/schools.dart';
import 'package:whitefleet/models/schools.dart';
import 'package:whitefleet/models/schools.dart';
import 'package:whitefleet/views/widgets/loading.dart';
import 'package:whitefleet/views/widgets/no_data.dart';
import 'package:whitefleet/views/widgets/selected_tile.dart';
import '../../constants/colors.dart';
import '../../utils/size_config.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_search_field.dart';
import 'package:whitefleet/controllers/driver_detail.dart';

class SearchSchoolsBS extends StatefulWidget {
  const SearchSchoolsBS({
    super.key,
  });

  @override
  State<SearchSchoolsBS> createState() => _SearchSchoolsBSState();
}

class _SearchSchoolsBSState extends State<SearchSchoolsBS>
    with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  TabController? _tabController;
  final cont = Get.put(SchoolsCont());
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: SizeConfig.heightMultiplier * 65,
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
              "Search Schools",
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
            onChange: (val) {
              if (_tabController!.index == 0) {
                cont.availSchools.refresh();
              } else {
                cont.unAvailSchools.refresh();
              }
            },
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
              borderRadius: BorderRadius.circular(8),
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
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SchoolsAvailable(searchCont: searchController),
                SchoolsUnAvailable(searchCont: searchController)
              ],
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 1),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  title: "Cancel",
                  onTap: () =>Get.back(),
                  isBorder: true,
                ),
                CustomButton(
                  title: "Done",
                  onTap: () {
                    if(cont.selectedSchool.value!=null){
                      Get.back(result: cont.selectedSchool.value);
                    }else{
                      showSnackbar(true, 'Please select school');
                    }
                  },
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

class SchoolsAvailable extends StatelessWidget {
  SchoolsAvailable({
    super.key,
    required this.searchCont,
  });
  final cont = Get.find<SchoolsCont>();
  final TextEditingController searchCont;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.heightMultiplier * 2),
        SizedBox(
          height: SizeConfig.heightMultiplier * 25,
          child: Obx(() {
            List<SchoolsData>? schools = cont.getAvailSchools;
            if (schools == null) {
              return LoadingWidget(height: SizeConfig.heightMultiplier * 25);
            } else {
              if (searchCont.text.isNotEmpty) {
                schools = cont.getAvailSchools!
                    .where((element) => element.name!
                        .toLowerCase()
                        .startsWith(searchCont.text.toLowerCase()))
                    .toList();
              } else {
                schools = cont.getAvailSchools!;
              }
              return schools.isEmpty
                  ? NoDataWidget(text: 'No data')
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          ...List.generate(
                            schools.length,
                            (index) => CustomSelectedTile(
                              isSelected: cont.selectedSchool.value ==
                                  schools![index],
                              onTap: () {
                                if (cont.selectedSchool.value !=
                                    schools![index]) {
                                  cont.selectedSchool.value =
                                      schools[index];
                                } else {
                                  cont.selectedSchool.value = null;
                                }
                              },
                              text: schools[index].name!,
                            ),
                          )
                        ],
                      ),
                    );
            }
          }),
        ),
      ],
    );
  }
}

class SchoolsUnAvailable extends StatelessWidget {
  SchoolsUnAvailable({
    super.key,
    required this.searchCont,
  });
  final cont = Get.find<SchoolsCont>();
  final TextEditingController searchCont;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.heightMultiplier * 2),
        SizedBox(
          height: SizeConfig.heightMultiplier * 25,
          child: Obx(() {
            List<SchoolsData>? schools = cont.getUnAvailSchools;
            if (schools == null) {
              return LoadingWidget(height: SizeConfig.heightMultiplier * 25);
            } else {
              if (searchCont.text.isNotEmpty) {
                schools = cont.getUnAvailSchools!
                    .where((element) => element.name!
                        .toLowerCase()
                        .startsWith(searchCont.text.toLowerCase()))
                    .toList();
              } else {
                schools = cont.getUnAvailSchools!;
              }
              return schools.isEmpty
                  ? NoDataWidget(text: 'No data')
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          ...List.generate(
                            schools.length,
                            (index) => CustomSelectedTile(
                              isSelected: cont.selectedSchool.value ==
                                  schools![index],
                              onRelease: () {},
                              onTap: () {},
                              text: schools[index].name!,
                            ),
                          )
                        ],
                      ),
                    );
            }
          }),
        ),
      ],
    );
  }
}
