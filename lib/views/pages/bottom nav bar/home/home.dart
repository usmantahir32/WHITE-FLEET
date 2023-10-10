import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/controllers/home_controller.dart';
import 'package:whitefleet/constants/constants.dart';
import 'package:whitefleet/constants/icons.dart';
import 'package:whitefleet/constants/images.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/pages/chat/all_chats.dart';
import 'package:whitefleet/views/pages/enquiries/enquiries.dart';
import 'package:whitefleet/views/pages/notification/notification.dart';
import 'package:whitefleet/views/pages/task%20management/task_management.dart';
import '../../../../models/data.dart';
import 'components/quick_action_tile.dart';
import 'components/ongoing_shift_detail.dart';
import 'components/post_card.dart';
import 'components/scheduled_task.dart';
import 'components/today_task.dart';
import 'components/user_detail.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeCtrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
        final size=MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: SizeConfig.widthMultiplier * 18,
        leading: Padding(
          padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 4),
          child: Image.asset(AppImages.appLogo),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const NotificationScreen(),
                  transition: Transition.rightToLeft);
            },
            icon: Icon(
              AppIcons.notification,
              color: Colors.black,
              size: SizeConfig.imageSizeMultiplier * 8,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            const UserDetail(),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 6),
              child: Text("Ongoing Shift", style: textTheme.headlineMedium),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 1),
            Padding(
              padding:EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*5),
              child: const OngoingShiftDetail(),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*5),
              child: Text("Quick Actions", style: textTheme.headlineSmall),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(
                    quickActionTitles.length,
                    (index) => Padding(
                      padding:
                          EdgeInsets.only(left: SizeConfig.widthMultiplier * 7),
                      child: QuickActionTile(
                        title: quickActionTitles[index],
                        images: quickActionimages[index],
                        ontap: () {
                          if (index == 0) {
                            Get.to(() => const TaskManagementScreen(),
                                transition: Transition.rightToLeft);
                          } else if (index == 1) {
                            Get.to(() => EnquirieScreen(),
                                transition: Transition.rightToLeft);
                          } else if (index == 2) {
                            Get.to(() => AllChatScreen(),
                                transition: Transition.rightToLeft);
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 1),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*5),
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.heightMultiplier * 2),
                  TodayTask(),
                  SizedBox(height: SizeConfig.heightMultiplier * 2),
                  const ScheduledTask(),
                  SizedBox(height: SizeConfig.heightMultiplier * 2),
                  ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.heightMultiplier * 2),
                    itemBuilder: (_, i) => PostCard(index: i),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
