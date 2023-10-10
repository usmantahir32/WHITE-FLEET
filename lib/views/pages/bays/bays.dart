import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:whitefleet/controllers/bay.dart';
import 'package:whitefleet/models/bay.dart';
import 'package:whitefleet/views/widgets/confirmation_dialog.dart';
import 'package:whitefleet/views/widgets/custom_appbar.dart';
import 'package:whitefleet/constants/icons.dart';
import 'package:whitefleet/views/widgets/loading.dart';
import 'package:whitefleet/views/widgets/no_data.dart';
import '../../../constants/colors.dart';
import '../../../utils/size_config.dart';
import '../../bottom sheets/add_bay.dart';

class BayScreen extends StatelessWidget {
  BayScreen({super.key});
  final cont = Get.put(BayCont());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        isleading: true,
        title: "Bay",
        actions: [
          IconButton(
              onPressed: () =>
                  Get.bottomSheet(AddBayBS(), isScrollControlled: true),
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
        () => cont.getBay == null
            ? LoadingWidget(height: SizeConfig.heightMultiplier * 80)
            : cont.getBay!.data!.isEmpty
                ? NoDataWidget(
                    text: 'Bays not found!',
                  )
                : Center(
                    child: Column(
                      children: [
                        SizedBox(height: SizeConfig.heightMultiplier * 2),
                        ...List.generate(
                          cont.getBay!.data!.length,
                          (index) => BayTile(
                            bayNumber: index + 1,
                            data: cont.getBay!.data![index],
                          ),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}

class BayTile extends StatelessWidget {
  BayTile({
    super.key,
    required this.bayNumber,
    required this.data,
  });

  final int bayNumber;
  final BayData data;
  final cont = Get.find<BayCont>();
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
              Row(
                children: [
                  Text(
                    "Bay Number :",
                    style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.55)
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    " $bayNumber",
                    style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.55)
                        .copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.textMediumClr),
                  )
                ],
              ),
              Text(
                data.name!,
                style: textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.textMediumClr),
              )
            ],
          ),
          const Spacer(),
          //EDIT
          InkWell(
            onTap: () =>
                Get.bottomSheet(AddBayBS(data: data), isScrollControlled: true),
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
                subtitle: 'Are you sure you want to delete this bay?',
                onContinue: () => cont.deleteBay(data.id!))),
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
