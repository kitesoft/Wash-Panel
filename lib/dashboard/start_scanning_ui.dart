import 'package:flutter/material.dart';
import 'package:wash_x/my_strings.dart';

class ScanningWidget extends StatelessWidget {
  final double height;

  ScanningWidget(this.height);

  @override
  Widget build(BuildContext context) {
    _startTimeOut();
    return new Container(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        padding: const EdgeInsets.only(left: 25.0, right: 20.0, top: 10.0),
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Container(
              width: 60.0,
              height: 10.0,
              decoration: new BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                  borderRadius: new BorderRadius.circular(50.0)),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Flexible(
                  fit: FlexFit.tight,
                  child: new Text(
                    'INTAKE',
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.blueAccent),
                  ),
                ),
                new Flexible(
                    child: new FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: new Text(Strings.close.toUpperCase())))
              ],
            ),
            new SizedBox(
              height: 200.0,
            ),
            new Text(
              'Scan the tag',
              style: const TextStyle(color: Colors.blueAccent),
            ),
            new SizedBox(height: 20.0,),
            new Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(10.0))),
              child: new Padding(
                padding: const EdgeInsets.all(20.0),
                child: new Icon(
                  Icons.nfc,
                  color: Colors.black,
                  size: 180.0,
                ),
              ),
            ),
            new SizedBox(height: 30.0,)
          ],
        ),
      ),
    );
    ;
  }

  void _startTimeOut() {}
}

class StartButton extends StatelessWidget {
  final VoidCallback onPressed;

  StartButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: onPressed,
      color: Colors.white,
      elevation: 5.0,
      shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
      child: new Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 12.0, left: 5.0, right: 25.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.brightness_1,
              color: Colors.blueAccent,
              size: 30.0,
            ),
            new SizedBox(
              width: 10.0,
            ),
            new Text(
              'START',
              style: const TextStyle(color: Colors.blueAccent),
            )
          ],
        ),
      ),
    );
  }
}
