import 'dart:convert';

import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:whitefleet/constants/api.dart';
import 'package:whitefleet/constants/cont.dart';
import 'package:whitefleet/models/event.dart';
import 'package:whitefleet/models/scan_approvals.dart';
import 'package:whitefleet/services/api.dart';
import 'package:whitefleet/views/widgets/custom_snackbar.dart';

class ScanApprovalsCont extends GetxController {
  RxInt task = 3.obs;
  RxInt received = 22.obs;
  RxInt pending = 8.obs;

  Rxn<DateTime> selectedDay = Rxn<DateTime>();
  Rxn<DateTime> focusedDay = Rxn<DateTime>();
  Rxn<CalendarFormat> calenderFormat = Rxn<CalendarFormat>();

  //FOR APIS
  Rxn<ScanApprovalsModel> scanApprovals = Rxn<ScanApprovalsModel>();
  ScanApprovalsModel? get getScanApprovals => scanApprovals.value;
  Rxn<Map<DateTime, List<Event>>> calendarEvents =
      Rxn<Map<DateTime, List<Event>>>();
  Map<DateTime, List<Event>>? get getCalendarEvents => calendarEvents.value;

  //GET SCAN APPROVALS
  Future<void> _getScanApprovals() async {
    try {
      final response = await ApiService.get(
          '${ApiConstants.endpoint}inventory/supervisor/scan-approvals/${authCont.userID}');
      if (response != null) {
        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          scanApprovals.value = ScanApprovalsModel.fromJson(jsonData);
          //GETTING EVENTS
          _getEvents();
        } else {
          CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
        }
      } else {
        CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
      }
    } catch (e) {
      CustomSnackbar.showCustomSnackbar(true, 'Something went wrong');
    }
  }

  //GET EVENTS
  void _getEvents() {
    final data = getScanApprovals!.data!;
    for (var i = 0; i < data.length; i++) {
      final date = data[i].dateOfScan.toString().split('T')[0];

      if (calendarEvents.value![DateTime.parse('$date 00:00:00.000Z')] !=
          null) {
        //print("Adding");
        calendarEvents.value![DateTime.parse('$date 00:00:00.000Z')]!
            .add(Event(title: data[i].id!));
      } else {
        /*if selectedevent[date which is coming from firebase]
                                  is equal to null then this condition will run
                                  */
        calendarEvents.value![DateTime.parse('$date 00:00:00.000Z')] = [
          Event(title: data[i].id!)
        ];
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    selectedDay.value = DateTime.now();
    calenderFormat.value = CalendarFormat.week;
    calendarEvents.value = {};
    Future.delayed(Duration.zero, () => _getScanApprovals());
  }
}
