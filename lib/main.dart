import 'package:flutter/material.dart';
import 'package:wash_x/dashboard/dashboard.dart';
import 'package:wash_x/my_strings.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: new ThemeData(
          primarySwatch: Colors.blue,
          //IMPORTANT: Setting a transparent canvas colour, will make it possible for us have
          // bottom sheets with transparent background. This is so we'll able to have horizontal
          // margins around it. If you have issues with transparent background for your Widgets,
          // simply wrap it in a container and set the color for it. For our current theme,
          // use Colors.white or Colors.grey[50] as the color of the said container.
          canvasColor: Colors.transparent),
      home: new Dashboard(),
    );
  }
}
