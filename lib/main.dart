import 'package:flutter/material.dart';
import 'login.dart';

void main() => runApp(DevFestApp());

class DevFestApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login()
    );
  }
}