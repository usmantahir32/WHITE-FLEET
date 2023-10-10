import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:whitefleet/controllers/scan_approvals.dart';
import '../../../../constants/decorations.dart';
import '../../../../utils/size_config.dart';

class ApprovalCalender extends StatelessWidget {
  ApprovalCalender({
    super.key,
  });
  final cont = Get.find<ScanApprovalsCont>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(
          left: SizeConfig.widthMultiplier * 4,
          right: SizeConfig.widthMultiplier * 4,
          bottom: SizeConfig.heightMultiplier * 2),
      decoration: AppDecorations.whiteBox
          .copyWith(borderRadius: BorderRadius.circular(12)),
      child: Obx(
        () => TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          calendarFormat: cont.calenderFormat.value!,
          eventLoader: (date) => cont.calendarEvents.value?[date] ?? [],
          startingDayOfWeek: StartingDayOfWeek.monday,
          rowHeight: SizeConfig.heightMultiplier * 5,
          headerStyle: HeaderStyle(
            leftChevronVisible: false,
            rightChevronVisible: false,
            formatButtonVisible: true,
            formatButtonTextStyle: textTheme.bodySmall!,
            formatButtonDecoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20)),
            titleTextStyle: textTheme.headlineSmall!,
            headerPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          ),
          daysOfWeekHeight: SizeConfig.heightMultiplier * 2,
          focusedDay: cont.selectedDay.value!,
          onDaySelected: (DateTime selectDay, DateTime focusDay) async {
            cont.selectedDay.value = selectDay;
            cont.focusedDay.value = focusDay;
          },
          selectedDayPredicate: (day) {
            return isSameDay(cont.selectedDay.value, day);
          },
          onFormatChanged: (format) {
            if (cont.calenderFormat.value! != format) {
              cont.calenderFormat.value = format;
            }
          },
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(.5),
                shape: BoxShape.circle),
            selectedDecoration: BoxDecoration(
                color: Theme.of(context).primaryColor, shape: BoxShape.circle),
          ),
        ),
      ),
    );
  }
}
