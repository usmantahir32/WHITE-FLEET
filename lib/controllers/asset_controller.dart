import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class AssetController extends GetxController {
  RxInt selectedPaySlip = 0.obs;
  Rxn<DateTime> selectedDay = Rxn<DateTime>();
  Rxn<DateTime> focusedDay = Rxn<DateTime>();
  Rxn<CalendarFormat> calenderFormat = Rxn<CalendarFormat>();
  @override
  void onInit() {
    super.onInit();
    selectedDay.value = DateTime.now();
    calenderFormat.value = CalendarFormat.week;
  }
}
