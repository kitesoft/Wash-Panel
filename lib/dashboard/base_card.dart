import 'package:flutter/material.dart';

abstract class BaseCard extends StatelessWidget {
  static MediaQueryData mediaQueryData;
  final Color color;

  BaseCard({this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return new ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 460.0, height: 170.0),
      child: new Container(
        child: new Card(
          color: color,
          elevation: 2.0,
          margin: const EdgeInsets.all(7.0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
          ),
          child: getWidget(context),
        ),
      ),
    );
  }

  Widget getWidget(BuildContext context);
}
