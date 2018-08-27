import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      ),
      home: new Dashboard(),
    );
  }
}
