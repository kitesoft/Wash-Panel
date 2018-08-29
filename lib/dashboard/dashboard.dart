import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'analytics_widget.dart';
import 'customer_service_widget.dart';
import 'earnings_widget.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBar(),
      body: new Container(
        padding: const EdgeInsets.symmetric(horizontal: 60.0),
        child: new ListView(
          children: <Widget>[
            new SizedBox(
              height: 40.0,
            ),
            new AnalyticsWidget(),
            new SizedBox(
              height: 40.0,
            ),
            new CustomerServiceWidget(),
            new SizedBox(
              height: 40.0,
            ),
            new EarningsWidget()
          ],
        ),
      ),
    );
  }
}
