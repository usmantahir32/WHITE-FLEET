import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/constants/decorations.dart';
import 'package:whitefleet/controllers/map_controller.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/widgets/custom_appbar.dart';
import 'package:whitefleet/views/widgets/custom_search_field.dart';
import '../../../models/data.dart';

// ignore: must_be_immutable
class AdminMapScreen extends StatelessWidget {
  AdminMapScreen({super.key});

  TextEditingController searchController = TextEditingController();

  final cont = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Obx(
      () => Scaffold(
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
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: AppDecorations.whitecircle,
                    child: const Icon(FeatherIcons.list),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Stack(
              children: [
                SizedBox(
                  height: SizeConfig.heightMultiplier * 81,
                  width: SizeConfig.widthMultiplier * 100,
                  child: const GoogleMap(
                    myLocationEnabled: true,
                    initialCameraPosition: CameraPosition(
                        zoom: 15,
                        target: LatLng(24.4281117970299, 54.4643970497028)),
                    mapType: MapType.normal,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      mapTypes.length,
                      (index) => GestureDetector(
                        onTap: () {
                          cont.selectedMapType.value = index;
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          height: SizeConfig.heightMultiplier * 5,
                          width: SizeConfig.widthMultiplier * 30,
                          margin: EdgeInsets.symmetric(
                              vertical: SizeConfig.heightMultiplier * 2,
                              horizontal: SizeConfig.widthMultiplier * 2),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: cont.selectedMapType.value == index
                                      ? AppColors.primaryClr
                                      : AppColors.textClr),
                              borderRadius: BorderRadius.circular(30),
                              color: cont.selectedMapType.value == index
                                  ? AppColors.primaryClr
                                  : AppColors.whiteClr),
                          child: Center(
                            child: Text(
                              mapTypes[index],
                              style: textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: cont.selectedMapType.value == index
                                      ? AppColors.whiteClr
                                      : AppColors.textClr),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
