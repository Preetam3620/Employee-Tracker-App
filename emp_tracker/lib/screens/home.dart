import 'package:flutter/material.dart';
import 'package:emp_tracker/modules/bottom_icons.dart';
import 'package:emp_tracker/screens/home.dart';
import 'package:emp_tracker/screens/feed.dart';
import 'package:emp_tracker/screens/profile.dart';
import 'package:emp_tracker/screens/leaves.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool theme1 = false;
  bool theme2 = false;
  bool theme4 = false;
  bool theme5 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text('home page/announcements'),
        bottomNavigationBar: Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      theme1 = true;
                      theme2 = false;
                      theme4 = false;
                      theme5 = false;
                    });
                  },
                  child: BottomIcons(themeState: theme1, icon: Icons.home)),
            ),
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Feed()));
                      theme1 = false;
                      theme2 = true;
                      theme4 = false;
                      theme5 = false;
                    });
                  },
                  child:
                      BottomIcons(themeState: theme2, icon: Icons.assignment)),
            ),
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Leaves()));

                      theme1 = false;
                      theme2 = false;
                      theme4 = true;
                      theme5 = false;
                    });
                  },
                  child: BottomIcons(
                      themeState: theme4, icon: Icons.calendar_today)),
            ),
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                      theme1 = false;
                      theme2 = false;
                      theme4 = false;
                      theme5 = true;
                    });
                  },
                  child: BottomIcons(
                      themeState: theme5, icon: Icons.account_circle)),
            ),
          ],
        ),
      ),
    );
  }
}
