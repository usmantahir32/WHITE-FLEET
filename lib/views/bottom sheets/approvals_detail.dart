import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../utils/size_config.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_textfield.dart';

class ApprovalDetailBS extends StatelessWidget {
  const ApprovalDetailBS({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: SizeConfig.heightMultiplier * 92,
      width: SizeConfig.widthMultiplier * 100,
      padding: EdgeInsets.only(
          top: SizeConfig.heightMultiplier * 2,
          left: SizeConfig.widthMultiplier * 4,
          right: SizeConfig.widthMultiplier * 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Spanbit Depot",
              style: textTheme.headlineMedium,
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: SizeConfig.heightMultiplier * 32,
              width: SizeConfig.widthMultiplier * 49,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                    image: AssetImage(AppImages.receipt), fit: BoxFit.contain),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          Text(
            "Driver Name",
            style: textTheme.bodyMedium!.copyWith(
                color: AppColors.textClr, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * .5),
          CustomTextField(
            hintText: "Name",
            controller: nameController,
            isSpacing: true,
          ),
          Text(
            "Total Price",
            style: textTheme.bodyMedium!.copyWith(
                color: AppColors.textClr, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * .5),
          CustomTextField(
            hintText: "Price",
            controller: nameController,
            isSpacing: true,
          ),
          Text(
            "Total Items",
            style: textTheme.bodyMedium!.copyWith(
                color: AppColors.textClr, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * .5),
          CustomTextField(
            hintText: "Items",
            controller: nameController,
            isSpacing: true,
          ),
          Text(
            "Login Id",
            style: textTheme.bodyMedium!.copyWith(
                color: AppColors.textClr, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * .5),
          CustomTextField(
            hintText: "Id",
            controller: nameController,
            isSpacing: true,
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                title: "Cancel",
                onTap: () {},
                isBorder: true,
              ),
              CustomButton(
                title: "Done",
                onTap: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}

final TextEditingController nameController = TextEditingController();
