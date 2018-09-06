import 'package:flutter/material.dart';

class LivePanel extends StatefulWidget {
  @override
  LivePanelState createState() {
    return new LivePanelState();
  }
}

class LivePanelState extends State<LivePanel> with SingleTickerProviderStateMixin {
  var isExpanded = false;
  AnimationController animationController;
  Animation<double> parentAnimation;
  Animation<double> contentAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        new AnimationController(vsync: this, duration: new Duration(milliseconds: 500));
    parentAnimation = new Tween(begin: 100.0, end: 400.0)
        .animate(new CurvedAnimation(parent: animationController, curve: Curves.ease));
    contentAnimation = new Tween(begin: 25.0, end: 325.0)
        .animate(new CurvedAnimation(parent: animationController, curve: Curves.ease));
    parentAnimation.addListener(() {
      setState(() {});
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
      alignment: Alignment.centerRight,
      child: new Stack(
        alignment: Alignment.centerRight,
        children: <Widget>[
          new Positioned(
            right: 0.0,
            top: 40.0,
            bottom: 5.0,
            child: new Container(
              width: contentAnimation.value,
              height: double.infinity,
              decoration: new BoxDecoration(
                  color: Colors.white,
                  boxShadow: [const BoxShadow(blurRadius: 10.0, color: Colors.black38)],
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(15.0))),
            ),
          ),
          new Positioned(
            bottom: 50.0,
            left: 5.0,
            child: new Container(
              decoration: new BoxDecoration(
                  color: Colors.white,
                  boxShadow: [const BoxShadow(blurRadius: 10.0, color: Colors.black38)],
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(200.0))),
              child: new InkWell(
                onTap: () {
                  if (isExpanded) {
                    animationController.reverse();
                  } else {
                    animationController.forward();
                  }
                },
                child: new Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 14.0),
                  child: new Text('LIVE'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
