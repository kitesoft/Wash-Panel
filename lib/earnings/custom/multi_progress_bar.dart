import 'dart:async';

import 'package:flutter/material.dart';

/// Show multiple progresses in a single bar with labels for each progress
class MultiProgressBar extends StatefulWidget {
  final List<BarItem> barItems;
  final double barHeight;
  final Color barBackgroundColor;
  final String emptyMessage;
  final bool animate;
  final Duration animationDuration;
  final double labelTextSize;
  final Color labelTextColor;
  final bool showLabels;
  final Duration animationDelay;

  const MultiProgressBar({
    Key key,
    @required this.barItems,
    this.barHeight,
    this.barBackgroundColor,
    this.emptyMessage,
    this.animate,
    this.animationDuration,
    this.labelTextSize,
    this.showLabels,
    this.labelTextColor,
    this.animationDelay,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => MultiProgressBarState();
}

class MultiProgressBarState extends State<MultiProgressBar>
    with TickerProviderStateMixin {
  AnimationController _barAnimationController;
  Animation<double> _barAnimation;
  Animation<double> _emptyBarAnimation;
  Timer _animationDelayTimer;

  @override
  void initState() {
    super.initState();

    _barAnimationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration ?? Duration(seconds: 2),
    );

    CurvedAnimation curvedBarAnimation = CurvedAnimation(
      parent: _barAnimationController,
      curve: Curves.easeOut,
    );

    _barAnimation = Tween(begin: 0.0, end: 1.0).animate(curvedBarAnimation);

    _emptyBarAnimation =
        Tween(begin: 1000.0, end: 0.0).animate(curvedBarAnimation);

    _barAnimation.addListener(() {
      setState(() {});
    });

    /// If animation is set to false then move animation controller to end.
    if (widget.animate == true || widget.animate == null) {
      /// If animation delay is provided then delay the animation for given
      /// time else don't delay it
      _animationDelayTimer = Timer(widget.animationDelay ?? Duration(), () {
        _barAnimationController.forward();
      });
    } else {
      _barAnimationController.forward(from: 1.0);
    }
  }

  @override
  void dispose() {
    _animationDelayTimer?.cancel();
    _barAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Return empty text if no items are provided.
    if (widget.barItems == null || widget.barItems.isEmpty) {
      return Text(widget.emptyMessage ?? "No data available.");
    }

    double total = widget.barItems.reduce(
      (item1, item2) {
        return BarItem(value: item1.value + item2.value, color: Colors.grey);
      },
    ).value;

    if (total > 1.0) {
      throw Exception(
          "(MultiProgressBar): Total of all BarItem values should not exceed 1.0. Current total: $total.");
    }

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildBar(total),
          widget.showLabels == null || widget.showLabels
              ? SizedBox(
                  height: 16.0,
                )
              : Container(),
          widget.showLabels == null || widget.showLabels
              ? _buildLabels()
              : Container(),
        ],
      ),
    );
  }

  BorderRadius _getBorderRadius(int index) {
    if (widget.barItems.length == 1) {
      // Only one item present
      return BorderRadius.circular(8.0);
    } else if (index == 0) {
      // Is first item
      return BorderRadius.horizontal(left: Radius.circular(8.0));
    } else if (index == (widget.barItems.length - 1)) {
      // Is last item
      return BorderRadius.horizontal(right: Radius.circular(8.0));
    } else {
      return BorderRadius.zero;
    }
  }

  Widget _buildBar(double total) {
    return Container(
      height: widget.barHeight ?? 6.0,
      decoration: BoxDecoration(
        color: widget.barBackgroundColor ?? Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: List.generate(
          /// Add one to incorporate empty box.
          widget.barItems.length + 1,
          (index) {
            /// The last element should be an empty box which
            /// will expand according to the total value left.
            if (index == widget.barItems.length) {
              return Expanded(
                flex: (1.0 - total) == 0.0
                    ? _emptyBarAnimation.value.toInt()
                    : ((1.0 - total) * 1000).toInt(),
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.barBackgroundColor ?? Colors.grey[200],
                    borderRadius:
                        BorderRadius.horizontal(right: Radius.circular(8.0)),
                  ),
                ),
              );
            }

            BarItem item = widget.barItems[index];

            return Expanded(
              flex: (item.value * 1000 * _barAnimation.value).toInt(),
              child: Container(
                decoration: BoxDecoration(
                  color: item.color,
                  borderRadius: _getBorderRadius(index),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLabels() {
    FractionallySizedBox();
    return Wrap(
      spacing: 16.0,
      runSpacing: 16.0,
      children: List.generate(widget.barItems.length, (index) {
        BarItem item = widget.barItems[index];
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                color: item.color,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(
              width: 4.0,
            ),
            Text(
              item.label ?? "",
              style: TextStyle(
                color: widget.labelTextColor ?? Colors.grey,
                fontSize: widget.labelTextSize ?? 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      }),
    );
  }
}

class BarItem {
  final double value;
  final Color color;
  final String label;

  BarItem({
    @required this.value,
    @required this.color,
    this.label,
  });
}
