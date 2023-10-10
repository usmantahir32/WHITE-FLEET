import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/controllers/bay.dart';
import 'package:whitefleet/controllers/driver_detail.dart';
import 'package:whitefleet/models/bay.dart';
import 'package:whitefleet/models/scanner.dart';
import 'package:whitefleet/views/widgets/loading.dart';
import 'package:whitefleet/views/widgets/no_data.dart';
import 'package:whitefleet/views/widgets/selected_tile.dart';
import '../../constants/colors.dart';
import '../../utils/size_config.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_search_field.dart';

class AssignBaysBS extends StatefulWidget {
  const AssignBaysBS({
    super.key,
  });

  @override
  State<AssignBaysBS> createState() => _AssignBaysBSState();
}

class _AssignBaysBSState extends State<AssignBaysBS>
    with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  TabController? _tabController;
  final cont = Get.put(BayCont());
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
              "Search Bays",
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
            onChange: (val) {
              if (_tabController!.index == 0) {
                cont.availBays.refresh();
              } else {
                cont.unAvailBays.refresh();
              }
            },
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          Container(
            height: SizeConfig.heightMultiplier * 5,
            margin: EdgeInsets.only(
              left: SizeConfig.widthMultiplier * 5,
              right: SizeConfig.widthMultiplier * 5,
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
                IdAvailableScanner(searchCont: searchController),
                IdUnAvailableScanner(searchCont: searchController)
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
                  onTap: () => Get.back(),
                  isBorder: true,
                ),
                CustomButton(
                  title: "Done",
                  onTap: () => Get.back(),
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

class IdAvailableScanner extends StatelessWidget {
  IdAvailableScanner({
    super.key,
    required this.searchCont,
  });
  final cont = Get.find<BayCont>();
  final detailCont = Get.find<DriverDetailCont>();
  final TextEditingController searchCont;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.heightMultiplier * 2),
        SizedBox(
          height: SizeConfig.heightMultiplier * 25,
          child: Obx(() {
            List<BayData>? baysIds = cont.getAvailBays;
            if (baysIds == null) {
              return LoadingWidget(height: SizeConfig.heightMultiplier * 25);
            } else {
              if (searchCont.text.isNotEmpty) {
                baysIds = cont.getAvailBays!
                    .where((element) => element.name!
                        .toLowerCase()
                        .startsWith(searchCont.text.toLowerCase()))
                    .toList();
              } else {
                baysIds = cont.getAvailBays!;
              }
              return baysIds.isEmpty
                  ? NoDataWidget(text: 'No data')
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          ...List.generate(
                            baysIds.length,
                            (index) => CustomSelectedTile(
                              isSelected: detailCont.selectedBays.value!.contains(baysIds![index]),
                              onTap: () {
                                if(detailCont.selectedBays.value!.contains(baysIds![index])){
                                  detailCont.selectedBays.value!.remove(baysIds[index]);
                                }else{
                                  detailCont.selectedBays.value!.add(baysIds[index]);
                                }
                                detailCont.selectedBays.refresh();
                                print(detailCont.selectedBays.value!.length);
                                // if (detailCont.selectedScannerID.value !=
                                //     baysIds![index]) {
                                //   detailCont.selectedScannerID.value =
                                //       baysIds[index];
                                // } else {
                                //   detailCont.selectedScannerID.value = null;
                                // }
                              },
                              text: baysIds[index].name!,
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

class IdUnAvailableScanner extends StatelessWidget {
  IdUnAvailableScanner({
    super.key,
    required this.searchCont,
  });
  final cont = Get.find<BayCont>();
  final detailCont = Get.find<DriverDetailCont>();
  final TextEditingController searchCont;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.heightMultiplier * 2),
        SizedBox(
          height: SizeConfig.heightMultiplier * 25,
          child: Obx(() {
            List<BayData>? baysIds = cont.getUnAvailBays;
            if (baysIds == null) {
              return LoadingWidget(height: SizeConfig.heightMultiplier * 25);
            } else {
              if (searchCont.text.isNotEmpty) {
                baysIds = cont.getUnAvailBays!
                    .where((element) => element.name!
                        .toLowerCase()
                        .startsWith(searchCont.text.toLowerCase()))
                    .toList();
              } else {
                baysIds = cont.getUnAvailBays!;
              }
              return baysIds.isEmpty
                  ? NoDataWidget(text: 'No data')
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          ...List.generate(
                            baysIds.length,
                            (index) => CustomSelectedTile(
                              isSelected: detailCont.selectedScannerID.value ==
                                  baysIds![index],
                              onTap: () {
                                // if (detailCont.selectedDriverID.value !=
                                //     baysIds![index]) {
                                //   detailCont.selectedDriverID.value =
                                //       baysIds[index];
                                // } else {
                                //   detailCont.selectedDriverID.value = null;
                                // }
                              },
                              onRelease: () {},
                              text: baysIds[index].name!,
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
