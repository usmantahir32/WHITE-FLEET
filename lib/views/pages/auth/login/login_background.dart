import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/constants/images.dart';
import 'package:whitefleet/views/pages/auth/pin%20resgister/pin_register.dart';
import 'package:whitefleet/views/widgets/auth_button.dart';
import '../../../../utils/size_config.dart';

// ignore: must_be_immutable
class LoginBackground extends StatelessWidget {
  LoginBackground({super.key});
  List<IconData> images = [
    FeatherIcons.home,
    FeatherIcons.dollarSign,
    Icons.location_on_outlined
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: [
          Container(
            height: SizeConfig.heightMultiplier * 100,
            width: SizeConfig.widthMultiplier * 100,
            color: Colors.black,
            child: ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.transparent],
                ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.dstIn,
              child: Image.asset(
                AppImages.authBackground,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.heightMultiplier * 10,
                ),
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 4,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Uday",
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 4,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 58),
                AuthButton(
                  title: "Login",
                  onTap: () => Get.to(() => PinRegisterPage(isLogin: true),
                      transition: Transition.rightToLeft),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 4),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(
                        3,
                        (index) => IconButton(
                          onPressed: () {},
                          icon: Icon(images[index],
                              color: AppColors.whiteClr,
                              size: SizeConfig.imageSizeMultiplier * 7),
                        ),
                      )
                    ],
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
