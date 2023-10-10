import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whitefleet/controllers/scan_approvals.dart';
import 'tile.dart';

class ApprovalsList extends StatelessWidget {
  ApprovalsList({
    super.key,
  });

  final cont = Get.find<ScanApprovalsCont>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(
            cont.getScanApprovals!.data!.length,
            (index) => ApprovalTile(data: cont.getScanApprovals!.data![index]),
          )
        ],
      ),
    );
  }
}
