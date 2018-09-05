import 'package:flutter/material.dart';
import 'package:wash_x/earnings/common/bottom_dialog_page_route.dart';
import 'package:wash_x/earnings/common/container_item.dart';
import 'package:wash_x/earnings/common/dwm_time_selection.dart';
import 'package:wash_x/earnings/common/primary_icon_button.dart';
import 'package:wash_x/earnings/custom/multi_progress_bar.dart';
import 'package:wash_x/earnings/earnings/earnings_detail/earnings_details.dart';
import 'package:wash_x/earnings/earnings/sections/earnings_section/monthly_chart.dart';
import 'package:wash_x/earnings/earnings/sections/earnings_section/weekly_chart.dart';

class EarningsSection extends StatelessWidget {
  final TimeSelection selectedTime;
  final Function(TimeSelection) onChange;
  final List<WeeklyData> weeklyData;
  final List<MonthlyData> monthlyData;
  bool _isTablet;

  EarningsSection({
    Key key,
    @required this.selectedTime,
    @required this.onChange,
    @required this.weeklyData,
    @required this.monthlyData,
  })  : assert(selectedTime != null, onChange != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    _isTablet = MediaQuery.of(context).size.shortestSide > 600;

    _getCurrentContentWidget(selectedTime);

    return ContainerItem(
      child: Container(
        margin: EdgeInsets.only(top: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _getContent(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                PrimaryIconButton(
                  text: "Details",
                  icon: Icon(
                    Icons.chevron_right,
                    color: Colors.blue[800],
                    size: 20.0,
                  ),
                  onTap: () {
                    _showDetailsPage(context, _isTablet);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      topBarOptions: DWMTimeSelection(
        onChange: onChange,
        timeSelection: selectedTime,
      ),
      title: "EARNINGS",
    );
  }

  _getCurrentContentWidget(TimeSelection timeSelection) {
    switch (timeSelection) {
      case TimeSelection.DAY:
        return _buildMultiProgressBar();
        break;
      case TimeSelection.WEEK:
        return _buildWeeklyChart();
        break;
      case TimeSelection.MONTH:
        return _buildMonthlyChart();
        break;
    }
    onChange(timeSelection);
  }

  Widget _buildMultiProgressBar() {
    return MultiProgressBar(
      barItems: [
        BarItem(
          value: 0.3,
          color: Colors.yellow[800],
          label: "104.0",
        ),
        BarItem(
          value: 0.3,
          color: Colors.grey,
          label: "104.0",
        ),
      ],
    );
  }

  Widget _buildWeeklyChart() {
    return Container(
      height: 200.0,
      child: WeeklyChart(
        weeklyData: this.weeklyData,
      ),
    );
  }

  Widget _buildMonthlyChart() {
    return Container(
      height: 200.0,
      child: MonthlyChart(
        monthlyData: this.monthlyData,
      ),
    );
  }

  Widget _getContent() {
    var content = Container(
      child: Center(
        child: _getCurrentContentWidget(selectedTime),
      ),
    );

    if (_isTablet) {
      return Expanded(child: content);
    } else {
      return content;
    }
  }

  void _showDetailsPage(BuildContext context, bool isTablet) {
    if (isTablet) {
//      showDialog(
//        context: context,
//        builder: (context) {
//          return Container(
//            margin: EdgeInsets.only(
//              top: 80.0,
//              left: 160.0,
//              right: 160.0,
//            ),
//            padding: EdgeInsets.only(top: 16.0),
//            decoration: BoxDecoration(
//              color: Colors.white,
//              borderRadius: BorderRadius.circular(16.0),
//            ),
//            child: EarningsDetails(),
//          );
//        },
//      );
      Navigator.of(context).push(
        BottomDialogPageRoute(builder: (context) {
          return EarningsDetails();
        }),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          return EarningsDetails();
        }),
      );
    }
  }
}
