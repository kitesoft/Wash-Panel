import 'package:flutter/material.dart';

typedef Widget TabBuilder(BuildContext context, bool isTablet);

class TabletBuilder extends StatelessWidget {
  final TabBuilder tabBuilder;

  const TabletBuilder({
    Key key,
    @required this.tabBuilder,
  })  : assert(tabBuilder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.shortestSide > 600;

    return Builder(builder: (context) {
      return tabBuilder(context, isTablet);
    });
  }
}
