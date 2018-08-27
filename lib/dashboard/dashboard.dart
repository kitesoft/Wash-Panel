import 'package:flutter/material.dart';
import 'app_bar.dart';

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
    );
  }
}
