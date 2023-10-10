import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:whitefleet/controllers/routes.dart';
import 'package:whitefleet/models/routes.dart';
import 'package:whitefleet/views/bottom%20sheets/add_route.dart';
import 'package:whitefleet/views/bottom%20sheets/edit_route_bottomsheet.dart';
import 'package:whitefleet/views/pages/notification/notification.dart';
import 'package:whitefleet/views/widgets/confirmation_dialog.dart';
import 'package:whitefleet/views/widgets/custom_appbar.dart';
import 'package:whitefleet/views/widgets/custom_btn.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/widgets/loading.dart';
import 'package:whitefleet/views/widgets/no_data.dart';
import '../../../constants/icons.dart';

class RoutesScreen extends StatelessWidget {
  RoutesScreen({super.key});
  final cont = Get.put(RoutesCont());
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: CustomAppbar(
        title: "Routes",
        isleading: true,
        actions: [
          IconButton(
              onPressed: () =>
                  Get.bottomSheet(AddRouteBS(), isScrollControlled: true),
              icon: Icon(
                FeatherIcons.plus,
                color: Colors.black,
                size: SizeConfig.imageSizeMultiplier * 8,
              )),
          IconButton(
              onPressed: () {
                Get.to(() => const NotificationScreen(),
                    transition: Transition.rightToLeft);
              },
              icon: Icon(
                AppIcons.notification,
                color: Colors.black,
                size: SizeConfig.imageSizeMultiplier * 8,
              ))
        ],
      ),
      body: Obx(
        () => cont.getRoutes == null
            ? LoadingWidget(height: SizeConfig.heightMultiplier * 80)
            : cont.getRoutes!.data!.isEmpty
                ? NoDataWidget(
                    text: 'Routes not found!',
                  )
                : Center(
                    child: Column(
                      children: [
                        SizedBox(height: SizeConfig.heightMultiplier * 2),
                        ...List.generate(
                          cont.getRoutes!.data!.length,
                          (index) => RouteTile(
                            data: cont.getRoutes!.data![index],
                          ),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}

class RouteTile extends StatelessWidget {
  RouteTile({
    super.key,
    required this.data,
  });

  final RouteData data;
  final cont = Get.find<RoutesCont>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: SizeConfig.heightMultiplier * 8,
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
                data.name!,
                style:
                    textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
              )
            ],
          ),
          const Spacer(),
          //EDIT
          InkWell(
            onTap: () => Get.bottomSheet(AddRouteBS(data: data),
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
                subtitle: 'Are you sure you want to delete this route?',
                onContinue: () => cont.deleteRoute(data.id!))),
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
