import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/views/pages/chat/chat_room.dart';
import 'package:whitefleet/views/pages/notification/notification.dart';
import 'package:whitefleet/views/widgets/custom_appbar.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/constants/icons.dart';
import 'package:whitefleet/utils/size_config.dart';

import 'components/all_chat_card.dart';

class AllChatScreen extends StatelessWidget {
  const AllChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isleading: true, title: "Chat", actions: [
        IconButton(
          onPressed: () => Get.to(() => NotificationScreen(),
              transition: Transition.rightToLeft),
          icon: Icon(AppIcons.notification,
              size: SizeConfig.imageSizeMultiplier * 8),
        )
      ]),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: SizeConfig.heightMultiplier * 70,
              width: SizeConfig.widthMultiplier * 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: AppColors.defaultGradient),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.heightMultiplier * 2),
                ...List.generate(
                  20,
                  (index) => InkWell(
                    onTap: () {
                      Get.to(() => ChatRoomScreen(),
                          transition: Transition.rightToLeft);
                    },
                    child: const AllChatCard(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
