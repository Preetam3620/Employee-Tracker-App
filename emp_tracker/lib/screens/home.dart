import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
String Ann1;
String Ann2;
String Ann3;
String Ann4;
String Ann5;
String uid;
User us;
var snap;

final _auth = FirebaseAuth.instance;
var  firestore = FirebaseFirestore.instance;

void getCurrentuserinfo() async{
  us = _auth.currentUser;
  uid = us.uid;
  print(uid);
  snap = await firestore.collection('Announcements').doc('Announcements').get();
  Ann1 = snap.data().values.elementAt(4);
  Ann2 = snap.data().values.elementAt(3);
  Ann3 = snap.data().values.elementAt(2);
  Ann4 = snap.data().values.elementAt(1);
  Ann5 = snap.data().values.elementAt(0);

}


class _HomeState extends State<Home> {
  final List<String> entries = <String>[
    Ann1,
    Ann2,
    Ann3,
    Ann4,
    Ann5,
  ];
  int currentIndex = 0;
  int co;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     getCurrentuserinfo();
  }
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
                child: Text(
                  'Announcements',
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
                      child: Text(
                        '${entries[index]}',
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0x8800C2CB),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
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
            setState(
              () {
                currentIndex = index;
                if (currentIndex == 1 && co == 0) {
                  co = 1;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Leaves()));
                  currentIndex = 0;
                } else if (currentIndex == 1 && co != 0) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (Context) => Leaves()));
                  currentIndex = 0;
                }
                if (currentIndex == 2 && co == 0) {
                  co = 1;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                  currentIndex = 0;
                } else if (currentIndex == 2 && co != 0) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (Context) => Profile()));
                  currentIndex = 0;
                }
              },
            );
          }),
    ));
  }
}
