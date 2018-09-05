import 'package:flutter/material.dart';
import 'package:wash_x/earnings/common/tablet_builder.dart';
import 'package:wash_x/earnings/custom/multi_progress_bar.dart';
import 'dart:math' as math;

import 'package:wash_x/earnings/models/earnings.dart';

class EarningsList extends StatelessWidget {
  final List<Earning> earnings;

  const EarningsList({
    Key key,
    this.earnings = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabletBuilder(
      tabBuilder: (context, isTablet) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              Earning earning = earnings[index];
              DateTime dateTime =
                  DateTime.fromMillisecondsSinceEpoch(earning.date);
              return Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        isTablet
                            ? Expanded(
                                flex: 3,
                                child: Container(
                                  margin: EdgeInsets.only(right: 32.0),
                                  child: MultiProgressBar(
                                    barHeight: 6.0,
                                    showLabels: false,
                                    barItems: <BarItem>[
                                      BarItem(
                                        value: math.Random().nextDouble(),
                                        color: Colors.yellow[700],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container(),
                        Expanded(
                          child: Text(
                            " ${dateTime.day} ${_convertMonthToString(dateTime.month)}",
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${earning.stops}",
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${earning.hours}",
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "\$${earning.earned}",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.yellow[800],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    isTablet
                        ? Container()
                        : MultiProgressBar(
                            barHeight: 4.0,
                            showLabels: false,
                            barItems: <BarItem>[
                              BarItem(
                                value: math.Random().nextDouble(),
                                color: Colors.yellow[800],
                              ),
                            ],
                          ),
                    SizedBox(
                      height: 16.0,
                    ),
                  ],
                ),
              );
            },
            childCount: earnings.length,
          ),
        );
      },
    );
  }

  _convertMonthToString(int month) {
    switch (month) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
    }
  }
}
