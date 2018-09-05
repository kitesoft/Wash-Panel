import 'package:flutter/material.dart';

class PrimaryBlueButton extends StatelessWidget {
  final Function() onTap;
  final String text;

  const PrimaryBlueButton({
    Key key,
    this.onTap,
    this.text,
  })  : assert(text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: this.onTap,
      child: Text(
        this.text,
        style: TextStyle(
          fontSize: 12.0,
          color: Colors.blue[800],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
