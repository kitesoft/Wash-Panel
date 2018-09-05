import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wash_x/earnings/common/app_bar_action.dart';
import 'package:wash_x/earnings/common/dwm_time_selection.dart';
import 'package:wash_x/earnings/earnings/sections/costs_section.dart';
import 'package:wash_x/earnings/earnings/sections/earnings_section/earnings_section.dart';
import 'package:wash_x/earnings/earnings/sections/earnings_section/monthly_chart.dart';
import 'package:wash_x/earnings/earnings/sections/earnings_section/weekly_chart.dart';
import 'package:wash_x/earnings/earnings/sections/hours_section.dart';
import 'package:wash_x/earnings/earnings/sections/miles_section.dart';
import 'package:wash_x/earnings/earnings/sections/pay_section.dart';
import 'package:wash_x/earnings/earnings/sections/pickups_section.dart';

class FinancialsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FinancialsPageState();
}

class FinancialsPageState extends State<FinancialsPage> {
  TimeSelection _earningsPageSelection = TimeSelection.DAY;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.shortestSide > 600;

    List sections = <Widget>[
      Container(
        margin: EdgeInsets.all(8.0),
        child: HoursSection(),
      ),
      Container(
        margin: EdgeInsets.all(8.0),
        child: MilesSection(),
      ),
      Container(
        margin: EdgeInsets.all(8.0),
        child: PickupsSection(),
      ),
      Container(
        margin: EdgeInsets.all(8.0),
        child: CostsSection(),
      ),
      Container(
        margin: EdgeInsets.all(8.0),
        child: PaySection(),
      ),
      Container(
        margin: EdgeInsets.all(8.0),
        child: EarningsSection(
          weeklyData: [
            WeeklyData(
              label: "Mon",
              value: 150.0,
            ),
            WeeklyData(
              label: "Tue",
              value: 550.0,
            ),
            WeeklyData(
              label: "Wed",
              value: 520.0,
            ),
            WeeklyData(
              label: "Thu",
              value: 1050.0,
            ),
            WeeklyData(
              label: "Fri",
              value: 900.0,
            ),
            WeeklyData(
              label: "Sat",
              value: 777.0,
            ),
            WeeklyData(
              label: "Sun",
              value: 898.0,
            ),
          ],
          monthlyData: [
            MonthlyData(
              label: "Jan",
              value: 500.0,
            ),
            MonthlyData(
              label: "Feb",
              value: 400.0,
            ),
            MonthlyData(
              label: "Mar",
              value: 530.0,
            ),
            MonthlyData(
              label: "Apr",
              value: 600.0,
            ),
            MonthlyData(
              label: "May",
              value: 550.0,
            ),
            MonthlyData(
              label: "Jun",
              value: 500.0,
            ),
            MonthlyData(
              label: "Jul",
              value: 600.0,
            ),
            MonthlyData(
              label: "Aug",
              value: 650.0,
            ),
            MonthlyData(
              label: "Sep",
              value: 700.0,
            ),
            MonthlyData(
              label: "Oct",
              value: 800.0,
            ),
            MonthlyData(
              label: "Nov",
              value: 750.0,
            ),
            MonthlyData(
              label: "Dec",
              value: 730.0,
            ),
          ],
          selectedTime: _earningsPageSelection,
          onChange: (selection) {
            if (selection != _earningsPageSelection) {
              setState(() {
                _earningsPageSelection = selection;
              });
            }

            if (!isTablet) {
              _scrollToEnd();
            }
          },
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'WASH PANEL',
          style: TextStyle(
            fontSize: 14.0,
            wordSpacing: 2.0,
            color: Colors.grey[600],
          ),
        ),
        actions: <Widget>[
          AppBarAction(
            icon: Icons.person,
            onTap: () {},
          ),
          AppBarAction(
            icon: Icons.menu,
            onTap: () {},
          ),
        ],
      ),
      body: isTablet
          ? Container(
              child: GridView.count(
                padding: EdgeInsets.all(40.0),
                children: sections,
                crossAxisCount: 2,
                childAspectRatio: 1.2,
              ),
            )
          : ListView(
              controller: _scrollController,
              children: sections,
            ),
    );
  }

  _scrollToEnd() {
    Timer(Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(
          milliseconds: 300,
        ),
        curve: Curves.ease,
      );
    });
  }
}
