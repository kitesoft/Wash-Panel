import 'package:flutter/material.dart';
import 'package:wash_x/my_strings.dart';
import 'package:wash_x/dashboard/data_card.dart';
import 'package:wash_x/dashboard/chart_card.dart';
import 'package:wash_x/dashboard/empty_card.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'base_category.dart';

class Analytics extends BaseCategory {
  @override
  State<StatefulWidget> createState() => new _AnalyticsState();

  Analytics() : super(title: Strings.analytics);
}

class _AnalyticsState extends BaseCategoryState {
  ChartTime chartTime = ChartTime.day;

  List<charts.Series<ChartData, DateTime>> _createSampleData() {
    final now = new DateTime.now();
    var data;
    switch (chartTime) {
      case ChartTime.day:
        data = [
          new ChartData(now, 20),
          new ChartData(now.subtract(Duration(days: 1)), 10),
          new ChartData(now.subtract(Duration(days: 2)), 15),
          new ChartData(now.subtract(Duration(days: 3)), 30),
          new ChartData(now.subtract(Duration(days: 4)), 3),
          new ChartData(now.subtract(Duration(days: 5)), 25),
          new ChartData(now.subtract(Duration(days: 6)), 5)
        ];
        break;
      case ChartTime.week:
        data = [
          new ChartData(now, 50),
          new ChartData(now.subtract(Duration(days: 7)), 70),
          new ChartData(now.subtract(Duration(days: 14)), 100),
          new ChartData(now.subtract(Duration(days: 21)), 90),
        ];
        break;
      case ChartTime.month:
        data = [
          new ChartData(now, 1050),
          new ChartData(now.subtract(Duration(days: 30)), 1500),
          new ChartData(now.subtract(Duration(days: 60)), 1000),
          new ChartData(now.subtract(Duration(days: 90)), 2000),
        ];
        break;
    }

    return [
      new charts.Series<ChartData, DateTime>(
        id: 'Active Users',
        colorFn: (_, __) => charts.MaterialPalette.gray.shade600,
        domainFn: (ChartData data, _) => data.time,
        measureFn: (ChartData data, _) => data.value,
        data: data,
      )
    ];
  }

  Widget getBars() {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[getBar(90.0), getBar(70.0), getBar(50.0)],
    );
  }

  Widget getBar(double height) {
    const radius = Radius.circular(50.0);
    return new Container(
      height: height,
      width: 17.0,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: const BoxDecoration(
          color: Colors.yellowAccent, borderRadius: BorderRadius.vertical(top: radius)),
    );
  }

  @override
  List<Widget> getChildren() {
    return <Widget>[
      new DataCard(
          title: Strings.analytics,
          description: Strings.analyticsDes,
          icon: getBars(),
          color: Colors.redAccent),
      new ChartCard(
        title: Strings.activeUsers,
        type: chartTime,
        onTypeChange: (ChartTime type) => setState(() => this.chartTime = type),
        seriesList: _createSampleData(),
      ),
      new EmptyCard(title: ''),
    ];
  }
}
