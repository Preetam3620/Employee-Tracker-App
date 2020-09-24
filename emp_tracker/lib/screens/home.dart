import 'package:flutter/material.dart';
import 'package:emp_tracker/modules/bottom_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool theme1 = false;
  bool theme2 = false;
  bool theme3 = false;
  bool theme4 = false;
  bool theme5 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        bottomNavigationBar: Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      theme1 = true;
                      theme2 = false;
                      theme3 = false;
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
                      theme1 = false;
                      theme2 = true;
                      theme3 = false;
                      theme4 = false;
                      theme5 = false;
                    });
                  },
                  child: BottomIcons(themeState: theme2, icon: Icons.work)),
            ),
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      theme1 = false;
                      theme2 = false;
                      theme3 = true;
                      theme4 = false;
                      theme5 = false;
                    });
                  },
                  child: BottomIcons(
                      themeState: theme3, icon: Icons.pregnant_woman)),
            ),
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      theme1 = false;
                      theme2 = false;
                      theme3 = false;
                      theme4 = true;
                      theme5 = false;
                    });
                  },
                  child: BottomIcons(
                      themeState: theme4, icon: Icons.account_circle)),
            ),
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      theme1 = false;
                      theme2 = false;
                      theme3 = false;
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
