import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/constants/snackbar.dart';
import 'package:whitefleet/controllers/driver_detail.dart';
import 'package:whitefleet/models/deppos.dart';
import 'package:whitefleet/models/driver_config_data.dart';
import 'package:whitefleet/models/pickeups.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/bottom%20sheets/search_deppo.dart';
import 'package:whitefleet/views/bottom%20sheets/search_pickups.dart';
import 'package:whitefleet/views/widgets/custom_btn.dart';
import 'package:whitefleet/views/widgets/custom_dropdownfield.dart';
import 'package:whitefleet/views/widgets/custom_textfield.dart';
import 'package:whitefleet/views/widgets/loading.dart';

class AddPickupInvoiceBS extends StatefulWidget {
  AddPickupInvoiceBS({
    super.key,
  });

  @override
  State<AddPickupInvoiceBS> createState() => _AssignVehicleInfoBSState();
}

class _AssignVehicleInfoBSState extends State<AddPickupInvoiceBS> {
  final cont = Get.find<DriverDetailCont>();
  DriverInvoiceConfigData? configData;
  RateConfigTypes? rateConfigType;
  List<String> items = [];
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => getDropDownData());
  }

  getDropDownData() {
    cont.configData.data!.forEach((element) {
      if (element.name == 'Pickup') {
        configData = element;
        element.rateConfigTypes!.forEach((types) {
          items.add(types.name!);
        });
      }
    });
    setState(() {});
  }

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: SizeConfig.heightMultiplier * 38,
      width: SizeConfig.widthMultiplier * 100,
      decoration: BoxDecoration(
        color: AppColors.whiteClr,
        border: Border.all(color: Colors.black26),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Obx(
        () => ShowLoading(
          inAsyncCall: authCont.isLoading.value,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 4,
                vertical: SizeConfig.heightMultiplier * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Pickup Information",
                  style: textTheme.headlineMedium,
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pickup:",
                      style: textTheme.bodyMedium!.copyWith(
                          color: const Color(0xff04104A),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 4,
                      width: SizeConfig.widthMultiplier * 55,
                      child: Obx(
                        () => CustomTextField(
                          hintText: "Search Pickup",
                          controller: TextEditingController(
                              text: cont.selectedInvoicePickup.value == null
                                  ? ''
                                  : cont.selectedInvoicePickup.value!.name),
                          readOnly: true,
                          onTap: () async {
                            final result = await Get.bottomSheet(
                                SearchPickupsBS(),
                                isScrollControlled: true);
                            if (result != null) {
                              cont.selectedInvoicePickup.value =
                                  result as PickupData;
                            }
                          },
                          suffix: Icon(
                            FeatherIcons.search,
                            color: Colors.black,
                            size: SizeConfig.imageSizeMultiplier * 5,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Rent Type:",
                      style: textTheme.bodyMedium!.copyWith(
                          color: const Color(0xff04104A),
                          fontWeight: FontWeight.w600),
                    ),
                    Obx(
                      () => CustomDropDownField(
                        hinttext: "Select Rent",
                        listdata: items,
                        currentSelectedValue:
                            cont.selectedInvoicePickupRunType.value == ""
                                ? null
                                : cont.selectedInvoicePickupRunType.value,
                        onChanged: (value) {
                          cont.selectedInvoicePickupRunType.value =
                              value.toString();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Price:",
                      style: textTheme.bodyMedium!.copyWith(
                          color: const Color(0xff04104A),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 4,
                      width: SizeConfig.widthMultiplier * 55,
                      child: CustomTextField(
                        hintText: "Enter Price",
                        controller: cont.pickupInvoicePriceCont,
                      ),
                    )
                  ],
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      title: "Cancel",
                      onTap: () => Get.back(),
                      isBorder: true,
                    ),
                    CustomButton(
                      title: "Done",
                      onTap: () => _validator()
                          ? cont.addInvoiceTask(
                              configID: cont.driverConfigID.value,
                              rateConfigId: rateConfigType!.rateConfigId!,
                              runTypeID: rateConfigType!.id!,
                              runType: 'Pickup',
                              amount: '',
                              relationID: cont.selectedInvoicePickup.value!.id!)
                          : showSnackbar(true, 'Please fill all information.'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _validator() {
    if (cont.selectedInvoicePickupRunType.value != '') {
      configData!.rateConfigTypes!.forEach((element) {
        if (element.name == cont.selectedInvoicePickupRunType.value) {
          rateConfigType = element;
        }
      });
    }
    return cont.pickupInvoicePriceCont.text.isNotEmpty &&
        cont.selectedInvoicePickupRunType.value != '' &&
        cont.selectedInvoicePickup.value != null;
  }
}
