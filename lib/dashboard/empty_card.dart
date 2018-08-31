import 'package:flutter/material.dart';
import 'base_card.dart';

class EmptyCard extends BaseCard {
  final Widget child;
  final String title;

  EmptyCard({@required this.title, this.child});

  @override
  Widget getWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            title.toUpperCase(),
            style: const TextStyle(color: Colors.blueAccent),
          ),
          new Expanded(
            child: child == null ? new Container() : child,
          )
        ],
      ),
    );
  }
}
