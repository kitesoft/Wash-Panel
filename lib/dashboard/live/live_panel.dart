import 'package:flutter/material.dart';
import 'package:wash_x/dashboard/live/panel_content.dart';

class LivePanel extends StatefulWidget {
  @override
  _LivePanelState createState() {
    return new _LivePanelState();
  }
}

class _LivePanelState extends State<LivePanel> with TickerProviderStateMixin {
  var isExpanded = false;
  AnimationController animationController;
  Animation<double> parentAnimation;
  Animation<double> contentAnimation;
  Tween<double> parentTween;
  String buttonText = 'LIVE';

  @override
  void initState() {
    super.initState();
    animationController =
        new AnimationController(vsync: this, duration: new Duration(milliseconds: 500));
    parentTween = new Tween(begin: 105.0, end: 505.0);
    parentAnimation =
        parentTween.animate(new CurvedAnimation(parent: animationController, curve: Curves.ease));
    contentAnimation = new Tween(begin: 25.0, end: 430.0)
        .animate(new CurvedAnimation(parent: animationController, curve: Curves.ease));
    parentAnimation.addListener(() {
      setState(() {
        if (isPastHalf()) {
          buttonText = isExpanded ? 'LIVE' : 'CLOSE';
        }
      });
    });
    parentAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed || status == AnimationStatus.dismissed) {
        isExpanded = !isExpanded;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: parentAnimation.value,
      child: new Stack(
        alignment: Alignment.centerRight,
        children: <Widget>[
          new Positioned(
            right: 0.0,
            top: 40.0,
            bottom: 20.0,
            child: new Container(
              width: contentAnimation.value,
              height: double.infinity,
              decoration: new BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    const BoxShadow(blurRadius: 20.0, spreadRadius: 0.0, color: Colors.black38)
                  ],
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(15.0))),
              child: isPastHalf()? new Container(): new PanelContent(),
            ),
          ),
          new Positioned(
            bottom: 65.0,
            left: 0.0,
            child: new InkWell(
              onTap: () {
                if (isExpanded) {
                  animationController.reverse();
                } else {
                  animationController.forward();
                }
              },
              child: new Container(
                width: 95.0,
                height: 45.0,
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                    color: Colors.white,
                    boxShadow: [const BoxShadow(blurRadius: 20.0, color: Colors.black38)],
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(200.0))),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Transform.rotate(
                      angle: animationController.value * 3.1,
                      child: new Icon(Icons.arrow_back),
                    ),
                    new SizedBox(
                      width: 5.0,
                    ),
                    new Text(buttonText)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  bool isPastHalf() {
    return (parentTween.begin + parentTween.end) / 2 > parentAnimation.value;
  }
}
