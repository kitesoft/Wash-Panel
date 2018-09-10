import 'package:flutter/material.dart';
import 'package:wash_x/my_strings.dart';

class AnalyticsPage extends StatefulWidget {
  @override
  _AnalyticsPageState createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Text(Strings.analytics.toUpperCase()),
          new Text(Strings.close.toUpperCase())
        ],
      ),
    );
  }
}
