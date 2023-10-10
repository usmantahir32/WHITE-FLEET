import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/constants.dart';
import 'package:whitefleet/controllers/driver_detail.dart';
import 'package:whitefleet/controllers/driver_ids.dart';
import 'package:whitefleet/controllers/scanners.dart';
import 'package:whitefleet/models/driver_ids.dart';
import 'package:whitefleet/models/scanner.dart';
import 'package:whitefleet/views/widgets/loading.dart';
import 'package:whitefleet/views/widgets/no_data.dart';
import 'package:whitefleet/views/widgets/selected_tile.dart';
import '../../constants/colors.dart';
import '../../utils/size_config.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_search_field.dart';
import '../widgets/id_tile.dart';

class AssignScannerIdBS extends StatefulWidget {
  const AssignScannerIdBS({
    super.key,
  });

  @override
  State<AssignScannerIdBS> createState() => _AssignScannerIdBSState();
}

class _AssignScannerIdBSState extends State<AssignScannerIdBS>
    with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  TabController? _tabController;
  final cont = Get.put(ScannersCont());
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
                cont.availScannerIDs.refresh();
              } else {
                cont.unAvailScannerIDs.refresh();
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
  final cont = Get.find<ScannersCont>();
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
            List<ScannerData>? scannerIds = cont.getAvailScannerIDs;
            if (scannerIds == null) {
              return LoadingWidget(height: SizeConfig.heightMultiplier * 25);
            } else {
              if (searchCont.text.isNotEmpty) {
                scannerIds = cont.getAvailScannerIDs!
                    .where((element) => element.serialNumber!
                        .toLowerCase()
                        .startsWith(searchCont.text.toLowerCase()))
                    .toList();
              } else {
                scannerIds = cont.getAvailScannerIDs!;
              }
              return scannerIds.isEmpty
                  ? NoDataWidget(text: 'No data')
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          ...List.generate(
                            scannerIds.length,
                            (index) => CustomSelectedTile(
                              isSelected: detailCont.selectedScannerID.value ==
                                  scannerIds![index],
                              onTap: () {
                                if (detailCont.selectedScannerID.value !=
                                    scannerIds![index]) {
                                  detailCont.selectedScannerID.value =
                                      scannerIds[index];
                                } else {
                                  detailCont.selectedScannerID.value = null;
                                }
                              },
                              text: scannerIds[index].serialNumber!,
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
  final cont = Get.find<ScannersCont>();
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
            List<ScannerData>? scannerIds = cont.getUnAvailScannerIDs;
            if (scannerIds == null) {
              return LoadingWidget(height: SizeConfig.heightMultiplier * 25);
            } else {
              if (searchCont.text.isNotEmpty) {
                scannerIds = cont.getUnAvailScannerIDs!
                    .where((element) => element.serialNumber!
                        .toLowerCase()
                        .startsWith(searchCont.text.toLowerCase()))
                    .toList();
              } else {
                scannerIds = cont.getUnAvailScannerIDs!;
              }
              return scannerIds.isEmpty
                  ? NoDataWidget(text: 'No data')
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          ...List.generate(
                            scannerIds.length,
                            (index) => CustomSelectedTile(
                              isSelected: detailCont.selectedScannerID.value ==
                                  scannerIds![index],
                              onTap: () {
                                // if (detailCont.selectedDriverID.value !=
                                //     scannerIds![index]) {
                                //   detailCont.selectedDriverID.value =
                                //       scannerIds[index];
                                // } else {
                                //   detailCont.selectedDriverID.value = null;
                                // }
                              },
                              onRelease: () {},
                              text: scannerIds[index].serialNumber!,
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
