import 'package:flutter/material.dart';
import 'package:wash_x/earnings/common/dwm_time_selection.dart';
import 'package:wash_x/earnings/common/tablet_builder.dart';
import 'package:wash_x/earnings/custom/multi_progress_bar.dart';
import 'package:wash_x/earnings/earnings/earnings_detail/earnings_list.dart';
import 'package:wash_x/earnings/models/earnings.dart';

class EarningsDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EarningsDetailsState();
}

class EarningsDetailsState extends State<EarningsDetails> {
  @override
  Widget build(BuildContext context) {
    return TabletBuilder(
      tabBuilder: (BuildContext context, bool isTablet) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: Colors.blue[800],
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            elevation: 0.0,
            title: Text(
              'Earnings',
              style: TextStyle(
                color: Colors.blue[800],
                fontSize: 16.0,
              ),
            ),
          ),
          body: Container(
            child: Align(
              alignment: Alignment.center,
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    expandedHeight: isTablet ? 160.0 : 140.0,
                    flexibleSpace: _getOptionsWidget(isTablet),
                  ),
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    elevation: 2.0,
                    forceElevated: true,
                    flexibleSpace: _getLabelWidget(isTablet),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.all(16.0),
                    sliver: EarningsList(
                      earnings: _getFakeEarningsData(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _getOptionsWidget(bool isTablet) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[200],
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'DATE',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              '02.26.18 - 02.30.18',
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ],
                        isDense: true,
                        onChanged: (item) {},
                      ),
                    ),
                  ],
                ),
              ),
              DWMTimeSelection(
                timeSelection: TimeSelection.DAY,
              ),
            ],
          ),
        ),
        Container(
          padding: isTablet
              ? EdgeInsets.symmetric(vertical: 16.0, horizontal: 80.0)
              : EdgeInsets.all(16.0),
          child: MultiProgressBar(
            barHeight: isTablet ? 20.0 : 12.0,
            barItems: <BarItem>[
              BarItem(
                value: 0.2,
                color: Colors.lightGreen[700],
                label: "\$104.19",
              ),
              BarItem(
                value: 0.3,
                color: Colors.yellow[700],
                label: "\$104.19",
              ),
            ],
          ),
        ),
      ],
    );
  }

  _getLabelWidget(bool isTablet) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          isTablet
              ? Expanded(
                  flex: 3,
                  child: Container(),
                )
              : Container(),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.date_range,
                  color: Colors.blue[800],
                  size: 12.0,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  "Date",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.blue[800],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.person_pin_circle,
                  color: Colors.blue[800],
                  size: 12.0,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  "Stops",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.blue[800],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.timer,
                  color: Colors.blue[800],
                  size: 12.0,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  "Hours",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.blue[800],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.attach_money,
                  color: Colors.blue[800],
                  size: 12.0,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  "Earned",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.blue[800],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /**
   * Fake earnings data.
   * //TODO: Remove
   * */
  _getFakeEarningsData() {
    return [
      Earning(
        date: DateTime.now().millisecondsSinceEpoch,
        earned: 104.0,
        hours: 1.2,
        stops: 14,
      ),
      Earning(
        date: DateTime.now().millisecondsSinceEpoch,
        earned: 104.0,
        hours: 1.2,
        stops: 1,
      ),
      Earning(
        date: DateTime.now().millisecondsSinceEpoch,
        earned: 1024.0,
        hours: 1.2,
        stops: 14,
      ),
      Earning(
        date: DateTime.now().millisecondsSinceEpoch,
        earned: 1044.0,
        hours: 1.2,
        stops: 14,
      ),
      Earning(
        date: DateTime.now().millisecondsSinceEpoch,
        earned: 104.0,
        hours: 1.2,
        stops: 14,
      ),
      Earning(
        date: DateTime.now().millisecondsSinceEpoch,
        earned: 14.0,
        hours: 11.2,
        stops: 14,
      ),
      Earning(
        date: DateTime.now().millisecondsSinceEpoch,
        earned: 104.0,
        hours: 122.2,
        stops: 1,
      ),
      Earning(
        date: DateTime.now().millisecondsSinceEpoch,
        earned: 104.0,
        hours: 122.2,
        stops: 1,
      ),
      Earning(
        date: DateTime.now().millisecondsSinceEpoch,
        earned: 104.0,
        hours: 122.2,
        stops: 1,
      ),
      Earning(
        date: DateTime.now().millisecondsSinceEpoch,
        earned: 104.0,
        hours: 122.2,
        stops: 1,
      ),
      Earning(
        date: DateTime.now().millisecondsSinceEpoch,
        earned: 104.0,
        hours: 122.2,
        stops: 1,
      ),
      Earning(
        date: DateTime.now().millisecondsSinceEpoch,
        earned: 104.0,
        hours: 122.2,
        stops: 1,
      ),
      Earning(
        date: DateTime.now().millisecondsSinceEpoch,
        earned: 104.0,
        hours: 122.2,
        stops: 1,
      ),
      Earning(
        date: DateTime.now().millisecondsSinceEpoch,
        earned: 104.0,
        hours: 122.2,
        stops: 1,
      ),
      Earning(
        date: DateTime.now().millisecondsSinceEpoch,
        earned: 104.0,
        hours: 122.2,
        stops: 1,
      ),
      Earning(
        date: DateTime.now().millisecondsSinceEpoch,
        earned: 104.0,
        hours: 122.2,
        stops: 1,
      ),
      Earning(
        date: DateTime.now().millisecondsSinceEpoch,
        earned: 104.0,
        hours: 122.2,
        stops: 1,
      ),
    ];
  }
}
