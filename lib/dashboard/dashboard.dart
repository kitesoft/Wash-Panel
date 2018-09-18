import 'package:flutter/material.dart';
import 'package:wash_x/analytics/analytics_page.dart';
import 'package:wash_x/dashboard/categories/analytics.dart';
import 'package:wash_x/dashboard/categories/customer_service.dart';
import 'package:wash_x/dashboard/categories/financials.dart';
import 'package:wash_x/dashboard/categories/operations.dart';
import 'package:wash_x/dashboard/categories/pickups.dart';
import 'package:wash_x/dashboard/categories/wash.dart';
import 'package:wash_x/dashboard/live/live_panel.dart';
import 'package:wash_x/intake/add_widget.dart';
import 'package:wash_x/intake/start_scanning_ui.dart';

import 'app_bar.dart';

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
      body: new OrientationBuilder(builder: (context, orientation) {
        return new Container(
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
                  bottom: 50.0,
                  right: 170.0,
                  child: new StartButton(
                    onPressed: _startTakeInUI,
                  )),
              new Positioned(
                right: 0.0,
                height: orientation == Orientation.portrait
                    ? MediaQuery.of(context).size.shortestSide
                    : null,
                top: orientation == Orientation.landscape ? 0.0 : null,
                bottom: 0.0,
                child: new LivePanel(),
              ),
            ],
          ),
        );
      }),
    );
  }

  void _startTakeInUI() {
    _showBottomSheet(new ScanningWidget(
      onScanned: () => _showBottomSheet(new AddIntake()),
    ));
  }

  void _scrollChanged() {
    setState(() => _showAppBarElevation = _scrollController.offset < 0.5 ? false : true);
  }

  void _initCategories() {
    categories = [
      _box,
      new Analytics(
        onSeeAllPressed: () => _startCategoryDetailsBottomSheet(Category.analytics),
      ),
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

  _startCategoryDetailsBottomSheet(Category category) {
    Widget widget;
    switch (category) {
      case Category.analytics:
        widget = new AnalyticsPage();
        break;
      case Category.customerService:
        break;
      case Category.financials:
        break;
      case Category.pickUps:
        break;
      case Category.operations:
        break;
      case Category.wash:
        break;
    }

    if (widget != null) {
      _showBottomSheet(widget);
    }
  }

  _showBottomSheet(Widget widget) {
    _scaffoldKey.currentState.showBottomSheet((context) {
      return widget;
    });
  }
}

enum Category { analytics, customerService, financials, pickUps, operations, wash }
