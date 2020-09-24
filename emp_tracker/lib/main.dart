import 'package:flutter/material.dart';
import 'screens/loginScreen.dart';
import 'screens/home.dart';
import 'screens/profile.dart';
import 'screens/tasks.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employee Tracker',
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.blueGrey.shade900,
          scaffoldBackgroundColor: Color(0xFFFFFFFF),
          accentColor: Colors.white),
      home: LoginScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => Home(),
        '/profile': (context) => Profile(),
        '/tasks': (context) => Tasks(),
      },
    );
  }
}
