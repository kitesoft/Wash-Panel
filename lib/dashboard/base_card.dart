import 'package:flutter/material.dart';
import 'package:wash_x/custom/painting/custom_rounded_rectangle_border.dart';

abstract class BaseCard extends StatelessWidget {
  static MediaQueryData mediaQueryData;
  final Color color;
  final bool half;

  BaseCard({this.color = Colors.white, this.half = false});

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    var side = new BorderSide(color: Colors.grey[400]);
    const radius = const BorderRadius.all(const Radius.circular(7.0));
    return new Container(
      width: half ? mediaQueryData.size.width / 5.8 : mediaQueryData.size.width / 2.8,
      margin: const EdgeInsets.all(7.0),
      decoration: half
          ? new ShapeDecoration(
              shape: new CustomRoundedRectangleBorder(
                  leftSide: side,
                  bottomSide: side,
                  topSide: side,
                  topLeftCornerSide: side,
                  bottomLeftCornerSide: side,
                  borderRadius: radius),
              color: color)
          : new BoxDecoration(
              border: Border.all(color: Colors.grey[400]), borderRadius: radius, color: color),
      child: getWidget(context),
    );
  }

  Widget getWidget(BuildContext context);
}
