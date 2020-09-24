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

  int _currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text('tasks'),
        backgroundColor: Colors.grey,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              title: Text('Feedback'),
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
          onTap: (index){
            setState(() {
              _currentIndex = index;
              if(_currentIndex == 0){
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Home()));
              }
              else if(_currentIndex == 2){
                Navigator.push(context,MaterialPageRoute(builder: (context) => Leaves()));
              }
              else if(_currentIndex == 3)
                Navigator.push(context,MaterialPageRoute(builder: (context) => Profile()));
            });
          },
        ),
      ),
    );
  }
}
