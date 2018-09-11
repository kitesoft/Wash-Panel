import 'package:flutter/material.dart';
import 'package:wash_x/constants.dart';
import 'package:wash_x/common/base_card.dart';

class DataCard extends BaseCard {
  final String title;
  final String description;
  final Widget icon;
  final Color color;

  DataCard(
      {@required this.title, @required this.description, @required this.icon, @required this.color})
      : super(color: color);

  @override
  Widget getWidget(BuildContext context) {
    var box = const SizedBox(width: 40.0);
    return new Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          box,
          new Expanded(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Text(
                title.toUpperCase(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: FontSize.xLarge, color: Colors.white),
              ),
              new SizedBox(
                height: 10.0,
              ),
              new Text(
                description,
                maxLines: 3,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: FontSize.large, color: Colors.white),
              )
            ],
          )),
          box,
          icon,
          box
        ],
      ),
    );
  }
}
