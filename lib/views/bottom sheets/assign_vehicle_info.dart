import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/snackbar.dart';
import 'package:whitefleet/controllers/driver_detail.dart';
import 'package:whitefleet/views/bottom%20sheets/search_vehicle.dart';
import '../../constants/colors.dart';
import '../../controllers/driver_controller.dart';
import '../../utils/size_config.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_dropdownfield.dart';
import '../widgets/custom_textfield.dart';

class AssignVehicleInfoBS extends StatefulWidget {
  AssignVehicleInfoBS({
    super.key,
  });

  @override
  State<AssignVehicleInfoBS> createState() => _AssignVehicleInfoBSState();
}

class _AssignVehicleInfoBSState extends State<AssignVehicleInfoBS> {
  final cont = Get.find<DriverDetailCont>();

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: SizeConfig.heightMultiplier * 38,
      width: SizeConfig.widthMultiplier * 100,
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 4,
          vertical: SizeConfig.heightMultiplier * 2),
      decoration: BoxDecoration(
        color: AppColors.whiteClr,
        border: Border.all(color: Colors.black26),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Vehicle Information",
            style: textTheme.headlineMedium,
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Vehicle Number:",
                style: textTheme.bodyMedium!.copyWith(
                    color: const Color(0xff04104A),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 4,
                width: SizeConfig.widthMultiplier * 55,
                child: Obx(
                  () => CustomTextField(
                    hintText: "Search Vehicle",
                    controller: TextEditingController(
                        text: cont.selectedVehicle.value == null
                            ? ''
                            : cont.selectedVehicle.value!.vanNumber),
                    readOnly: true,
                    onTap: () {
                      Get.bottomSheet(SearchVehicleBS(),
                          isScrollControlled: true);
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
                  listdata: cont.rentType,
                  currentSelectedValue: cont.selectedRentType.value == ""
                      ? null
                      : cont.selectedRentType.value,
                  onChanged: (value) {
                    cont.selectedRentType.value = value.toString();
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
                  controller: cont.vehiclePriceCont,
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
                onTap: () {
                  Get.back();
                },
                isBorder: true,
              ),
              CustomButton(
                title: "Done",
                onTap: () => _validator()
                    ? Get.back()
                    : showSnackbar(true, 'Please fill all information.'),
              ),
            ],
          )
        ],
      ),
    );
  }

  bool _validator() {
    return cont.vehiclePriceCont.text.isNotEmpty &&
        cont.selectedRentType.value != '';
  }
}
