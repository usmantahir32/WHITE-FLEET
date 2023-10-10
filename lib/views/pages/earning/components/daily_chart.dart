import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../Constants/colors.dart';
import '../../../../constants/decorations.dart';
import '../../../../utils/size_config.dart';

class DailyChart extends StatefulWidget {
  @override
  State<DailyChart> createState() => _DailyChartState();
}

class _DailyChartState extends State<DailyChart> {
  @override
  void initState() {
    super.initState();
    getMonthsInYear(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.widthMultiplier * 92,
      padding: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 2),
      decoration: AppDecorations.whiteBox,
      child: AspectRatio(
        aspectRatio: 2.5,
        child: Column(
          children: [
            Expanded(
              child: LineChart(
                sampleData2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  LineChartData get sampleData2 => LineChartData(
        lineTouchData: lineTouchData2,
        gridData: gridData,
        titlesData: titlesData2,
        borderData: borderData,
        lineBarsData: lineBarsData2,
        minX: 0,
        maxX: 13.5,
        maxY: 6,
        minY: 0,
      );

  List<DateModel> dates = <DateModel>[];

  List<DateModel> getMonthsInYear(DateTime userCreatedDate) {
    final now = DateTime.now();
    DateTime sixMonthFromNow = DateTime(now.year, now.month, now.day - 5);
    DateTime date = userCreatedDate;
    while (date.isAfter(sixMonthFromNow)) {
      dates.add(DateModel(
          day: DateFormat.d().format(sixMonthFromNow),
          month: DateFormat.LLLL().format(sixMonthFromNow)));
      sixMonthFromNow = DateTime(
          sixMonthFromNow.year, sixMonthFromNow.month, sixMonthFromNow.day + 1);
      print(dates.length);
    }
    return dates;
  }

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  LineTouchData get lineTouchData2 => LineTouchData(
        enabled: true,
      );

  FlTitlesData get titlesData2 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData2 => [
        lineChartBarData2_1,
      ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 1:
        text = '0';
        break;
      case 2:
        text = '2';
        break;
      case 3:
        text = '4';
        break;
      case 4:
        text = '6';
        break;
      case 5:
        text = '8';
        break;
      case 6:
        text = '10';
        break;
      default:
        return Container();
    }

    return Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.textClr,
          fontWeight: FontWeight.w500,
          fontSize: SizeConfig.textMultiplier * 1.2,
        ));
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 35,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = TextStyle(
      color: AppColors.textClr,
      fontWeight: FontWeight.w500,
      fontSize: SizeConfig.textMultiplier * 1.2,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = Text("${dates[0].day} ${dates[0].month}", style: style);
        break;
      case 4:
        text = Text("${dates[1].day} ${dates[1].month}", style: style);
        break;
      case 6:
        text = Text("${dates[2].day} ${dates[2].month}", style: style);
        break;
      case 8:
        text = Text("${dates[3].day} ${dates[3].month}", style: style);
        break;
      case 10:
        text = Text("${dates[4].day} ${dates[4].month}", style: style);
        break;
      case 12:
        text = Text("${dates[5].day} ${dates[5].month}", style: style);
        break;
      default:
        text = Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: Colors.white,
          ),
          // left: BorderSide(color: Colors.transparent),
          // right: BorderSide(color: Colors.transparent),
          // top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData2_1 => LineChartBarData(
        isCurved: true,
        curveSmoothness: 0,
        color: AppColors.greenClr,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 4),
          FlSpot(5, 1.8),
          FlSpot(7, 6),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
        ],
      );
}

class DateModel {
  final String day;
  final String month;
  DateModel({required this.day, required this.month});
}
