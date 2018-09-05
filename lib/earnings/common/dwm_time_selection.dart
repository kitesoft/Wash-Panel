import 'package:flutter/material.dart';

class DWMTimeSelection extends StatefulWidget {
  final Function(TimeSelection) onChange;
  final TimeSelection timeSelection;

  const DWMTimeSelection({
    Key key,
    this.onChange,
    this.timeSelection,
  }) : super(key: key);

  @override
  DWMTimeSelectionState createState() {
    return new DWMTimeSelectionState();
  }
}

class DWMTimeSelectionState extends State<DWMTimeSelection> {
  TimeSelection _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.timeSelection ?? TimeSelection.DAY;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _TimeItem(
          title: "D",
          isSelected: _selected == TimeSelection.DAY,
          onTap: () => _changeSelection(TimeSelection.DAY),
        ),
        SizedBox(
          width: 8.0,
        ),
        _TimeItem(
          title: "W",
          isSelected: _selected == TimeSelection.WEEK,
          onTap: () => _changeSelection(TimeSelection.WEEK),
        ),
        SizedBox(
          width: 8.0,
        ),
        _TimeItem(
          title: "M",
          isSelected: _selected == TimeSelection.MONTH,
          onTap: () => _changeSelection(TimeSelection.MONTH),
        ),
      ],
    );
  }

  void _changeSelection(TimeSelection timeSelection) {
    setState(() {
      _selected = timeSelection;
    });
    if (widget.onChange != null) {
      widget.onChange(_selected);
    }
  }
}

class _TimeItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function() onTap;

  const _TimeItem({
    Key key,
    @required this.title,
    @required this.isSelected,
    this.onTap,
  })  : assert(title != null, isSelected != null,),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey[200] : Colors.white,
        border: Border.all(
          color: isSelected ? Colors.grey[400] : Colors.grey[300],
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: this.onTap,
          child: Container(
            width: 24.0,
            padding: EdgeInsets.all(6.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum TimeSelection {
  DAY,
  WEEK,
  MONTH,
}
