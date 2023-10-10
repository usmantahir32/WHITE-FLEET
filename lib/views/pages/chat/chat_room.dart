import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:whitefleet/views/widgets/custom_appbar.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/constants/icons.dart';
import 'package:whitefleet/utils/size_config.dart';

// ignore: must_be_immutable
class ChatRoomScreen extends StatelessWidget {
  ChatRoomScreen({super.key});

  List<String> msges = [
    "Hii",
    "Hi Adam, can you once check the invoice, there seems to be a mistake in calculation of the item value. ",
    "Hi Adam, can you once check the invoice, there seems to be a mistake in calculation of the item value. "
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: CustomAppbar(
        isleading: true,
        title: "Chat",
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              AppIcons.notification,
              size: SizeConfig.imageSizeMultiplier * 8,
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.heightMultiplier * 2,
            horizontal: SizeConfig.widthMultiplier * 4),
        decoration: BoxDecoration(
          gradient: AppColors.defaultGradient,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SizedBox(
          width: SizeConfig.widthMultiplier * 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Text("Sales Team", style: textTheme.headlineMedium)),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: msges.length,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: SizeConfig.heightMultiplier * 2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textDirection: index % 2 == 0
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                right: index % 2 == 0
                                    ? 0
                                    : SizeConfig.widthMultiplier * 2,
                                left: index % 2 == 0
                                    ? SizeConfig.widthMultiplier * 2
                                    : 0),
                            child: CircleAvatar(
                              backgroundImage:
                                  const AssetImage("assets/images/profile.jpg"),
                              radius: SizeConfig.imageSizeMultiplier * 5,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: index % 2 == 0
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxWidth: SizeConfig.widthMultiplier * 60),
                                child: Container(
                                  margin: EdgeInsets.only(
                                      bottom: SizeConfig.heightMultiplier * .5),
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.widthMultiplier * 2,
                                      vertical:
                                          SizeConfig.heightMultiplier * 1),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    msges[index],
                                    style: textTheme.displaySmall,
                                  ),
                                ),
                              ),
                              Text(
                                "3 minutes ago ...",
                                style: textTheme.displaySmall,
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: SizeConfig.heightMultiplier * 6,
                width: SizeConfig.widthMultiplier * 92,
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 2,
                    vertical: SizeConfig.heightMultiplier * .5),
                decoration: BoxDecoration(
                  color: AppColors.whiteClr,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(SizeConfig.widthMultiplier * 2),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xff9DC1FE)),
                        child: Icon(
                          FeatherIcons.camera,
                          color: AppColors.primaryClr,
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.widthMultiplier * 4),
                    Flexible(
                      child: TextField(
                        style: textTheme.bodySmall,
                        decoration: InputDecoration(
                            isCollapsed: true,
                            hintText: "Message",
                            hintStyle: textTheme.bodySmall,
                            border: InputBorder.none),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FeatherIcons.send,
                          color: AppColors.primaryClr,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
