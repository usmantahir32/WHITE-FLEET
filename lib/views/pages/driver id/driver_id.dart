import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:whitefleet/controllers/driver_ids.dart';
import 'package:whitefleet/models/driver_ids.dart';
import 'package:whitefleet/views/widgets/confirmation_dialog.dart';
import 'package:whitefleet/views/widgets/custom_appbar.dart';
import 'package:whitefleet/constants/icons.dart';
import 'package:whitefleet/views/widgets/loading.dart';
import 'package:whitefleet/views/widgets/no_data.dart';
import '../../../constants/colors.dart';
import '../../../utils/size_config.dart';
import '../../bottom sheets/add_driver_id.dart';

class DriverIdsScreen extends StatelessWidget {
  DriverIdsScreen({super.key});
  final cont = Get.put(DriverIdsCont());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        isleading: true,
        title: "Temp/ Permanent Id’s",
        actions: [
          IconButton(
              onPressed: () =>
                  Get.bottomSheet(AddDriverIdBS(), isScrollControlled: true),
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
        () => cont.getDriverIDs == null
            ? LoadingWidget(height: SizeConfig.heightMultiplier * 80)
            : cont.getDriverIDs!.data!.isEmpty
                ? NoDataWidget(
                    text: "Driver id's not found!",
                  )
                : SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: SizeConfig.heightMultiplier * 2),
                          ...List.generate(
                            cont.getDriverIDs!.data!.length,
                            (index) => DriverIdTile(
                                model: cont.getDriverIDs!.data![index]),
                          ),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}

class DriverIdTile extends StatelessWidget {
  DriverIdTile({
    super.key,
    required this.model,
  });
  final DriverIdsData model;
  final cont = Get.find<DriverIdsCont>();
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
              //ID
              Text(
                model.temparoryId!,
                style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.55)
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              //ASSIGNED
              Text(
                "Un Assigned",
                style: textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.textMediumClr),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * .5),
              //TAG
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 2,
                    vertical: SizeConfig.heightMultiplier * .2),
                decoration: BoxDecoration(
                  color: AppColors.yellowClr,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "Temporary",
                  style:
                      textTheme.bodySmall!.copyWith(color: AppColors.whiteClr),
                ),
              ),
            ],
          ),
          const Spacer(),
          //EDIT
          InkWell(
            onTap: () => Get.bottomSheet(AddDriverIdBS(data: model),
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
                title: 'Delete ${model.temparoryId}?',
                subtitle: 'Are you sure you want to delete this driver id?',
                onContinue: () => cont.deleteDriverID(model.id!))),
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
