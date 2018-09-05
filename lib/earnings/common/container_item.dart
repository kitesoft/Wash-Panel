import 'package:flutter/material.dart';

/// A Widget with curved border and blue color title.
/// Wrap this around any widget to give it a border and title.
class ContainerItem extends StatelessWidget {
  final Widget child;
  final String title;
  final Widget topBarOptions;

  const ContainerItem({
    Key key,
    @required this.title,
    @required this.child,
    this.topBarOptions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.shortestSide > 600;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: Colors.grey[200],
          width: 1.0,
        ),
      ),
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              this.topBarOptions ?? Container(),
            ],
          ),
          isTablet
              ? Expanded(
                  child: Container(
                    child: Center(child: child),
                  ),
                )
              : child,
        ],
      ),
    );
  }
}
