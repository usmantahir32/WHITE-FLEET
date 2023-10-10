import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/snackbar.dart';
import 'package:whitefleet/controllers/routes.dart';
import 'package:whitefleet/models/routes.dart';
import 'package:whitefleet/views/widgets/loading.dart';
import 'package:whitefleet/views/widgets/no_data.dart';
import 'package:whitefleet/views/widgets/selected_tile.dart';
import '../../constants/colors.dart';
import '../../utils/size_config.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_search_field.dart';
import 'package:whitefleet/controllers/driver_detail.dart';

class SearchRoutesBS extends StatefulWidget {
  const SearchRoutesBS({
    super.key,
  });

  @override
  State<SearchRoutesBS> createState() => _SearchRoutesBSState();
}

class _SearchRoutesBSState extends State<SearchRoutesBS>
    with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  TabController? _tabController;
  final cont = Get.put(RoutesCont());
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
              "Search Routes",
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
                cont.availRoutes.refresh();
              } else {
                cont.unAvailRoutes.refresh();
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
                RoutesAvailable(searchCont: searchController),
                RoutesUnAvailable(searchCont: searchController)
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
                    if(cont.selectedRoute.value!=null){
                      Get.back(result: cont.selectedRoute.value);
                    }else{
                      showSnackbar(true, 'Please select route');
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

class RoutesAvailable extends StatelessWidget {
  RoutesAvailable({
    super.key,
    required this.searchCont,
  });
  final cont = Get.find<RoutesCont>();
  final TextEditingController searchCont;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.heightMultiplier * 2),
        SizedBox(
          height: SizeConfig.heightMultiplier * 25,
          child: Obx(() {
            List<RouteData>? routes = cont.getAvailRoutes;
            if (routes == null) {
              return LoadingWidget(height: SizeConfig.heightMultiplier * 25);
            } else {
              if (searchCont.text.isNotEmpty) {
                routes = cont.getAvailRoutes!
                    .where((element) => element.name!
                        .toLowerCase()
                        .startsWith(searchCont.text.toLowerCase()))
                    .toList();
              } else {
                routes = cont.getAvailRoutes!;
              }
              return routes.isEmpty
                  ? NoDataWidget(text: 'No data')
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          ...List.generate(
                            routes.length,
                            (index) => CustomSelectedTile(
                              isSelected: cont.selectedRoute.value ==
                                  routes![index],
                              onTap: () {
                                if (cont.selectedRoute.value !=
                                    routes![index]) {
                                  cont.selectedRoute.value =
                                      routes[index];
                                } else {
                                  cont.selectedRoute.value = null;
                                }
                              },
                              text: routes[index].name!,
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

class RoutesUnAvailable extends StatelessWidget {
  RoutesUnAvailable({
    super.key,
    required this.searchCont,
  });
  final cont = Get.find<RoutesCont>();
  final TextEditingController searchCont;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.heightMultiplier * 2),
        SizedBox(
          height: SizeConfig.heightMultiplier * 25,
          child: Obx(() {
            List<RouteData>? routes = cont.getUnAvailRoutes;
            if (routes == null) {
              return LoadingWidget(height: SizeConfig.heightMultiplier * 25);
            } else {
              if (searchCont.text.isNotEmpty) {
                routes = cont.getUnAvailRoutes!
                    .where((element) => element.name!
                        .toLowerCase()
                        .startsWith(searchCont.text.toLowerCase()))
                    .toList();
              } else {
                routes = cont.getUnAvailRoutes!;
              }
              return routes.isEmpty
                  ? NoDataWidget(text: 'No data')
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          ...List.generate(
                            routes.length,
                            (index) => CustomSelectedTile(
                              isSelected: cont.selectedRoute.value ==
                                  routes![index],
                              onRelease: () {},
                              onTap: () {},
                              text: routes[index].name!,
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
