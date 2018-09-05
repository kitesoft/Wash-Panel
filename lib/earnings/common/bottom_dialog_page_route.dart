import 'package:flutter/material.dart';

class BottomDialogPageRoute<T> extends PageRoute<T> {
  BottomDialogPageRoute({
    this.builder,
  }) : super();

  final WidgetBuilder builder;

  @override
  Color get barrierColor => Colors.white70;

  @override
  String get barrierLabel => null;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    CurvedAnimation curvedAnimation =
        CurvedAnimation(parent: animation, curve: Curves.ease);

    Animation<Offset> slideAnimation = Tween(
      begin: Offset(0.0, 1.0),
      end: Offset(0.0, 0.0),
    ).animate(curvedAnimation);

    return SlideTransition(
      position: slideAnimation,
      child: Container(
        margin: EdgeInsets.only(
          top: 80.0,
          left: 80.0,
          right: 80.0,
        ),
        padding: EdgeInsets.only(top: 8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[200]),
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
        ),
        child: child,
      ),
    );
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);
}
