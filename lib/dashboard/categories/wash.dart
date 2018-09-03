import 'package:flutter/material.dart';
import 'package:wash_x/my_strings.dart';
import 'package:wash_x/dashboard/data_card.dart';
import 'package:wash_x/dashboard/categories/base_category.dart';
import 'package:wash_x/dashboard/empty_card.dart';

class Wash extends BaseCategory {
  @override
  State<StatefulWidget> createState() => new _WashState();

  Wash() : super(title: Strings.wash);
}

class _WashState extends BaseCategoryState {
  @override
  List<Widget> getChildren() {
    return <Widget>[
      new DataCard(
          title: Strings.wash,
          description: Strings.blahBlah,
          icon: new Container(),
          color: Colors.blue[700]),
      new EmptyCard(title: Strings.washs),
      new EmptyCard(title: Strings.employees),
    ];
  }
}
