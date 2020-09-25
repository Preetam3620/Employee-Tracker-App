import 'package:flutter/material.dart';
import 'package:emp_tracker/modules/bottom_icons.dart';
import 'package:emp_tracker/screens/home.dart';
import 'package:emp_tracker/screens/tasks.dart';
import 'package:emp_tracker/screens/profile.dart';
import 'package:emp_tracker/screens/leaves.dart';
import 'package:date_time_picker/date_time_picker.dart';

class Leaves extends StatefulWidget {
  @override
  _LeavesState createState() => _LeavesState();
}


class Item {
  const Item(this.name);
  final String name;
}

class _LeavesState extends State<Leaves> {



  Item selectedUser;
  List<Item> users = <Item>[
    const Item('Personal'),
    const Item('Travel'),
    const Item('Medical'),
    const Item('Other'),
  ];
  final _controller = TextEditingController();
  int currid = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // elevation: 0.0,
          backgroundColor: Color(0xFF00C2CB),
          title: Text('Leaves'),
        ),
        body: Container(
          margin: EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'From Date',
                    style: TextStyle(fontSize: 20),
                  ),
                  DateTimePicker(
                    initialValue: DateTime.now().toString(),
                    dateMask: 'd MMM, yyyy',
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    icon: Icon(Icons.event),
                    dateLabelText: 'Date',
                    onChanged: (fromDate) => print(fromDate),
                    validator: (fromDate) {
                      print(fromDate);
                      return null;
                    },
                    onSaved: (fromDate) => print(fromDate),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'To Date',
                    style: TextStyle(fontSize: 20),
                  ),
                  DateTimePicker(
                    initialValue: DateTime.now().toString(),
                    dateMask: 'd MMM, yyyy',
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    icon: Icon(Icons.event),
                    dateLabelText: 'Date',
                    onChanged: (toDate) => print(toDate),
                    validator: (toDate) {
                      print(toDate);
                      return null;
                    },
                    onSaved: (toDate) => print(toDate),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Reasons',
                    style: TextStyle(fontSize: 20),
                  ),
                  DropdownButton<Item>(
                    dropdownColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    // focusColor: Colors.white,
                    hint: Text("Select item"),
                    value: selectedUser,
                    onChanged: (Item Value) {
                      setState(() {
                        selectedUser = Value;
                      });
                    },
                    items: users.map((Item user) {
                      return DropdownMenuItem<Item>(
                        value: user,
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              user.name,
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black45)),
                      hintText: 'Description (optional)',
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(height: 30),
                  Container(
                    // alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFF64DD17),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      "Ask For Leave",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Color(0x8800C2CB),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currid,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.black,
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.assignment),
            //   title: Text('Feedback'),
            //   backgroundColor: Colors.black,
            // ),
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
              currid = index;
              if(currid == 0){
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Home()));
              }
              else if(currid == 2)
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Profile()));
            });
          },
        ),
      ),
    );
  }
}
