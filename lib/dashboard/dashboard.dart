import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'package:wash_x/dashboard/categories/customer_service.dart';
import 'package:wash_x/dashboard/categories/financials.dart';
import 'package:wash_x/dashboard/categories/analytics.dart';
import 'package:wash_x/dashboard/categories/operations.dart';
import 'package:wash_x/dashboard/categories/pickups.dart';
import 'package:wash_x/dashboard/categories/wash.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  var box = new SizedBox(height: 40.0);
  List<Widget> categories;

  @override
  void initState() {
    _initCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBar(),
      body: new Container(
        color: Colors.white,
        child: new ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return categories[index];
            }),
      ),
    );
  }

  void _initCategories() {
    categories = [
      box,
      new Analytics(),
      box,
      new CustomerService(),
      box,
      new Financials(),
      box,
      new PickUps(),
      box,
      new Operations(),
      box,
      new Wash(),
    ];
  }
}
