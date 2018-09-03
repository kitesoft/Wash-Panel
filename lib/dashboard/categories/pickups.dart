import 'package:flutter/material.dart';
import 'package:wash_x/my_strings.dart';
import 'package:wash_x/dashboard/data_card.dart';
import 'package:wash_x/dashboard/empty_card.dart';
import 'base_category.dart';

class PickUps extends BaseCategory {
  @override
  State<StatefulWidget> createState() => new _FinancialsState();

  PickUps() : super(title: Strings.pickUps);
}

class _FinancialsState extends BaseCategoryState {
  @override
  List<Widget> getChildren() {
    return <Widget>[
      new DataCard(
          title: Strings.pickUps,
          description: Strings.blahBlah,
          icon: new Container(),
          color: Colors.green[400]),
      new EmptyCard(
        title: Strings.rounds,
        child: new Container(
          padding: const EdgeInsets.only(left: 30.0, top: 30.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _getBlueText('Up next'),
              _getBlueText('stops'),
              _getBlueText('Time estimate')
            ],
          ),
        ),
      ),
      new EmptyCard(title: Strings.pastDue),
    ];
  }

  Widget _getBlueText(String string) {
    return new Text(
      string,
      style: const TextStyle(color: Colors.blueAccent),
    );
  }
}
