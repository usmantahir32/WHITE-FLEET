import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/constants.dart';
import 'package:whitefleet/constants/images.dart';
import 'package:whitefleet/constants/snackbar.dart';
import 'package:whitefleet/controllers/deppos.dart';
import 'package:whitefleet/controllers/deppos.dart';
import 'package:whitefleet/controllers/driver_detail.dart';
import 'package:whitefleet/models/deppos.dart';
import 'package:whitefleet/models/deppos.dart';
import 'package:whitefleet/views/widgets/custom_snackbar.dart';
import 'package:whitefleet/views/widgets/loading.dart';
import 'package:whitefleet/views/widgets/no_data.dart';
import 'package:whitefleet/views/widgets/selected_tile.dart';
import '../../constants/colors.dart';
import '../../utils/size_config.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_search_field.dart';

class SearchDepposBS extends StatefulWidget {
  const SearchDepposBS({
    super.key,
  });

  @override
  State<SearchDepposBS> createState() => _SearchDepposBSState();
}

class _SearchDepposBSState extends State<SearchDepposBS>
    with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  TabController? _tabController;
  final cont = Get.put(DepposCont());
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
              "Search Deppos",
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
                cont.availDeppos.refresh();
              } else {
                cont.unavailDeppos.refresh();
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
                DepposAvailable(searchCont: searchController),
                DepposUnAvailable(searchCont: searchController)
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
                    if(cont.selectedDeppo.value!=null){
                      Get.back(result: cont.selectedDeppo.value);
                    }else{
                      showSnackbar(true, 'Please select deppo');
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

class DepposAvailable extends StatelessWidget {
  DepposAvailable({
    super.key,
    required this.searchCont,
  });
  final cont = Get.find<DepposCont>();
  final TextEditingController searchCont;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.heightMultiplier * 2),
        SizedBox(
          height: SizeConfig.heightMultiplier * 25,
          child: Obx(() {
            List<DeppoData>? deppos = cont.getAvailDeppos;
            if (deppos == null) {
              return LoadingWidget(height: SizeConfig.heightMultiplier * 25);
            } else {
              if (searchCont.text.isNotEmpty) {
                deppos = cont.getAvailDeppos!
                    .where((element) => element.name!
                        .toLowerCase()
                        .startsWith(searchCont.text.toLowerCase()))
                    .toList();
              } else {
                deppos = cont.getAvailDeppos!;
              }
              return deppos.isEmpty
                  ? NoDataWidget(text: 'No data')
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          ...List.generate(
                            deppos.length,
                            (index) => CustomSelectedTile(
                              isSelected: cont.selectedDeppo ==
                                  deppos![index],
                              onTap: () {
                                if (cont.selectedDeppo !=
                                    deppos![index]) {
                                  cont.selectedDeppo.value =
                                      deppos[index];
                                } else {
                                  cont.selectedDeppo.value = null;
                                }
                              },
                              text: deppos[index].name!,
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

class DepposUnAvailable extends StatelessWidget {
  DepposUnAvailable({
    super.key,
    required this.searchCont,
  });
  final cont = Get.find<DepposCont>();
  final TextEditingController searchCont;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.heightMultiplier * 2),
        SizedBox(
          height: SizeConfig.heightMultiplier * 25,
          child: Obx(() {
            List<DeppoData>? deppos = cont.getUnAvailDeppos;
            if (deppos == null) {
              return LoadingWidget(height: SizeConfig.heightMultiplier * 25);
            } else {
              if (searchCont.text.isNotEmpty) {
                deppos = cont.getUnAvailDeppos!
                    .where((element) => element.name!
                        .toLowerCase()
                        .startsWith(searchCont.text.toLowerCase()))
                    .toList();
              } else {
                deppos = cont.getUnAvailDeppos!;
              }
              return deppos.isEmpty
                  ? NoDataWidget(text: 'No data')
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          ...List.generate(
                            deppos.length,
                            (index) => CustomSelectedTile(
                              isSelected: cont.selectedDeppo.value ==
                                  deppos![index],
                              onRelease: () {},
                              onTap: () {},
                              text: deppos[index].name!,
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
