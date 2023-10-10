import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:whitefleet/models/vanrego.dart';
import 'package:whitefleet/views/widgets/custom_appbar.dart';
import 'package:whitefleet/constants/icons.dart';
import '../../../constants/colors.dart';
import '../../../controllers/van_rego.dart';
import '../../../utils/size_config.dart';
import '../../bottom sheets/new_vanrego_bottomsheet.dart';
import '../../widgets/confirmation_dialog.dart';
import '../../widgets/loading.dart';
import '../../widgets/no_data.dart';

class VanRegoScreen extends StatelessWidget {
  VanRegoScreen({super.key});

  final cont = Get.put(VanRegoCont());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        isleading: true,
        title: "Van Rego",
        actions: [
          IconButton(
              onPressed: () => Get.bottomSheet(NewVanRegoBottomSheet(),
                  isScrollControlled: true),
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
        () => cont.getVanrego == null
            ? LoadingWidget(height: SizeConfig.heightMultiplier * 80)
            : cont.getVanrego!.data!.isEmpty
                ? NoDataWidget(
                    text: 'Van Rego not found!',
                  )
                : SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: SizeConfig.heightMultiplier * 2),
                          ...List.generate(
                            cont.getVanrego!.data!.length,
                            (index) => VanRegoTile(
                              data: cont.getVanrego!.data![index],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
      ),

      //  Center(
      //   child: Column(
      //     children: [
      //       SizedBox(height: SizeConfig.heightMultiplier * 2),
      //       ...List.generate(
      //         4,
      //         (index) => VanRegoTile(),
      //       ),
      //       SizedBox(height: SizeConfig.heightMultiplier * 5),
      //
      //     ],
      //   ),
      // ),
    );
  }
}

class VanRegoTile extends StatelessWidget {
  final VanRegoData data;
  VanRegoTile({
    super.key,
    required this.data,
  });
  final cont = Get.find<VanRegoCont>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      // height: SizeConfig.heightMultiplier * 10,
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
                data.vanNumber!,
                style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.55)
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                data.regoNumber!,
                style: textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.textMediumClr),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * .5),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier * 4,
                        vertical: SizeConfig.heightMultiplier * .5),
                    margin:
                        EdgeInsets.only(right: SizeConfig.widthMultiplier * 2),
                    decoration: BoxDecoration(
                      color: AppColors.greenClr,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      data.company!,
                      style: textTheme.displaySmall!
                          .copyWith(color: AppColors.whiteClr),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier * 2,
                        vertical: SizeConfig.heightMultiplier * .5),
                    margin:
                        EdgeInsets.only(right: SizeConfig.widthMultiplier * 2),
                    decoration: BoxDecoration(
                      color: AppColors.greenClr,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      data.size!,
                      style: textTheme.displaySmall!
                          .copyWith(color: AppColors.whiteClr),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier * 2,
                        vertical: SizeConfig.heightMultiplier * .5),
                    margin:
                        EdgeInsets.only(right: SizeConfig.widthMultiplier * 2),
                    decoration: BoxDecoration(
                      color: AppColors.greenClr,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      data.regoExpiry!,
                      style: textTheme.displaySmall!
                          .copyWith(color: AppColors.whiteClr),
                    ),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () => Get.bottomSheet(NewVanRegoBottomSheet(data: data),
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
                title: 'Delete ${data.vanNumber}?',
                subtitle: 'Are you sure you want to delete this Van Rego?',
                onContinue: () => cont.deleteRego(data.id!))),
            child: CircleAvatar(
              radius: SizeConfig.widthMultiplier * 3.5,
              backgroundColor: Colors.red,
              child: Icon(FeatherIcons.trash2, size: 16, color: Colors.white),
            ),
          )
          // GestureDetector(
          //   onTap: () {
          //     Get.bottomSheet(NewVanRegoBottomSheet(data: data),
          //         isScrollControlled: true);
          //   },
          //   child: Container(
          //     padding: EdgeInsets.symmetric(
          //         horizontal: SizeConfig.widthMultiplier * 2,
          //         vertical: SizeConfig.heightMultiplier * .5),
          //     decoration: BoxDecoration(
          //       color: AppColors.primaryClr,
          //       borderRadius: BorderRadius.circular(30),
          //     ),
          //     child: Row(
          //       children: [
          //         Icon(
          //           AppIcons.edit,
          //           color: AppColors.whiteClr,
          //           size: SizeConfig.imageSizeMultiplier * 4,
          //         ),
          //         SizedBox(width: SizeConfig.widthMultiplier * 2),
          //         Text(
          //           "Edit",
          //           style: textTheme.bodySmall!
          //               .copyWith(color: AppColors.whiteClr),
          //         )
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
