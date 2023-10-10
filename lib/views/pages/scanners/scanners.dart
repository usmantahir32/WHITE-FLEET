import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:whitefleet/controllers/scanners.dart';
import 'package:whitefleet/models/scanner.dart';
import 'package:whitefleet/views/widgets/confirmation_dialog.dart';
import 'package:whitefleet/views/widgets/custom_appbar.dart';
import 'package:whitefleet/constants/icons.dart';
import 'package:whitefleet/views/widgets/loading.dart';
import 'package:whitefleet/views/widgets/no_data.dart';
import '../../../constants/colors.dart';
import '../../../utils/size_config.dart';
import '../../bottom sheets/add_scanner.dart';

class ScannerScreen extends StatelessWidget {
  ScannerScreen({super.key});
  final cont = Get.put(ScannersCont());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        isleading: true,
        title: "Scanner",
        actions: [
          IconButton(
              onPressed: () =>
                  Get.bottomSheet(AddScannerBS(), isScrollControlled: true),
              icon: Icon(
                FeatherIcons.plus,
                color: Colors.black,
                size: SizeConfig.imageSizeMultiplier * 8,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                AppIcons.notification,
                color: Colors.black,
                size: SizeConfig.imageSizeMultiplier * 8,
              ))
        ],
      ),
      body: Obx(
        () => cont.getScanner == null
            ? LoadingWidget(height: SizeConfig.heightMultiplier * 80)
            : cont.getScanner!.data!.isEmpty
                ? NoDataWidget(
                    text: 'Scanners not found!',
                  )
                : Center(
                    child: Column(
                      children: [
                        SizedBox(height: SizeConfig.heightMultiplier * 2),
                        ...List.generate(
                          cont.getScanner!.data!.length,
                          (index) =>
                              ScannerTile(model: cont.getScanner!.data![index]),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}

class ScannerTile extends StatelessWidget {
  ScannerTile({
    super.key,
    required this.model,
  });
  final ScannerData model;
  final cont = Get.find<ScannersCont>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: SizeConfig.heightMultiplier * 10,
      width: SizeConfig.widthMultiplier * 92,
      margin: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2),
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.heightMultiplier * 1,
          horizontal: SizeConfig.widthMultiplier * 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.greyClr),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.serialNumber!,
                style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.55)
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                "${model.model}-${model.make}",
                // "Un Assigned",
                style: textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.textMediumClr),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * .5),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 2,
                    vertical: SizeConfig.heightMultiplier * .2),
                decoration: BoxDecoration(
                  color: AppColors.greenClr,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "Assigned",
                  style:
                      textTheme.bodySmall!.copyWith(color: AppColors.whiteClr),
                ),
              ),
            ],
          ),
          const Spacer(),
          //EDIT
          InkWell(
            onTap: () => Get.bottomSheet(AddScannerBS(data: model),
                isScrollControlled: true),
            child: CircleAvatar(
              radius: SizeConfig.widthMultiplier * 3.5,
              backgroundColor: Colors.blue,
              child: Icon(FeatherIcons.edit, size: 16, color: Colors.white),
            ),
          ),
          SizedBox(width: SizeConfig.widthMultiplier * 2),
          //DELETE
          InkWell(
            onTap: () => Get.dialog(ConfirmationDialog(
                title: 'Delete ${model.serialNumber}?',
                subtitle: 'Are you sure you want to delete this scanner?',
                onContinue: () => cont.deleteScanner(model.id!))),
            child: CircleAvatar(
              radius: SizeConfig.widthMultiplier * 3.5,
              backgroundColor: Colors.red,
              child: Icon(FeatherIcons.trash2, size: 16, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
