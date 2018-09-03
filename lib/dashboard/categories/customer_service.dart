import 'package:flutter/material.dart';
import 'package:wash_x/my_strings.dart';
import 'package:wash_x/dashboard/data_card.dart';
import 'package:wash_x/dashboard/categories/base_category.dart';
import 'package:wash_x/dashboard/empty_card.dart';


class CustomerService extends BaseCategory {
  @override
  State<StatefulWidget> createState() => new _CustomerServiceState();

  CustomerService() : super(title: Strings.customerService);
}

class _CustomerServiceState extends BaseCategoryState {

  @override
  List<Widget> getChildren() {
    return <Widget>[
      new DataCard(
          title: Strings.customerService,
          description: Strings.blahBlah,
          icon: new Container(),
          color: Colors.teal[600]),
      new EmptyCard(title: Strings.feedback),
      new EmptyCard(title: ''),
    ];
  }
}
