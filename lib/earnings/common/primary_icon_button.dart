import 'package:flutter/material.dart';

class PrimaryIconButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final Icon icon;
  final double textSize;

  const PrimaryIconButton({
    Key key,
    this.onTap,
    this.text,
    this.icon,
    this.textSize,
  })  : assert(text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: this.onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              this.text,
              style: TextStyle(
                fontSize: textSize ?? 14.0,
                color: Colors.blue[800],
                fontWeight: FontWeight.bold,
              ),
            ),
          ]..addAll(_getIcon()),
        ));
  }

  List<Widget> _getIcon() {
    if (this.icon == null) {
      return [Container()];
    } else {
      return [
        this.icon,
      ];
    }
  }
}
