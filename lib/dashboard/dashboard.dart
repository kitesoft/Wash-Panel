import 'package:flutter/material.dart';
import 'package:wash_x/dashboard/categories/analytics.dart';
import 'package:wash_x/dashboard/categories/customer_service.dart';
import 'package:wash_x/dashboard/categories/financials.dart';
import 'package:wash_x/dashboard/categories/operations.dart';
import 'package:wash_x/dashboard/categories/pickups.dart';
import 'package:wash_x/dashboard/categories/wash.dart';

import 'app_bar.dart';
import 'live_panel.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _box = new SizedBox(height: 40.0);
  var _scrollController = new ScrollController();
  var _showAppBarElevation = false;
  List<Widget> categories;

  @override
  void initState() {
    _initCategories();
    _scrollController.addListener(_scrollChanged);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBar(_showAppBarElevation),
      body: new Container(
        color: Colors.white,
        width: double.infinity,
        child: new Stack(
          children: <Widget>[
            new Positioned.fill(
                child: new ListView.builder(
                    controller: _scrollController,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return categories[index];
                    })),
            new Positioned(
              right: 0.0,
              top: 0.0,
              bottom: 0.0,
              child: new LivePanel(),
            )
          ],
        ),
      ),
    );
  }

  void _scrollChanged() {
    setState(() => _showAppBarElevation = _scrollController.offset < 0.5 ? false : true);
  }

  void _initCategories() {
    categories = [
      _box,
      new Analytics(),
      _box,
      new CustomerService(),
      _box,
      new Financials(),
      _box,
      new PickUps(),
      _box,
      new Operations(),
      _box,
      new Wash(),
    ];
  }
}
