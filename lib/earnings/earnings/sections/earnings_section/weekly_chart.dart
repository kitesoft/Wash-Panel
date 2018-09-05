import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class WeeklyData {
  final String label;
  final double value;

  WeeklyData({
    this.label,
    this.value,
  });
}

class WeeklyChart extends StatelessWidget {
  final List<WeeklyData> weeklyData;
  final _colors = const [
    "#66BB6A",
    "#66BB6A",
    "#66BB6A",
    "#FFC300",
    "#FFC300",
    "#DDDDDD",
    "#DDDDDD",
  ];

  const WeeklyChart({
    Key key,
    @required this.weeklyData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      [
        charts.Series<WeeklyData, String>(
            id: "Weekly",
            data: weeklyData,
            domainFn: (WeeklyData datum, int index) {
              return datum.label;
            },
            measureFn: (WeeklyData datum, int index) {
              return datum.value;
            },
            fillColorFn: (WeeklyData data, int index) {
              return charts.Color.fromHex(
                code: _colors[index % _colors.length],
              );
            }),
      ],
      animationDuration: Duration(milliseconds: 500),
      animate: true,
    );
  }
}
