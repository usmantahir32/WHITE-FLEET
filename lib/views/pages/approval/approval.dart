import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/controllers/scan_approvals.dart';
import 'package:whitefleet/views/pages/approval/components/calendar.dart';
import 'package:whitefleet/views/widgets/custom_appbar.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/widgets/loading.dart';
import 'package:whitefleet/views/widgets/no_data.dart';
import 'components/list.dart';

class ApprovalScreen extends StatefulWidget {
  const ApprovalScreen({super.key});

  @override
  State<ApprovalScreen> createState() => _ApprovalScreenState();
}

class _ApprovalScreenState extends State<ApprovalScreen>
    with TickerProviderStateMixin {
  final cont = Get.put(ScanApprovalsCont());
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const CustomAppbar(title: "Approvals", isleading: true),
      body: Obx(
        () => Column(
          children: [
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            //CALENDAR
            ApprovalCalender(),
            //TABS
            Container(
              height: SizeConfig.heightMultiplier * 5,
              margin: EdgeInsets.only(
                bottom: SizeConfig.heightMultiplier * 1,
                left: SizeConfig.widthMultiplier * 4,
                right: SizeConfig.widthMultiplier * 4,
              ),
              decoration: BoxDecoration(
                color: const Color(0xffE2E5EC),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TabBar(
                unselectedLabelColor: AppColors.primaryClr,
                labelColor: Colors.white,
                labelPadding: EdgeInsets.zero,
                tabs: [
                  _tabItem('Recieved', 1),
                  _tabItem('Approved', 5),
                  _tabItem('Pending', 16)
                ],
                unselectedLabelStyle:
                    textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                labelStyle:
                    textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                indicator: BoxDecoration(
                  color: AppColors.primaryClr,
                  gradient: LinearGradient(colors: [
                    AppColors.primaryClr,
                    AppColors.primaryClr.withOpacity(.6)
                  ]),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),
            //TABS BODY
            cont.getScanApprovals == null
                ? LoadingWidget(height: SizeConfig.heightMultiplier * 50)
                : cont.getScanApprovals!.data!.isEmpty
                    ? NoDataWidget(text: 'Approvals not found!')
                    : Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            ApprovalsList(),
                            ApprovalsList(),
                            ApprovalsList(),
                          ],
                        ),
                      ),
          ],
        ),
      ),
    );
  }

  Widget _tabItem(String text, int value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Tab(text: text),
        Container(
          width: SizeConfig.widthMultiplier * 8,
          margin: EdgeInsets.only(left: SizeConfig.widthMultiplier * 2),
          decoration: const BoxDecoration(
            color: Colors.black12,
            shape: BoxShape.circle,
          ),
          child: Tab(text: cont.pending.toString()),
        ),
      ],
    );
  }
}
