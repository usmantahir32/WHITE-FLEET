import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:whitefleet/models/vanrego.dart';
import 'package:whitefleet/views/widgets/loading.dart';
import '../../constants/colors.dart';
import '../../constants/cont.dart';
import '../../constants/decorations.dart';
import '../../controllers/add_van_rego.dart';
import '../../controllers/job_and_inven_controller.dart';
import '../../utils/size_config.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_dropdownfield.dart';
import '../widgets/custom_textfield.dart';

class NewVanRegoBottomSheet extends StatefulWidget {
  NewVanRegoBottomSheet({
    super.key,
    this.data,
  });
  final VanRegoData? data;

  @override
  State<NewVanRegoBottomSheet> createState() => _NewVanRegoBottomSheetState();
}

class _NewVanRegoBottomSheetState extends State<NewVanRegoBottomSheet> {
  final jobAndInvenCtrl = Get.find<JobAndInvenController>();

  final cont = Get.put(AddVanRegoCont());
  @override
  void initState() {
    super.initState();
    //GET DATA IF IT IS EDIT PAGE
    Future.delayed(Duration.zero, () {
      if (widget.data != null) {
        cont.getVanrego(widget.data!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isEdit = widget.data != null;
    return Container(
      height: SizeConfig.heightMultiplier * 60,
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
      child: Obx(
        () => ShowLoading(
          inAsyncCall: authCont.isLoading.value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                // ",
                isEdit ? 'Edit ${widget.data!.vanNumber}' : "Create Van Rego",
                style: textTheme.headlineMedium,
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Van No:",
                    style: textTheme.bodyMedium!.copyWith(
                        color: const Color(0xff04104A),
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 4,
                    width: SizeConfig.widthMultiplier * 55,
                    child: CustomTextField(
                      hintText: "Enter number",
                      controller: cont.vanNoController,
                    ),
                  )
                ],
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rego No:",
                    style: textTheme.bodyMedium!.copyWith(
                        color: const Color(0xff04104A),
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 4,
                    width: SizeConfig.widthMultiplier * 55,
                    child: CustomTextField(
                      hintText: "Enter number",
                      controller: cont.regNohController,
                    ),
                  )
                ],
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Company:",
                    style: textTheme.bodyMedium!.copyWith(
                        color: const Color(0xff04104A),
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 4,
                    width: SizeConfig.widthMultiplier * 55,
                    child: CustomTextField(
                      hintText: "Enter name",
                      controller: cont.nameController,
                    ),
                  )
                ],
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Size:",
                    style: textTheme.bodyMedium!.copyWith(
                        color: const Color(0xff04104A),
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 4,
                    width: SizeConfig.widthMultiplier * 55,
                    child: CustomTextField(
                      hintText: "Enter weight",
                      controller: cont.sizeController,
                    ),
                  )
                ],
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rego Expiry:",
                    style: textTheme.bodyMedium!.copyWith(
                        color: const Color(0xff04104A),
                        fontWeight: FontWeight.w600),
                  ),
                  //
                  InkWell(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      selectDate(context);
                    },
                    child: Container(
                      height: SizeConfig.heightMultiplier * 4,
                      width: SizeConfig.widthMultiplier * 55,
                      decoration: AppDecorations.whiteBox,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 4 * SizeConfig.widthMultiplier,
                          ),
                          cont.isDateSelected.value
                              ? Text(
                                  getFormatedDate(cont.selectedDate.toString()),
                                )
                              : Text(
                                  "Select date",
                                  style: textTheme.bodySmall,
                                ),
                          Spacer(),
                          Icon(
                            FeatherIcons.calendar,
                            size: SizeConfig.imageSizeMultiplier * 5,
                          ),
                          SizedBox(
                            width: 4 * SizeConfig.widthMultiplier,
                          ),
                        ],
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
                    "Assign To:",
                    style: textTheme.bodyMedium!.copyWith(
                        color: const Color(0xff04104A),
                        fontWeight: FontWeight.w600),
                  ),
                  Obx(
                    () => CustomDropDownField(
                      hinttext: "Assign to",
                      listdata: jobAndInvenCtrl.newVanRegoAssignTo,
                      currentSelectedValue:
                          jobAndInvenCtrl.selectedNewVanRegoAssignTo.value == ""
                              ? null
                              : jobAndInvenCtrl
                                  .selectedNewVanRegoAssignTo.value,
                      onChanged: (value) {
                        jobAndInvenCtrl.selectedNewVanRegoAssignTo.value =
                            value.toString();
                      },
                    ),
                  ),
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
                    title: isEdit ? "Update" : "Done",
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      isEdit
                          ? cont.editVanRego(widget.data!.id!)
                          : cont.addVanRego();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: cont.selectedDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    // ignore: unrelated_type_equality_checks
    if (picked != null && picked != cont.selectedDate) {
      cont.selectedDate.value = picked;
      cont.isDateSelected.value = true;
    }
  }

  getFormatedDate(date) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('yyyy-MM-dd');
    return outputFormat.format(inputDate);
  }
}
