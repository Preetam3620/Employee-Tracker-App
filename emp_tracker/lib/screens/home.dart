
import 'package:flutter/material.dart';
import 'package:emp_tracker/screens/tasks.dart';
import 'package:emp_tracker/screens/profile.dart';
import 'package:emp_tracker/screens/leaves.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:emp_tracker/modules/CurrentIndex.dart';
import 'feed.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

final List<String> entries = <String>['Announcement: 1', 'Announcement: 2', 'Announcement: 3','Announcement: 4','Announcement: 5'];
int currind = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: Color(0xFF00C2CB),
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
                  indicatorColor: Color(0xFF00C2CB),
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
                flex: 1,
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20.0),
                  width: double.infinity,
                  child: Text('Announcements',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(10),
                        height: 135,
                        child: Text('${entries[index]}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0
                        ),),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color(0x8800C2CB),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currind,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              title: Text('Leave'),
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Profile'),
              backgroundColor: Colors.black,
            ),
          ],
          onTap: (index) {
            setState(() {
              currind = index;
              if (currind == 1)
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Leaves()));
              else if (currind == 2) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              }
            },);
          }
      ),
    )
    );
  }
}
