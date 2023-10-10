import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whitefleet/constants/colors.dart';
import '../../../../utils/size_config.dart';

class ChooseSourceDialog extends StatefulWidget {
  const ChooseSourceDialog({
    Key? key,
    required this.onGalleryPress,
    required this.onCameraPress,
  });
  final VoidCallback onGalleryPress;
  final VoidCallback onCameraPress;
  @override
  State<StatefulWidget> createState() => ChooseSourceDialogState();
}

class ChooseSourceDialogState extends State<ChooseSourceDialog>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    scaleAnimation =
        CurvedAnimation(parent: controller!, curve: Curves.elasticInOut);

    controller!.addListener(() {
      setState(() {});
    });

    controller!.forward();
  }

  TextEditingController nameCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation!,
          child: Container(
            height: 17 * SizeConfig.heightMultiplier,
            width: 60 * SizeConfig.widthMultiplier,
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.heightMultiplier * 4,
                horizontal: SizeConfig.widthMultiplier * 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: widget.onCameraPress,
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/camera.svg",
                        color: AppColors.primaryClr,
                        height: SizeConfig.heightMultiplier * 5,
                      ),
                      SizedBox(height: SizeConfig.heightMultiplier * 1),
                      Text(
                        "Camera",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryClr),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: widget.onGalleryPress,
                  child: Column(
                    children: [
                      SvgPicture.asset("assets/icons/gallery.svg",
                          height: SizeConfig.heightMultiplier * 5,
                          color: AppColors.primaryClr),
                      SizedBox(height: SizeConfig.heightMultiplier * 1),
                      Text(
                        "Gallery",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryClr),
                      ),
                    ],
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
