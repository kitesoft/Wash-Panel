import 'package:flutter/material.dart';
import 'base_card.dart';
import 'package:wash_x/constants.dart';
import 'dart:math' as math;
import 'package:charts_flutter/flutter.dart' as charts;

class ChartCard extends BaseCard {
  final String title;
  final ValueChanged<ChartTime> onTypeChange;
  final ChartTime type;
  final List<charts.Series> seriesList;

  ChartCard(
      {@required this.title, this.onTypeChange, @required this.type, @required this.seriesList});

  var emptyContainer = new Container();

  @override
  Widget getWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text(
                title.toUpperCase(),
                style: const TextStyle(color: Colors.blueAccent),
              ),
              seriesList == null
                  ? emptyContainer
                  : new Row(
                      children: <Widget>[
                        getType('D', ChartTime.day, context),
                        getType('W', ChartTime.week, context),
                        getType('M', ChartTime.month, context)
                      ],
                    ),
            ],
          ),
          new Expanded(
              child: seriesList == null
                  ? emptyContainer
                  : new Container(
                      child: new charts.TimeSeriesChart(
                        seriesList,
                        animate: true,
                        dateTimeFactory: const charts.LocalDateTimeFactory(),
                      ),
                    ))
        ],
      ),
    );
  }

  Widget getType(String text, ChartTime type, BuildContext context) {
    const spacing = const EdgeInsets.all(5.0);
    return new InkResponse(
      onTap: this.type == type ? null : () => _handleTypePress(type),
      child: new Container(
        width: 35.0,
        height: 35.0,
        padding: spacing,
        margin: new EdgeInsets.symmetric(horizontal: 5.0),
        decoration: new BoxDecoration(
            border: new Border.all(color: Colors.grey),
            color: this.type == type ? Colors.grey.withOpacity(0.25) : Colors.transparent,
            borderRadius: new BorderRadius.circular(5.0)),
        child: new Center(
          child: new Text(
            text,
            style: new TextStyle(
                fontSize: FontSize.medium,
                color: this.type == type ? Colors.black : Colors.grey[400]),
          ),
        ),
      ),
      highlightColor: Theme.of(context).highlightColor,
      splashColor: Theme.of(context).splashColor,
      radius: math.max(
        Material.defaultSplashRadius,
        (25.0 + math.min(spacing.horizontal, spacing.vertical)) * 0.7,
        // x 0.5 for diameter -> radius and + 40% overflow derived from other Material apps.
      ),
    );
  }

  void _handleTypePress(ChartTime type) {
    onTypeChange(type);
  }
}

enum ChartTime { day, week, month }

class ChartData {
  final DateTime time;
  final int value;

  ChartData(this.time, this.value);
}
