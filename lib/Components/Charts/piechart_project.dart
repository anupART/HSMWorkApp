import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class PieChartProjctClass extends StatelessWidget {
  const PieChartProjctClass({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Completed', 2,Colors.redAccent),
      ChartData('Working', 1,Colors.cyan),
      // ChartData('In Review',2, Colors.red),
    ];
    return Scaffold(
        body: Center(
            child: Container(
                color: Colors.white,
                // height: 200,
                //   width: 200,
                child: SfCircularChart(
                    series: <CircularSeries>[
                      // Render pie chart
                      PieSeries<ChartData, String>(
                        explode: true,
                        dataSource: chartData,
                        pointColorMapper: (ChartData data, _) => data.color,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        radius: '80%',
                        dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                            // labelPosition: ChartDataLabelPosition.outside,
                            connectorLineSettings: ConnectorLineSettings(
                            )
                        ),


                      )
                    ]
                )
            )
        )
    );
  }
}
class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}
