import 'package:flutter/material.dart';
import 'package:wash_x/my_strings.dart';
import 'data_card.dart';
import 'see_all_card.dart';
import 'chart_card.dart';

class CustomerServiceWidget extends StatefulWidget {
  @override
  State createState() {
    return new _CustomerServiceState();
  }
}

class _CustomerServiceState extends State<CustomerServiceWidget> {
  MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return new Container(
      height: mediaQueryData.size.height / 4.0,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  Strings.customerService.toUpperCase(),
                  style: const TextStyle(fontSize: 18.0),
                ),
                new Text(
                  Strings.seeAll.toUpperCase(),
                  style: const TextStyle(fontSize: 18.0),
                )
              ],
            ),
          ),
          new SizedBox(
            height: 10.0,
          ),
          new Expanded(
              child: new ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              new DataCard(
                  title: Strings.customerService,
                  description: Strings.blahBlah,
                  icon: new Container(),
                  color: Colors.teal[600]),
              new ChartCard(title: Strings.feedback, type: null, seriesList: null),
              new SeeAllCard(
                onPressed: _handleSeeAll,
              )
            ],
          ))
        ],
      ),
    );
  }

  void _handleSeeAll() {
    print('You clicked see all');
  }

  Widget getBars() {
    var height = mediaQueryData.size.height;
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[getBar(height / 9), getBar(height / 11), getBar(height / 15)],
    );
  }

  Widget getBar(double height) {
    const radius = Radius.circular(50.0);
    return new Container(
      height: height,
      width: 17.0,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: const BoxDecoration(
          color: Colors.yellowAccent, borderRadius: BorderRadius.vertical(top: radius)),
    );
  }
}
