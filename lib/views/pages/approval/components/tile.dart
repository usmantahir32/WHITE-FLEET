import 'package:flutter/material.dart';
import 'package:whitefleet/models/scan_approvals.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/images.dart';
import '../../../../utils/size_config.dart';
import '../../../bottom sheets/approvals_detail.dart';

class ApprovalTile extends StatelessWidget {
  const ApprovalTile({
    super.key,
    required this.data,
  });
  final ScanApprovalsData data;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
        builder: (context) {
          return const ApprovalDetailBS();
        },
      ),
      child: Container(
        height: SizeConfig.heightMultiplier * 15,
        width: SizeConfig.widthMultiplier * 92,
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.widthMultiplier * 2,
            vertical: SizeConfig.heightMultiplier * 1),
        margin: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyClr),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            Container(
              height: SizeConfig.heightMultiplier * 13,
              width: SizeConfig.widthMultiplier * 20,
              margin: EdgeInsets.only(right: SizeConfig.widthMultiplier * 4),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.receipt), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.driverName!,
                  style: textTheme.bodyLarge!.copyWith(
                      color: AppColors.textClr, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 1),
                _rowInfo('Total Items', data.totalItems.toString()),
                _rowInfo('Total Price', '54'),
                _rowInfo('Login Id', '12'),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 2,
                      vertical: SizeConfig.heightMultiplier * .5),
                  decoration: BoxDecoration(
                    color: AppColors.yellowClr,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    "First Run",
                    style: textTheme.bodySmall!.copyWith(
                        color: AppColors.whiteClr, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 2,
                      vertical: SizeConfig.heightMultiplier * .5),
                  decoration: BoxDecoration(
                    color: const Color(0xff898FAA),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    "Manual",
                    style: textTheme.bodySmall!.copyWith(
                        color: AppColors.whiteClr, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _rowInfo(String title, String value) {
    return SizedBox(
      width: SizeConfig.widthMultiplier * 28,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title:",
            style: TextStyle(
                color: AppColors.textMediumClr,
                fontSize: SizeConfig.textMultiplier * 1.2,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: SizeConfig.widthMultiplier * 8,
            child: Text(
              value,
              style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 1.6,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
