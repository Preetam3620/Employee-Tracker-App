import 'package:flutter/material.dart';
import 'package:emp_tracker/modules/bottom_icons.dart';
import 'package:emp_tracker/screens/home.dart';
import 'package:emp_tracker/screens/tasks.dart';
import 'package:emp_tracker/screens/profile.dart';
import 'package:emp_tracker/screens/leaves.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool theme1 = false;
  bool theme2 = false;
  bool theme4 = false;
  bool theme5 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Color(0xFF00C2CB),
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //Expanded(flex: 1, child: Container()),
              Expanded(
                flex: 3,
                child: Center(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(width: 25.0,),
                        CircleAvatar(
                          radius: 80.0,
                          backgroundImage: AssetImage('images/mgk.jpg'),
                        ),
                        IconButton(icon:Icon(Icons.add, size: 40.0, color: Colors.white),
                          onPressed: (){
                          //something
                          },
                        )
                      ],
                    ),
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
                margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 25.0,),
                child: ListTile(

                  leading: Icon(
                    Icons.person,
                    color: Color(0xFF00C2CB),
                  ),
                  title: Text(
                    'Digital Marketing',
                    style: TextStyle(
                      color: Color(0xFF00C2CB),
                      fontFamily: 'Roboc',
                      fontSize: 25.0,
                    ),
                  )
              ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 25.0,),
                child: ListTile(

                    leading: Icon(
                      Icons.assistant,
                      color: Color(0xFF00C2CB),
                    ),
                    title: Text(
                      'BIO- Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam turpis orci, laoreet sed dolor vitae, sagittis suscipit ante.  ',
                      style: TextStyle(
                        color: Color(0xFF00C2CB),
                        fontFamily: 'Roboc',
                        fontSize: 23.0,
                      ),
                    )
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 25.0,),
                child: ListTile(

                    leading: Icon(
                      Icons.email,
                      color: Color(0xFF00C2CB),
                    ),
                    title: Text(
                      'slmaoao@gmail.com',
                      style: TextStyle(
                        color: Color(0xFF00C2CB),
                        fontFamily: 'Roboc',
                        fontSize: 25.0,
                      ),
                    )
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFF00C2CB),
          title: Text('Profile'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.edit),
              color: Colors.white,
              onPressed: (){
            //something
              },
            ),
          ],
        ),
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
