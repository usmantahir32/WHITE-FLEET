import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/controllers/driver_detail.dart';
import 'package:whitefleet/controllers/driver_ids.dart';
import 'package:whitefleet/models/driver_ids.dart';
import 'package:whitefleet/views/widgets/loading.dart';
import 'package:whitefleet/views/widgets/no_data.dart';
import 'package:whitefleet/views/widgets/selected_tile.dart';
import '../../constants/colors.dart';
import '../../utils/size_config.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_search_field.dart';

class AssignDriverIdBS extends StatefulWidget {
  const AssignDriverIdBS({
    super.key,
  });

  @override
  State<AssignDriverIdBS> createState() => _AssignDriverIdBSState();
}

class _AssignDriverIdBSState extends State<AssignDriverIdBS>
    with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  TabController? _tabController;
  final cont = Get.put(DriverIdsCont());
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
              "Search Id",
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
                cont.availDriverIDs.refresh();
              } else {
                cont.unAvailDriverIDs.refresh();
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
                IdAvailable(searchCont: searchController),
                IdUnAvailable(searchCont: searchController)
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

class IdAvailable extends StatelessWidget {
  IdAvailable({
    super.key,
    required this.searchCont,
  });
  final cont = Get.find<DriverIdsCont>();
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
            List<DriverIdsData>? driverIds = cont.getAvailDriverIDs;
            if (driverIds == null) {
              return LoadingWidget(height: SizeConfig.heightMultiplier * 25);
            } else {
              if (searchCont.text.isNotEmpty) {
                driverIds = cont.getAvailDriverIDs!
                    .where((element) => element.temparoryId!
                        .toLowerCase()
                        .startsWith(searchCont.text.toLowerCase()))
                    .toList();
              } else {
                driverIds = cont.getAvailDriverIDs!;
              }
              return driverIds.isEmpty
                  ? NoDataWidget(text: 'No data')
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          ...List.generate(
                            driverIds.length,
                            (index) => CustomSelectedTile(
                              isSelected: detailCont.selectedDriverID.value ==
                                  driverIds![index],
                              onTap: () {
                                if (detailCont.selectedDriverID.value !=
                                    driverIds![index]) {
                                  detailCont.selectedDriverID.value =
                                      driverIds[index];
                                } else {
                                  detailCont.selectedDriverID.value = null;
                                }
                              },
                              text: driverIds[index].temparoryId!,
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

class IdUnAvailable extends StatelessWidget {
  IdUnAvailable({
    super.key,
    required this.searchCont,
  });
  final cont = Get.find<DriverIdsCont>();
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
            List<DriverIdsData>? driverIds = cont.getUnAvailDriverIDs;
            if (driverIds == null) {
              return LoadingWidget(height: SizeConfig.heightMultiplier * 25);
            } else {
              if (searchCont.text.isNotEmpty) {
                driverIds = cont.getUnAvailDriverIDs!
                    .where((element) => element.temparoryId!
                        .toLowerCase()
                        .startsWith(searchCont.text.toLowerCase()))
                    .toList();
              } else {
                driverIds = cont.getUnAvailDriverIDs!;
              }
              return driverIds.isEmpty
                  ? NoDataWidget(text: 'No data')
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          ...List.generate(
                            driverIds.length,
                            (index) => CustomSelectedTile(
                              isSelected: detailCont.selectedDriverID.value ==
                                  driverIds![index],
                              onTap: () {
                                // if (detailCont.selectedDriverID.value !=
                                //     driverIds![index]) {
                                //   detailCont.selectedDriverID.value =
                                //       driverIds[index];
                                // } else {
                                //   detailCont.selectedDriverID.value = null;
                                // }
                              },
                              onRelease: () {},
                              text: driverIds[index].temparoryId!,
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
