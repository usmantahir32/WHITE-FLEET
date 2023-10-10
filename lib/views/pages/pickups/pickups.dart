import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:whitefleet/controllers/pickups.dart';
import 'package:whitefleet/models/pickeups.dart';
import 'package:whitefleet/views/widgets/confirmation_dialog.dart';
import 'package:whitefleet/views/widgets/custom_appbar.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/widgets/loading.dart';
import 'package:whitefleet/views/widgets/no_data.dart';
import '../../../constants/icons.dart';
import '../../bottom sheets/add_pickup.dart';

class PickupScreen extends StatelessWidget {
  PickupScreen({super.key});
  final cont = Get.put(PickupsCont());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Pick Up's",
        isleading: true,
        actions: [
          IconButton(
              onPressed: () =>
                  Get.bottomSheet(AddPickupBS(), isScrollControlled: true),
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
        () => cont.getPickup == null
            ? LoadingWidget(height: SizeConfig.heightMultiplier * 80)
            : cont.getPickup!.data!.isEmpty
                ? NoDataWidget(
                    text: 'Pickups not found!',
                  )
                : SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: SizeConfig.heightMultiplier * 2),
                          ...List.generate(
                            cont.getPickup!.data!.length,
                            (index) =>
                                PickupTile(data: cont.getPickup!.data![index]),
                          ),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}

class PickupTile extends StatelessWidget {
  PickupTile({super.key, required this.data});
  final PickupData data;
  final cont = Get.find<PickupsCont>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: SizeConfig.heightMultiplier * 8,
      width: SizeConfig.widthMultiplier * 92,
      margin: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2),
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.heightMultiplier * 2,
          horizontal: SizeConfig.widthMultiplier * 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.greyClr),
      ),
      child: Row(
        children: [
          Text(
            data.name!,
            style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          //EDIT
          InkWell(
            onTap: () => Get.bottomSheet(AddPickupBS(data: data),
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
                title: 'Delete ${data.name}?',
                subtitle: 'Are you sure you want to delete this pickup?',
                onContinue: () => cont.deletePickup(data.id!))),
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
