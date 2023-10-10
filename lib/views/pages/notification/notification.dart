import 'package:flutter/material.dart';
import 'package:whitefleet/views/widgets/custom_back_btn.dart';
import '../../../constants/colors.dart';
import '../../../utils/size_config.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Notification",
          style: textTheme.headlineLarge,
        ),
        leadingWidth: SizeConfig.widthMultiplier * 14,
        leading: const CustomBackBtn(),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.defaultGradient),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.heightMultiplier * 12),
              ...List.generate(
                4,
                (index) => Container(
                  width: SizeConfig.widthMultiplier * 92,
                  margin:
                      EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2),
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.heightMultiplier * 2,
                      horizontal: SizeConfig.widthMultiplier * 4),
                  decoration: BoxDecoration(
                    color: const Color(0xffC2E8FF),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.greyClr),
                  ),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pending Approval ",
                            style: TextStyle(
                                    fontSize: SizeConfig.textMultiplier * 1.55)
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: SizeConfig.widthMultiplier * 67,
                            child: Text(
                              "Hi Harry, Pamela has sent an Approval Request for R&Z Depot.",
                              style: textTheme.displaySmall!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textMediumClr),
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.more_vert_rounded,
                          color: Colors.black,
                          size: SizeConfig.imageSizeMultiplier * 6,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
