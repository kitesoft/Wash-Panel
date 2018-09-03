import 'package:flutter/material.dart';
import 'package:wash_x/my_strings.dart';
import 'package:wash_x/dashboard/data_card.dart';
import 'package:wash_x/dashboard/empty_card.dart';
import 'package:wash_x/dashboard/categories/base_category.dart';

class Operations extends BaseCategory {
  @override
  State<StatefulWidget> createState() => new _OperationsState();

  Operations() : super(title: Strings.operations);
}

class _OperationsState extends BaseCategoryState {
  @override
  List<Widget> getChildren() {
    return <Widget>[
      new DataCard(
          title: Strings.operations,
          description: Strings.blahBlah,
          icon: new Container(),
          color: Colors.orange),
      new EmptyCard(title: Strings.cycles),
      new EmptyCard(title: Strings.status),
    ];
  }
}
