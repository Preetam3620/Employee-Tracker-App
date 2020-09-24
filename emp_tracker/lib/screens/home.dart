import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:emp_tracker/modules/bottom_icons.dart';
import 'package:emp_tracker/screens/home.dart';
import 'package:emp_tracker/screens/tasks.dart';
import 'package:emp_tracker/screens/profile.dart';
import 'package:emp_tracker/screens/leaves.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool theme1 = false;
  bool theme2 = false;
  bool theme4 = false;
  bool theme5 = false;

  // final List<Widget> children;
  // final double width;
  // final double height;
  // final int initialPage;
  // final Color indicatorColor;
  // final Color indicatorBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: ImageSlideshow(
                  width: double.infinity,
                  height: 25,
                  initialPage: 0,
                  indicatorColor: Colors.blue,
                  indicatorBackgroundColor: Colors.grey,
                  children: [
                    Image.asset(
                      'images/slideshow3.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'images/slideshow2.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'images/slideshow1.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'images/slideshow4.jpg',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: SizedBox(
                  height: 20,
                ),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
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
