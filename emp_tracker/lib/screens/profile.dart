import 'package:flutter/material.dart';
import 'package:emp_tracker/modules/CurrentIndex.dart';
import 'package:emp_tracker/screens/leaves.dart';
import 'package:emp_tracker/modules/CurrentIndex.dart';
import 'home.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  int currid = 2;

  String _bio= '';
  String _name = '';
  AssetImage acc = AssetImage('images/mgk.jpg');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(width: 25.0,),
                          CircleAvatar(
                            radius: 80.0,
                            backgroundImage: acc,
                          ),
                          IconButton(icon: Icon(
                              Icons.add, size: 40.0, color: Colors.white),
                            onPressed: () {
                              //something
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Expanded(

                    child: Center(
                      child: Text(
                        'UserName',
                        style: TextStyle(
                          fontSize: 35.0,
                          fontFamily: 'Roboc',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),

                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(
                      vertical: 3.0, horizontal: 25.0,),
                    child: ListTile(

                        leading: Icon(
                          Icons.person,
                          color: Color(0xFF00C2CB),
                        ),
                        title: Text(
                          'Digital Marketing',
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'Roboc',
                            fontSize: 25.0,
                          ),
                        )
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(
                      vertical: 3.0, horizontal: 25.0,),
                    child: ListTile(

                        leading: Icon(
                          Icons.assistant,
                          color: Color(0xFF00C2CB),
                        ),
                        title: Text(
                          'BIO- Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam turpis orci, laoreet sed dolor vitae, sagittis suscipit ante.  ',
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'Roboc',
                            fontSize: 23.0,
                          ),
                        )
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(
                      vertical: 3.0, horizontal: 25.0,),
                    child: ListTile(

                        leading: Icon(
                          Icons.email,
                          color: Color(0xFF00C2CB),
                        ),
                        title: Text(
                          'slmaoao@gmail.com',
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'Roboc',
                            fontSize: 25.0,
                          ),
                        )
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 60.0,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 70.0, right: 70.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF64DD17),
                          Color(0xFF00C2CB),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Text(
                      "Log Out",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(flex: 1, child: Container(),)
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Color(0x8800C2CB),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFF00C2CB),
          title: Text('Profile'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.edit),
              color: Colors.white,
              onPressed: () {
                //something
              },
            ),
          ],
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currid,
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
              currid = index;
              if (currid == 0) {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home()));
              }
              else if (currid == 1) {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Leaves()));
              }
            },);
          },
        ),
      ),
    );
  }
}