import 'package:flutter/material.dart';
import 'package:emp_tracker/modules/bottom_icons.dart';
import 'package:emp_tracker/screens/home.dart';
import 'package:emp_tracker/screens/tasks.dart';
import 'package:emp_tracker/screens/profile.dart';
import 'package:emp_tracker/screens/leaves.dart';

class Leaves extends StatefulWidget {
  @override
  _LeavesState createState() => _LeavesState();
}

class _LeavesState extends State<Leaves> {
  bool theme1 = false;
  bool theme2 = false;
  bool theme4 = false;
  bool theme5 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text('tasks'),
        backgroundColor: Colors.grey,
        bottomNavigationBar: Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
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
                          MaterialPageRoute(builder: (context) => Tasks()));
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
