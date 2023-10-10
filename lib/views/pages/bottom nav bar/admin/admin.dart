import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/views/pages/approval/approval.dart';
import 'package:whitefleet/views/pages/driver%20management/driver_managemet.dart';
import 'package:whitefleet/views/pages/enquiries/enquiries.dart';
import 'package:whitefleet/views/pages/job%20and%20inventory/job_and_inventory.dart';
import 'package:whitefleet/views/pages/notification/notification.dart';
import 'package:whitefleet/views/pages/task%20management/task_management.dart';
import 'package:whitefleet/views/widgets/custom_appbar.dart';
import 'package:whitefleet/constants/icons.dart';
import '../../../../models/data.dart';
import 'components/admin_tile.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppbar(
        title: "Admin",
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => NotificationScreen(),
                    transition: Transition.rightToLeft);
              },
              icon: Icon(
                AppIcons.notification,
                color: Colors.black,
                size:size.width*0.08,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height*0.03),
          SizedBox(
            width: size.width*1,
            child: Wrap(
              runSpacing: size.height*0.02,
              alignment: WrapAlignment.center,
              spacing: size.width*0.05,
              children: [
                ...List.generate(
                  optionTitles.length,
                  (index) => AdminTile(
                    title: optionTitles[index],
                    images: optionimages[index],
                    ontap: () {
                      if (index == 0) {
                        Get.to(() => const ApprovalScreen(),
                            transition: Transition.rightToLeft);
                      } else if (index == 1) {
                        Get.to(() =>  DriverManagementScreen(),
                            transition: Transition.rightToLeft);
                      } else if (index == 2) {
                        Get.to(() => JobAndInventoryScreen(),
                            transition: Transition.rightToLeft);
                      } else if (index == 3) {
                        Get.to(() => EnquirieScreen());
                      } else if (index == 4) {
                        Get.to(() => TaskManagementScreen(),
                            transition: Transition.rightToLeft);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
