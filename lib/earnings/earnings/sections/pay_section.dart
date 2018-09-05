import 'package:flutter/material.dart';
import 'package:wash_x/earnings/common/container_item.dart';

class PaySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerItem(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(32.0),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      'LAST PAY',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      'NEXT PAY',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      'ALL PAY',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      title: "PAY",
    );
  }
}
