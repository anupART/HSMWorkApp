import 'individualBar.dart';

class BarData {
  final double monHours;
  final double tueHours;
  final double wedHours;
  final double thurHours;
  final double friHours;

  BarData({
    required this.monHours,
    required this.tueHours,
    required this.wedHours,
    required this.thurHours,
    required this.friHours,
  });

  List<IndividualBar> barData = [];

  // Initialize bar data
  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: monHours),
      IndividualBar(x: 1, y: tueHours),
      IndividualBar(x: 2, y: wedHours),
      IndividualBar(x: 3, y: thurHours),
      IndividualBar(x: 4, y: friHours),
    ];
  }
}