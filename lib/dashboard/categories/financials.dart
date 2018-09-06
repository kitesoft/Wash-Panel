import 'package:flutter/material.dart';
import 'package:wash_x/earnings/earnings/financials_page.dart';
import 'package:wash_x/my_strings.dart';
import 'package:wash_x/dashboard/data_card.dart';
import 'package:wash_x/dashboard/empty_card.dart';
import 'base_category.dart';

class Financials extends BaseCategory {
  @override
  State<StatefulWidget> createState() => new _FinancialsState();

  Financials() : super(title: Strings.financials);
}

class _FinancialsState extends BaseCategoryState {

  @override
  List<Widget> getChildren() {
    return <Widget>[
      new DataCard(
          title: Strings.financials,
          description: Strings.blahBlah,
          icon: new Container(),
          color: Colors.blue[400]),
      new EmptyCard(title: Strings.loremIpsum),
      new EmptyCard(title: ''),
    ];
  }

  @override
  void handleSeeAllPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return FinancialsPage();
      }),
    );
  }
}
