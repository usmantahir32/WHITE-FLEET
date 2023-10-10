import 'package:flutter/material.dart';
import 'package:whitefleet/models/enquiries.dart';
import '../../../../constants/colors.dart';
import '../../../../utils/size_config.dart';

class EnquiriesChatCard extends StatelessWidget {
  const EnquiriesChatCard({
    super.key, required this.data,
  });
final EnquiresData data;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: SizeConfig.heightMultiplier * 35,
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 4,
          vertical: SizeConfig.heightMultiplier * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Enquiry", style: textTheme.headlineSmall),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Case Info:",
                style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.55)
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                data.caseNumber.toString(),
                style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.55)
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Case Id:",
                style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.55)
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                "938478263",
                style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.55)
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Deadline:",
                style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.55)
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                "08/05/2023",
                style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.55)
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Driver Code:",
                style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.55)
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                "AHD-2345",
                style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.55)
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Item Value:",
                style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.55)
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                "\$257 AUD",
                style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.55)
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: SizeConfig.heightMultiplier * 4,
                width: SizeConfig.widthMultiplier * 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.redClr)),
                child: Center(
                  child: Text(
                    "Report Customer",
                    style:
                        textTheme.bodySmall!.copyWith(color: AppColors.redClr),
                  ),
                ),
              ),
              Container(
                height: SizeConfig.heightMultiplier * 4,
                width: SizeConfig.widthMultiplier * 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: AppColors.primaryClr),
                child: Center(
                  child: Text(
                    "Download PDF",
                    style: textTheme.bodySmall!
                        .copyWith(color: AppColors.whiteClr),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
