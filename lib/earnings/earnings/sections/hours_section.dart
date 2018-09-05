import 'package:flutter/material.dart';
import 'package:wash_x/earnings/common/container_item.dart';

class HoursSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerItem(
      child: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
              ),
              child: Icon(
                Icons.done,
                color: Colors.grey[700],
                size: 28.0,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Text(
                'Everything is looking good!\nthere are no past due washes.',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      title: "HOURS",
    );
  }
}
