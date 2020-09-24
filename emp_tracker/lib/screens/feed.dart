import 'package:flutter/material.dart';
import 'package:emp_tracker/screens/form_screen.dart';

class Feed extends StatefulWidget {
@override
_FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Interview Feedback',
      home: FormScreen(),
    );
  }
}
