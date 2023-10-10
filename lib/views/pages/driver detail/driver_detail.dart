import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/constants.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/constants/decorations.dart';
import 'package:whitefleet/controllers/driver_controller.dart';
import 'package:whitefleet/controllers/driver_detail.dart';
import 'package:whitefleet/models/bay.dart';
import 'package:whitefleet/models/wave.dart';
import 'package:whitefleet/views/bottom%20sheets/assign_bays.dart';
import 'package:whitefleet/views/bottom%20sheets/assign_waves.dart';
import 'package:whitefleet/views/bottom%20sheets/bay_detail_bottomsheet.dart';
import 'package:whitefleet/views/bottom%20sheets/assign_scanner_id.dart';
import 'package:whitefleet/views/bottom%20sheets/assign_driver_id.dart';
import 'package:whitefleet/views/bottom%20sheets/assign_vehicle_info.dart';
import 'package:whitefleet/views/bottom%20sheets/wave_detail_bottomsheet.dart';
import 'package:whitefleet/views/pages/driver%20detail/components/deppo_card.dart';
import 'package:whitefleet/views/pages/driver%20detail/components/driver_profile_detail.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/pages/driver%20detail/components/parcel_card.dart';
import 'package:whitefleet/views/pages/driver%20detail/components/pickup_card.dart';
import 'package:whitefleet/views/widgets/custom_appbar.dart';
import 'package:whitefleet/views/widgets/loading.dart';
import '../../../models/drivers.dart';
import 'components/school_card.dart';

class DriverDetailScreen extends StatefulWidget {
  final DriverData data;
  DriverDetailScreen({super.key, required this.data});

  @override
  State<DriverDetailScreen> createState() => _DriverDetailScreenState();
}

class _DriverDetailScreenState extends State<DriverDetailScreen> {
  final cont = Get.put(DriverDetailCont());
  final driverCont = Get.put(DriverController());
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => cont.getDriverDetail(widget.data.id!));
  }

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const CustomAppbar(isleading: true, title: "Driver Detail"),
      body: Obx(
        () => cont.driverDetail == null
            ? LoadingWidget(height: SizeConfig.heightMultiplier * 80)
            : SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier * 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: SizeConfig.heightMultiplier * 2),
                        DriverProfileDetail(
                            detailData: cont.driverDetail!.data!,
                            data: widget.data),
                        SizedBox(height: SizeConfig.heightMultiplier * 1),
                        Row(
                          children: [
                            Text("Inventory", style: textTheme.headlineMedium),
                            const Spacer(),
                            IconButton(
                              onPressed: () =>
                                  cont.setDriversConfigData(widget.data.id!),
                              icon: Icon(Icons.done,
                                  size: 22, color: Colors.blue),
                            )
                          ],
                        ),
                        authCont.isLoading.value
                            ? LinearProgressIndicator(
                                minHeight: 2,
                              )
                            : SizedBox(),
                        SizedBox(
                            height: authCont.isLoading.value
                                ? SizeConfig.heightMultiplier * 2
                                : 0),
                        Text(
                          "DRIVER ID",
                          style: textTheme.bodyMedium!.copyWith(
                              color: AppColors.textClr,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: SizeConfig.heightMultiplier * .5),
                        DriverIDDetailField(
                          title:
                              cont.selectedDriverID.value?.temparoryId ?? 'N/A',
                          status: "Permanent",
                          onTapEdit: () {
                            Get.bottomSheet(AssignDriverIdBS(),
                                isScrollControlled: true);
                          },
                        ),
                        SizedBox(height: SizeConfig.heightMultiplier * 2),
                        Text(
                          "SCANNER",
                          style: textTheme.bodyMedium!.copyWith(
                              color: AppColors.textClr,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: SizeConfig.heightMultiplier * .5),
                        CustomDetailField(
                          title: cont.selectedScannerID.value?.serialNumber ??
                              'N/A',
                          onTapEdit: () {
                            Get.bottomSheet(AssignScannerIdBS(),
                                isScrollControlled: true);
                          },
                        ),
                        SizedBox(height: SizeConfig.heightMultiplier * 2),
                        Text(
                          "Bay",
                          style: textTheme.bodyMedium!.copyWith(
                              color: AppColors.textClr,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: SizeConfig.heightMultiplier * .5),
                        CustomDetailField(
                          title: cont.selectedBays.value == null ||
                                  cont.selectedBays.value!.isEmpty
                              ? 'N/A'
                              : baysListToString(cont.selectedBays.value!),
                          onTapEdit: () {
                            Get.bottomSheet(AssignBaysBS(),
                                isScrollControlled: true);
                          },
                        ),
                        SizedBox(height: SizeConfig.heightMultiplier * 2),
                        Text(
                          "WAVE",
                          style: textTheme.bodyMedium!.copyWith(
                              color: AppColors.textClr,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: SizeConfig.heightMultiplier * .5),
                        CustomDetailField(
                          title: cont.selectedWaves.value == null ||
                                  cont.selectedWaves.value!.isEmpty
                              ? 'N/A'
                              : wavesListToString(cont.selectedWaves.value!),
                          onTapEdit: () {
                            Get.bottomSheet(AssignWavesBS(),
                                isScrollControlled: true);
                          },
                        ),
                        SizedBox(height: SizeConfig.heightMultiplier * 2),
                        Text(
                          "VEHICLE",
                          style: textTheme.bodyMedium!.copyWith(
                              color: AppColors.textClr,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: SizeConfig.heightMultiplier * .5),
                        Obx(
                          () => CustomDetailField(
                            title: cont.selectedVehicle.value == null
                                ? 'N/A'
                                : cont.selectedVehicle.value!.vanNumber!,
                            status: "Rented",
                            price: cont.vehiclePriceCont.value.text
                                        .isNotEmpty &&
                                    cont.selectedRentType.value != ''
                                ? '${cont.vehiclePriceCont.value.text} AUD ${cont.selectedRentType.value}   '
                                : '',
                            onTapEdit: () {
                              Get.bottomSheet(AssignVehicleInfoBS(),
                                  isScrollControlled: true);
                            },
                          ),
                        ),
                        SizedBox(height: SizeConfig.heightMultiplier * 2),
                        Text("Driver Invoice", style: textTheme.headlineMedium),
                        cont.driverConfigID.value == ''
                            ? SizedBox(
                                height: SizeConfig.heightMultiplier * 20,
                                width: SizeConfig.widthMultiplier * 100,
                                child: Center(
                                    child: Text(
                                        'Please save driver configuration first to add driver invoice data',
                                        textAlign: TextAlign.center)),
                              )
                            : Column(
                                children: [
                                  SizedBox(
                                      height: SizeConfig.heightMultiplier * 2),
                                  ParcelCard(),
                                  SizedBox(
                                      height: SizeConfig.heightMultiplier * 2),
                                   DeppoCard(),
                                  SizedBox(
                                      height: SizeConfig.heightMultiplier * 2),
                                   SchoolsCard(),
                                  SizedBox(
                                      height: SizeConfig.heightMultiplier * 2),
                                   PickUpCard(),
                                  SizedBox(
                                      height: SizeConfig.heightMultiplier * 2)
                                ],
                              )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  String baysListToString(List<BayData> list) {
    List<String> bays = list.map((val) {
      return val.name!;
    }).toList();

    return bays.join(', ');
  }

  String wavesListToString(List<WaveData> list) {
    List<String> waves = list.map((val) {
      return val.name!;
    }).toList();

    return waves.join(', ');
  }
}

class CustomDetailField extends StatelessWidget {
  final String title;
  final String status;
  final String price;
  final VoidCallback onTapEdit;
  const CustomDetailField({
    super.key,
    required this.title,
    this.status = "empty",
    this.price = '',
    required this.onTapEdit,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: SizeConfig.heightMultiplier * 6,
      width: SizeConfig.widthMultiplier * 92,
      padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 4),
      decoration: AppDecorations.whiteBox,
      child: Row(
        children: [
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyMedium,
          ),
          const Spacer(),
          Text(price,
              style:
                  textTheme.bodyMedium!.copyWith(color: AppColors.primaryClr)),
          status == "empty"
              ? const SizedBox()
              : Container(
                  height: SizeConfig.heightMultiplier * 3.5,
                  width: SizeConfig.widthMultiplier * 20,
                  decoration: BoxDecoration(
                    color: AppColors.yellowClr,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      status,
                      style: textTheme.displaySmall!.copyWith(
                          color: AppColors.whiteClr,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
          IconButton(
            onPressed: onTapEdit,
            icon: Icon(
              FeatherIcons.edit,
              size: SizeConfig.imageSizeMultiplier * 5,
            ),
          ),
        ],
      ),
    );
  }
}

class DriverIDDetailField extends StatelessWidget {
  final String title;
  final String status;
  final bool isprice;
  final VoidCallback onTapEdit;
  const DriverIDDetailField({
    super.key,
    required this.title,
    this.status = "empty",
    this.isprice = false,
    required this.onTapEdit,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: SizeConfig.heightMultiplier * 6,
      width: SizeConfig.widthMultiplier * 92,
      padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 4),
      decoration: AppDecorations.whiteBox,
      child: Row(
        children: [
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyMedium,
          ),
          const Spacer(),
          isprice
              ? Text(" AUD Per Day",
                  style: textTheme.bodyMedium!
                      .copyWith(color: AppColors.primaryClr))
              : const SizedBox(),
          const Spacer(),
          status == "empty"
              ? const SizedBox()
              : Container(
                  height: SizeConfig.heightMultiplier * 3.5,
                  width: SizeConfig.widthMultiplier * 20,
                  decoration: BoxDecoration(
                    color: AppColors.yellowClr,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      status,
                      style: textTheme.displaySmall!.copyWith(
                          color: AppColors.whiteClr,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
          IconButton(
            onPressed: onTapEdit,
            icon: Icon(
              FeatherIcons.edit,
              size: SizeConfig.imageSizeMultiplier * 5,
            ),
          ),
        ],
      ),
    );
  }
}
