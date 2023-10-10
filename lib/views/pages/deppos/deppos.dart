import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:whitefleet/controllers/deppos.dart';
import 'package:whitefleet/models/deppos.dart';
import 'package:whitefleet/views/widgets/confirmation_dialog.dart';
import 'package:whitefleet/views/widgets/custom_appbar.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/widgets/loading.dart';
import 'package:whitefleet/views/widgets/no_data.dart';
import '../../../constants/icons.dart';
import '../../bottom sheets/add_deppo.dart';

class DepposScreen extends StatelessWidget {
  DepposScreen({super.key});
  final cont = Get.put(DepposCont());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Deppo",
        isleading: true,
        actions: [
          IconButton(
              onPressed: () =>
                  Get.bottomSheet(AddDeppoBS(), isScrollControlled: true),
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
        () => cont.getDeppo == null
            ? LoadingWidget(height: SizeConfig.heightMultiplier * 80)
            : cont.getDeppo!.data!.isEmpty
                ? NoDataWidget(
                    text: 'Deppos not found!',
                  )
                : SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: SizeConfig.heightMultiplier * 2),
                          ...List.generate(
                            cont.getDeppo!.data!.length,
                            (index) => DeppoTile(
                              data: cont.getDeppo!.data![index],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}

class DeppoTile extends StatelessWidget {
  DeppoTile({
    super.key,
    required this.data,
  });
  final DeppoData data;
  final cont = Get.find<DepposCont>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: SizeConfig.heightMultiplier * 10,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.name!,
                style:
                    textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                data.address!,
                style: textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.textClr),
              )
            ],
          ),

          const Spacer(),

          //EDIT
          InkWell(
            onTap: () => Get.bottomSheet(AddDeppoBS(data: data),
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
                subtitle: 'Are you sure you want to delete this deppo?',
                onContinue: () => cont.deleteDeppo(data.id!))),
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
