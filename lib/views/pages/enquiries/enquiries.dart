import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/models/enquiries.dart';
import 'package:whitefleet/views/pages/enquiries%20chat/enquiries_chat.dart';
import 'package:whitefleet/views/pages/notification/notification.dart';
import 'package:whitefleet/views/widgets/custom_appbar.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/constants/decorations.dart';
import 'package:whitefleet/constants/icons.dart';
import 'package:whitefleet/utils/size_config.dart';

import '../../../controllers/enquiries.dart';
import '../../widgets/loading.dart';
import '../../widgets/no_data.dart';

class EnquirieScreen extends StatelessWidget {
  EnquirieScreen({super.key});

  final cont = Get.put(EnquiriesCont());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: CustomAppbar(
        isleading: true,
        title: "Enquiries",
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => NotificationScreen(),
                  transition: Transition.rightToLeft);
            },
            icon: Icon(AppIcons.notification,
                size: SizeConfig.imageSizeMultiplier * 8),
          )
        ],
      ),
      body: Obx(
        () => cont.getAllEnquiries == null
            ? LoadingWidget(height: SizeConfig.heightMultiplier * 80)
            : Center(
                child: cont.getAllEnquiries == null
                    ? NoDataWidget(text: 'No Enquires Yet!')
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: SizeConfig.heightMultiplier * 2),
                            Container(
                              width: SizeConfig.widthMultiplier * 92,
                              padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.widthMultiplier * 2,
                                  vertical: SizeConfig.heightMultiplier * 2),
                              decoration: AppDecorations.shadowBox,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Active Enquiries  (${cont.getAllEnquiries!.dataWithActiveStatus!.length})",
                                    style: textTheme.bodyLarge!
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  ...List.generate(
                                    cont.getAllEnquiries!.dataWithActiveStatus!
                                        .length,
                                    (index) => GestureDetector(
                                      onTap: () => Get.to(
                                          () => EnquiriesChatRoom(
                                                enquiryData: cont
                                                        .getAllEnquiries!
                                                        .dataWithActiveStatus![
                                                    index],
                                              ),
                                          transition: Transition.rightToLeft),
                                      child: ActiveEnquireyCard(
                                        data: cont.getAllEnquiries!
                                            .dataWithActiveStatus![index],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: SizeConfig.heightMultiplier * 2),
                            Container(
                              width: SizeConfig.widthMultiplier * 92,
                              padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.widthMultiplier * 2,
                                  vertical: SizeConfig.heightMultiplier * 2),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [AppDecorations.defaultShadow]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Completed Enquiries (${cont.getAllEnquiries!.dataWithInactiveStatus!.length})",
                                    style: textTheme.bodyLarge!
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  ...List.generate(
                                    cont.getAllEnquiries!
                                        .dataWithInactiveStatus!.length,
                                    (index) => CompletedEnquireyCard(
                                      data: cont.getAllEnquiries!
                                          .dataWithInactiveStatus![index],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
              ),
      ),
    );
  }
}

class ActiveEnquireyCard extends StatelessWidget {
  const ActiveEnquireyCard({
    super.key,
    required this.data,
  });

  final EnquiresData data;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: SizeConfig.heightMultiplier * 12,
      width: SizeConfig.widthMultiplier * 92,
      margin: EdgeInsets.only(top: SizeConfig.heightMultiplier * 2),
      decoration: AppDecorations.whiteBox,
      child: Row(
        children: [
          Container(
            width: SizeConfig.widthMultiplier * 3,
            decoration: BoxDecoration(
              color: AppColors.yellowClr,
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(6),
              ),
            ),
          ),
          SizedBox(width: SizeConfig.widthMultiplier * 3),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Disputed Delivery Scan",
                style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.55)
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                data.caseNumber ?? "No Case Number",
                style: textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textMediumClr),
              ),
              Text(
                data.createdDate ?? "No Date Created",
                style:
                    textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),
              ),
              Text(
                "\$${data.value ?? ""}AUD",
                style:
                    textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: SizeConfig.widthMultiplier * 25,
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 2,
                vertical: SizeConfig.heightMultiplier * .5,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.yellowClr),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Active",
                    style: textTheme.bodySmall!.copyWith(
                        color: AppColors.whiteClr, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: SizeConfig.widthMultiplier * 3),
        ],
      ),
    );
  }
}

class CompletedEnquireyCard extends StatelessWidget {
  const CompletedEnquireyCard({
    super.key,
    required this.data,
  });

  final EnquiresData data;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: SizeConfig.heightMultiplier * 8,
      width: SizeConfig.widthMultiplier * 92,
      margin: EdgeInsets.only(top: SizeConfig.heightMultiplier * 2),
      decoration: AppDecorations.whiteBox,
      child: Row(
        children: [
          Container(
            width: SizeConfig.widthMultiplier * 3,
            decoration: BoxDecoration(
              color: AppColors.primaryClr,
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(6),
              ),
            ),
          ),
          SizedBox(width: SizeConfig.widthMultiplier * 3),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Disputed Delivery Scan",
                style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.55)
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                data.createdDate ?? "No Date To Show",
                style:
                    textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: SizeConfig.widthMultiplier * 25,
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 2,
                vertical: SizeConfig.heightMultiplier * .5,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.primaryClr),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Completed",
                    style: textTheme.bodySmall!.copyWith(
                        color: AppColors.whiteClr, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: SizeConfig.widthMultiplier * 3),
        ],
      ),
    );
  }
}
