import 'dart:async';
import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/bottom%20sheets/ocr_bottomsheet.dart';
import 'dart:io' as io;

import '../../../../../controllers/ocr_controller.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key, required this.cameras});
  final List<CameraDescription>? cameras;

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  late CameraController _cameraController;

  bool torch = false;

  int selectedType = 0;
  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initCamera(widget.cameras![0]);
  }

  final ocrCont = Get.put(OCRCont());

  Future takePicture() async {
    if (!_cameraController.value.isInitialized) {
      return null;
    }
    if (_cameraController.value.isTakingPicture) {
      return null;
    }
    try {
      await _cameraController.setFlashMode(FlashMode.off);
      XFile picture = await _cameraController.takePicture();
      final bytes = await io.File(picture.path).readAsBytesSync();

      var b = base64Encode(bytes);
      print("object");
      print(b);
      ocrCont.scanOCR(b);
      Get.bottomSheet(OCRBottomSheet(picture: picture),
          isScrollControlled: true);
      print('success');
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }

  Future initCamera(CameraDescription cameraDescription) async {
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(gradient: AppColors.defaultGradient),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        cameraWidget(context),
        SizedBox(height: SizeConfig.heightMultiplier * 5),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthMultiplier * 4,
              vertical: SizeConfig.heightMultiplier * 1),
          width: SizeConfig.widthMultiplier * 80,
          decoration: BoxDecoration(
            color: AppColors.primaryClr,
            borderRadius: BorderRadius.circular(10),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
              onPressed: () {
                setState(() {
                  torch = !torch;
                });
                if (torch == false) {
                  _cameraController.setFlashMode(FlashMode.off);
                } else if (torch == true) {
                  _cameraController.setFlashMode(FlashMode.torch);
                }
              },
              icon: Icon(
                Icons.flash_on_rounded,
                color: AppColors.whiteClr,
                size: SizeConfig.imageSizeMultiplier * 9,
              ),
            ),
            IconButton(
              onPressed: () {
                takePicture();
              },
              icon: Icon(
                Icons.radio_button_checked,
                color: AppColors.whiteClr,
                size: SizeConfig.imageSizeMultiplier * 9,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.image_rounded,
                color: AppColors.whiteClr,
                size: SizeConfig.imageSizeMultiplier * 9,
              ),
            ),
          ]),
        ),
        SizedBox(
          height: 2 * SizeConfig.heightMultiplier,
        ),
        Text(
          "Add Manual ",
          style: textTheme.bodyMedium!
              .copyWith(fontWeight: FontWeight.w600, color: AppColors.textClr),
        ),
      ]),
    ));
  }

  Widget cameraWidget(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 1.5),
      width: SizeConfig.widthMultiplier * 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
              width: SizeConfig.widthMultiplier * 82,
              height: SizeConfig.heightMultiplier * 50,
              child: CameraPreview(_cameraController)),
          Positioned(
              top: SizeConfig.heightMultiplier * 2,
              right: SizeConfig.widthMultiplier * 10,
              child: Container(
                width: 100,
                decoration: const BoxDecoration(
                    border:
                        Border(top: BorderSide(color: Colors.white, width: 1))),
              )),
          Positioned(
              top: SizeConfig.heightMultiplier * 2,
              right: SizeConfig.widthMultiplier * 10,
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                    border: Border(
                        left: BorderSide(color: Colors.white, width: 1))),
              )),
          Positioned(
              top: SizeConfig.heightMultiplier * 2,
              left: SizeConfig.widthMultiplier * 10,
              child: Container(
                width: 100,
                decoration: const BoxDecoration(
                    border:
                        Border(top: BorderSide(color: Colors.white, width: 1))),
              )),
          Positioned(
              top: SizeConfig.heightMultiplier * 2,
              left: SizeConfig.widthMultiplier * 10,
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                    border: Border(
                        left: BorderSide(color: Colors.white, width: 1))),
              )),
          Positioned(
              bottom: SizeConfig.heightMultiplier * 2,
              left: SizeConfig.widthMultiplier * 10,
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                    border: Border(
                        left: BorderSide(color: Colors.white, width: 1))),
              )),
          Positioned(
              bottom: SizeConfig.heightMultiplier * 2,
              right: SizeConfig.widthMultiplier * 10,
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white, width: 1))),
              )),
          Positioned(
              bottom: SizeConfig.heightMultiplier * 2,
              right: SizeConfig.widthMultiplier * 10,
              child: Container(
                width: 100,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.white, width: 1))),
              )),
          Positioned(
              bottom: SizeConfig.heightMultiplier * 2,
              left: SizeConfig.widthMultiplier * 10,
              child: Container(
                width: 100,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.white, width: 1))),
              )),
        ],
      ),
    );
  }
}
