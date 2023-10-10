import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:whitefleet/controllers/enquiry_chat.dart';
import 'package:whitefleet/models/enquiries.dart';
import 'package:whitefleet/models/enquiry_chat.dart';
import 'package:whitefleet/views/widgets/custom_appbar.dart';
import 'package:whitefleet/constants/icons.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/widgets/loading.dart';
import 'package:whitefleet/views/widgets/no_data.dart';
import '../../../constants/colors.dart';
import 'components/enquiries_card.dart';
import 'package:timeago/timeago.dart' as timeago;

// ignore: must_be_immutable
class EnquiriesChatRoom extends StatefulWidget {
  EnquiriesChatRoom({super.key, required this.enquiryData});
  final EnquiresData enquiryData;

  @override
  State<EnquiriesChatRoom> createState() => _EnquiriesChatRoomState();
}

class _EnquiriesChatRoomState extends State<EnquiriesChatRoom> {
  List<String> msges = [
    "Hii",
    "Hi Adam, can you once check the invoice, there seems to be a mistake in calculation of the item value. "
  ];
  final cont = Get.put(EnquiryChatCont());
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,
        () => cont.getEnquiryChat(widget.enquiryData.enquiryId!));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: CustomAppbar(
        title: "Enquiries",
        isleading: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(AppIcons.notification,
                size: SizeConfig.imageSizeMultiplier * 8),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.defaultGradient),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EnquiriesChatCard(data: widget.enquiryData),
            StreamBuilder<List<ChatRequests>?>(
                stream: cont
                    .getEnquiryChat(widget.enquiryData.enquiryId!)
                    .asStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LoadingWidget(
                        height: SizeConfig.heightMultiplier * 50);
                  } else {
                    if (snapshot.data!.isEmpty) {
                      return NoDataWidget(text: "No Chat Yet!");
                    } else {
                      final data = snapshot.data!;
                      return Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.heightMultiplier * 2,
                              horizontal: SizeConfig.widthMultiplier * 4),
                          decoration: const BoxDecoration(
                            color: Color(0xffBFEBFF),
                            borderRadius: BorderRadius.only(
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
                                    child: Text("Chat with Supervisor",
                                        style: textTheme.headlineMedium)),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: data.length,
                                    reverse: true,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      // final chat=cont.getChat!.data!.chatRequests![index];
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            bottom:
                                                SizeConfig.heightMultiplier *
                                                    2),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          textDirection: index % 2 == 0
                                              ? TextDirection.rtl
                                              : TextDirection.ltr,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: index % 2 == 0
                                                      ? 0
                                                      : SizeConfig
                                                              .widthMultiplier *
                                                          2,
                                                  left: index % 2 == 0
                                                      ? SizeConfig
                                                              .widthMultiplier *
                                                          2
                                                      : 0),
                                              child: CircleAvatar(
                                                backgroundImage: const AssetImage(
                                                    "assets/images/profile.jpg"),
                                                radius: SizeConfig
                                                        .imageSizeMultiplier *
                                                    5,
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment: index % 2 == 0
                                                  ? CrossAxisAlignment.end
                                                  : CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: SizeConfig
                                                              .heightMultiplier *
                                                          .5),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: SizeConfig
                                                              .widthMultiplier *
                                                          2,
                                                      vertical: SizeConfig
                                                              .heightMultiplier *
                                                          1),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: Text(
                                                    data[index].from!,
                                                    style:
                                                        textTheme.displaySmall,
                                                  ),
                                                ),
                                                Text(
                                                  timeago.format(DateTime.parse(
                                                      data[index]
                                                          .messagedDate!)),
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
                                      horizontal:
                                          SizeConfig.widthMultiplier * 2,
                                      vertical:
                                          SizeConfig.heightMultiplier * .5),
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteClr,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          padding: EdgeInsets.all(
                                              SizeConfig.widthMultiplier * 2),
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff9DC1FE)),
                                          child: Icon(
                                            FeatherIcons.camera,
                                            color: AppColors.primaryClr,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.widthMultiplier * 4),
                                      Flexible(
                                        child: TextField(
                                          controller: cont.msgCont,
                                          style: textTheme.bodySmall,
                                          decoration: InputDecoration(
                                              isCollapsed: true,
                                              hintText: "Message",
                                              hintStyle: textTheme.bodySmall,
                                              border: InputBorder.none),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () => cont.sendMsg(
                                              widget.enquiryData.enquiryId!),
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
                }),
          ],
        ),
      ),
    );
  }
}
