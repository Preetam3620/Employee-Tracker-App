import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Tracker',
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.blueGrey.shade900,
          scaffoldBackgroundColor: Color(0xFFFFFFFF),
          accentColor: Colors.white),
      home: Home(),
    );
  }
}
