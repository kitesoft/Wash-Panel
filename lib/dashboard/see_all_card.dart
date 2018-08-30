import 'package:flutter/material.dart';
import 'base_card.dart';

class SeeAllCard extends BaseCard {
  final VoidCallback onPressed;

  SeeAllCard({@required this.onPressed}) : super(half: true);

  @override
  Widget getWidget(BuildContext context) {
    return new Center(
      child: new IconButton(
          iconSize: 55.0,
          icon: new Container(
              width: 45.0,
              height: 45.0,
              margin: new EdgeInsets.symmetric(horizontal: 5.0),
              decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.grey[400]),
                  borderRadius: new BorderRadius.circular(50.0)),
              child: new Icon(
                Icons.keyboard_arrow_right,
                size: 40.0,
                color: Colors.grey[400],
              )),
          onPressed: onPressed),
    );
  }
}
