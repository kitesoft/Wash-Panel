import 'package:flutter/material.dart';
import 'package:wash_x/my_strings.dart';


abstract class BaseCategory extends StatefulWidget {
  final String title;
  BaseCategory({@required this.title});
}

abstract class BaseCategoryState extends State<BaseCategory>{
  static const spacing = 60.0;
  final sizedBox = const SizedBox(width: spacing);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 230.0,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.only(left: spacing + 15, right: spacing),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  widget.title.toUpperCase(),
                  style: const TextStyle(fontSize: 18.0),
                ),
                new FlatButton(
                    onPressed: _handleSeeAll,
                    child: new Text(
                      Strings.seeAll.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.normal),
                    ))
              ],
            ),
          ),
          new Expanded(
              child: new ListView(
                scrollDirection: Axis.horizontal,
                children: _getChildrenWithSpacing())),
        ],
      ),
    );
  }

  List<Widget> _getChildrenWithSpacing() {
    final List<Widget> children = getChildren();
    children.insert(0, sizedBox);  // Add spacing at the start
    children.add(sizedBox); // Add Spacing at the end
    return children;
  }

  List<Widget> getChildren();

  void _handleSeeAll() {
    print('You clicked see all');
  }

}
