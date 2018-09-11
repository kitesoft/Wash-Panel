import 'package:flutter/material.dart';
import 'package:wash_x/analytics/base_analytics_card.dart';
import 'package:wash_x/my_strings.dart';

class AnalyticsPage extends StatefulWidget {
  @override
  _AnalyticsPageState createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        padding: const EdgeInsets.all(20.0),
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Flexible(
                  fit: FlexFit.tight,
                  child: new Text(
                    Strings.analytics.toUpperCase(),
                    textAlign: TextAlign.left,
                  ),
                ),
                new Flexible(
                    child: new FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: new Text(Strings.close.toUpperCase())))
              ],
            ),
            new DataWidget()
          ],
        ),
      ),
    );
  }
}

class DataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              BaseAnalyticsCard(),
              new SizedBox(
                width: 10.0,
              ),
              BaseAnalyticsCard()
            ],
          )
        ],
      ),
    );
  }
}
