import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MonthlyData {
  final String label;
  final double value;

  MonthlyData({
    this.label,
    this.value,
  });
}

class MonthlyChart extends StatelessWidget {
  final List<MonthlyData> monthlyData;
  final _colors = const [
    "#66BB6A",
    "#66BB6A",
    "#66BB6A",
    "#FFC300",
    "#FFC300",
    "#DDDDDD",
    "#DDDDDD",
  ];

  const MonthlyChart({
    Key key,
    @required this.monthlyData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: charts.LineChart(
        <charts.Series<MonthlyData, int>>[
          charts.Series<MonthlyData, int>(
            id: null,
            measureFn: (MonthlyData datum, int index) {
              return datum.value;
            },
            data: monthlyData,
            domainFn: (MonthlyData datum, int index) {
              return index;
            },
          ),
        ],
        animate: true,
        animationDuration: Duration(milliseconds: 500),
      ),
    );
  }
}
