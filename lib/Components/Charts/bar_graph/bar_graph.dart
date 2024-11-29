import 'dart:ui';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../Styles/Color/appTheme.dart';
import 'barData.dart';

class MyBarGraph extends StatelessWidget {
  MyBarGraph({super.key});
  final List<double> weeklyTask = [4.7, 2, 5, 7.9, 8];
  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
        monHours: weeklyTask[0],
        tueHours: weeklyTask[1],
        wedHours: weeklyTask[2],
        thurHours: weeklyTask[3],
        friHours: weeklyTask[4]);
    myBarData.initializeBarData();
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width / 2,
      child: BarChart(
        BarChartData(
          maxY: 8,
          minY: 0,
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(
            border: const Border(
              top: BorderSide.none,
              right: BorderSide.none,
              bottom: BorderSide(width: 2, color: Colors.black),
              left: BorderSide(width: 2, color: Colors.black),
            ),
          ),
          barGroups: myBarData.barData
              .map((data) => BarChartGroupData(x: data.x, barRods: [
            BarChartRodData(
              toY: data.y,
              color: AppColors.buttonColor,
              width: 20,
              borderRadius: BorderRadius.circular(5),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: 8,
                color: AppColors.unselectedButtonColor,
              ),
            ),
          ]))
              .toList(),
          titlesData: FlTitlesData(
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: getBottomTitles,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: getLeftTitles,
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget getBottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('M', style: style);
        break;
      case 1:
        text = const Text('T', style: style);
        break;
      case 2:
        text = const Text('W', style: style);
        break;
      case 3:
        text = const Text('T', style: style);
        break;
      case 4:
        text = const Text('F', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(axisSide: meta.axisSide, child: text);
  }
  Widget getLeftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('0', style: style);
        break;
      case 2:
        text = const Text('2', style: style);
        break;
      case 4:
        text = const Text('4', style: style);
        break;
      case 6:
        text = const Text('6', style: style);
        break;
      case 8:
        text = const Text('8', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(child: text, axisSide: meta.axisSide);
  }
}