import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/images.dart';
import 'package:whitefleet/controllers/driver_detail.dart';
import 'package:whitefleet/models/deppos.dart';
import 'package:whitefleet/views/bottom%20sheets/add_deppo_invoice.dart';
import 'package:whitefleet/views/bottom%20sheets/search_deppo.dart';
import 'package:whitefleet/views/widgets/loading.dart';
import 'package:whitefleet/views/widgets/no_data.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/decorations.dart';
import '../../../../utils/size_config.dart';
import '../../../widgets/custom_btn.dart';

class DeppoCard extends StatelessWidget {
  DeppoCard({
    super.key,
  });
  final cont = Get.find<DriverDetailCont>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Container(
          decoration: AppDecorations.whiteBox.copyWith(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ExpansionTile(
            title: Row(
              children: [
                Image.asset(
                  AppImages.deppo,
                  height: SizeConfig.imageSizeMultiplier * 8,
                ),
                SizedBox(width: SizeConfig.widthMultiplier * 5),
                Text(
                  "Deppo",
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
            childrenPadding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 2),
            children: [
              Obx(
                ()=> cont.deppoInvoiceData.value == null
                    ? LoadingWidget(height: SizeConfig.heightMultiplier * 10)
                    : cont.deppoInvoiceData.value!.isEmpty
                        ? NoDataWidget(text: 'No invoices for deppo')
                        : Column(
                            children: [
                              ...List.generate(
                                 cont.deppoInvoiceData.value!.length,
                                  (index) {
                                final data = cont.deppoInvoiceData.value![index];
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: SizeConfig.heightMultiplier * 2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${data.runTypeName}:",
                                        style: TextStyle(
                                                fontSize:
                                                    SizeConfig.textMultiplier *
                                                        1.55)
                                            .copyWith(
                                                color: AppColors.textClr,
                                                fontWeight: FontWeight.w600),
                                      ),
                                      Container(
                                        height: SizeConfig.heightMultiplier * 5,
                                        width: SizeConfig.widthMultiplier * 50,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                                width:
                                                    SizeConfig.widthMultiplier *
                                                        4),
                                            Text(
                                              "\$50",
                                              style: textTheme.bodyMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                            Text(
                                              " AUD",
                                              style: textTheme.bodyMedium!
                                                  .copyWith(
                                                      color: AppColors.primaryClr,
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                            const Spacer(),
                                            Container(
                                              height:
                                                  SizeConfig.heightMultiplier * 5,
                                              width:
                                                  SizeConfig.widthMultiplier * 15,
                                              decoration: BoxDecoration(
                                                  color: AppColors.primaryClr,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(12),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  12))),
                                              child: Center(
                                                child: Text(
                                                  "Per Day",
                                                  style: textTheme.bodySmall!
                                                      .copyWith(
                                                          color:
                                                              AppColors.whiteClr),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                            ],
                          ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              CustomButton(
                title: "Add New Task",
                onTap: () async => Get.bottomSheet(AddDeppoInvoiceBS(),
                    isScrollControlled: true),
                isLarged: true,
                isIcon: true,
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
            ],
          ),
        )
      ],
    );
  }
}
