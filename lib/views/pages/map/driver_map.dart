import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/constants/decorations.dart';
import 'package:whitefleet/controllers/map_controller.dart';
import 'package:whitefleet/models/data.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/widgets/custom_appbar.dart';
import 'package:whitefleet/views/widgets/custom_btn.dart';
import 'package:whitefleet/views/widgets/custom_search_field.dart';

// ignore: must_be_immutable
class DriverMapScreen extends StatelessWidget {
  DriverMapScreen({super.key});

  TextEditingController searchController = TextEditingController();

  final cont = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const CustomAppbar(isleading: true, title: "Map View"),
      body: Column(
        children: [
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSearchField(
                hintText: "Search Driver",
                controller: searchController,
              ),
              SizedBox(width: SizeConfig.widthMultiplier * 4),
              GestureDetector(
                onTap: () {
                  Get.dialog(Obx(
                    () => Dialog(
                      child: Container(
                        height: SizeConfig.heightMultiplier * 25,
                        width: SizeConfig.widthMultiplier * 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          children: [
                            Text(
                              "Filters",
                              style: textTheme.headlineSmall,
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ...List.generate(
                                  mapFilters.length,
                                  (index) => GestureDetector(
                                    onTap: () {
                                      cont.selectedFilter.value = index;
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 400),
                                      height: SizeConfig.heightMultiplier * 5,
                                      width: SizeConfig.widthMultiplier * 35,
                                      margin: EdgeInsets.symmetric(
                                          vertical:
                                              SizeConfig.heightMultiplier * 2,
                                          horizontal:
                                              SizeConfig.widthMultiplier * 2),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  cont.selectedFilter.value ==
                                                          index
                                                      ? AppColors.primaryClr
                                                      : AppColors.textClr),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color:
                                              cont.selectedFilter.value == index
                                                  ? AppColors.primaryClr
                                                  : AppColors.whiteClr),
                                      child: Center(
                                        child: Text(
                                          mapFilters[index],
                                          style: textTheme.bodySmall!.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  cont.selectedFilter.value ==
                                                          index
                                                      ? AppColors.whiteClr
                                                      : AppColors.textClr),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: SizeConfig.heightMultiplier * 2),
                            CustomButton(
                              title: "Apply",
                              onTap: () {
                                Get.back();
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: AppDecorations.whitecircle,
                  child: const Icon(FeatherIcons.list),
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          SizedBox(
            height: SizeConfig.heightMultiplier * 81,
            width: SizeConfig.widthMultiplier * 100,
            child: const GoogleMap(
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                  zoom: 15, target: LatLng(24.4281117970299, 54.4643970497028)),
              mapType: MapType.normal,
            ),
          ),
        ],
      ),
    );
  }
}
