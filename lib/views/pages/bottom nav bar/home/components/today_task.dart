import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whitefleet/controllers/home_controller.dart';
import 'package:whitefleet/views/pages/bottom%20nav%20bar/home/components/camera_view.dart';
import 'package:whitefleet/views/widgets/choose_source.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/decorations.dart';
import '../../../../../utils/size_config.dart';

class TodayTask extends StatelessWidget {
  TodayTask({
    super.key,
  });

  final homeCtrl = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: AppDecorations.whiteBox
          .copyWith(borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * .5),
      child: ExpansionTile(
        tilePadding:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 3),
        title: Row(
          children: [
            CircleAvatar(
              radius: SizeConfig.widthMultiplier * 6,
              backgroundColor: AppColors.randomAccentColors[0].withOpacity(0.4),
              child: Icon(Icons.fact_check_sharp,
                  color: AppColors.randomAccentColors[0], size: 22),
            ),
            SizedBox(width: SizeConfig.widthMultiplier * 5),
            Text(
              "Today’s Tasks (4/4)",
              style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 1.8,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        iconColor: Colors.black,
        textColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        childrenPadding:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 2),
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: SizeConfig.heightMultiplier * 8,
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
                        "Scan Invoice",
                        style: textTheme.bodyMedium!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text("Click on scanner to scan invoice",
                          style: textTheme.displaySmall),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () async {
                      await availableCameras().then((value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CameraView(cameras: value))));
                    },
                    child: Icon(Icons.qr_code_scanner_rounded,
                        size: SizeConfig.imageSizeMultiplier * 10),
                  ),
                  SizedBox(width: SizeConfig.widthMultiplier * 3)
                ],
              ),
            ),
          ),
          Container(
            height: SizeConfig.heightMultiplier * 8,
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
                      "Spanbilt Deppo",
                      style: textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text("Take photo, count after delivery",
                        style: textTheme.displaySmall),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text("Deppo Count: ", style: textTheme.bodySmall),
                        Text(
                          "5",
                          style: textTheme.bodySmall!.copyWith(
                              color: AppColors.primaryClr,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.dialog(ChooseSourceDialog(onGalleryPress: () {
                          homeCtrl.selectingImages(ImageSource.gallery);
                        }, onCameraPress: () {
                          homeCtrl.selectingImages(ImageSource.camera);
                        }));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.widthMultiplier * 2,
                          vertical: SizeConfig.heightMultiplier * .5,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: AppColors.primaryClr),
                        child: Row(
                          children: [
                            Icon(FeatherIcons.camera,
                                color: AppColors.whiteClr,
                                size: SizeConfig.imageSizeMultiplier * 3),
                            SizedBox(width: SizeConfig.widthMultiplier * 2),
                            Text(
                              "Take photo",
                              style: textTheme.displaySmall!.copyWith(
                                color: AppColors.whiteClr,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(width: SizeConfig.widthMultiplier * 3)
              ],
            ),
          ),
          Container(
            height: SizeConfig.heightMultiplier * 8,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "St John’s School",
                      style: textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text("Take photo, count after delivery",
                        style: textTheme.displaySmall),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 6,
                      vertical: SizeConfig.heightMultiplier * .5,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColors.primaryClr),
                    child: Text(
                      "Done",
                      style: textTheme.displaySmall!.copyWith(
                        color: AppColors.whiteClr,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: SizeConfig.widthMultiplier * 3),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
        ],
      ),
    );
  }
}
