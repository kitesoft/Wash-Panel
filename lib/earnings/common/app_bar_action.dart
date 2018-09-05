import 'package:flutter/material.dart';

class AppBarAction extends StatelessWidget {
  final IconData icon;
  final Function() onTap;

  const AppBarAction({
    Key key,
    this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            borderRadius: BorderRadius.circular(100.0),
            onTap: this.onTap,
            child: Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey[300],
                ),
              ),
              child: Icon(
                this.icon,
                color: Colors.black,
                size: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
