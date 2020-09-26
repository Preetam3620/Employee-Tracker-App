import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:emp_tracker/screens/leaves.dart';
import 'home.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'profileUpdate.dart';
import 'loginScreen.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String imp;
  File image;
  void pickimage() async {
    PickedFile pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    imp = pickedFile.path;
    image = File(pickedFile.path);
    setState(() {});
  }

  int currid = 2;
  String _emal = 'Loading';
  String _bio = 'Loading';
  String uid;
  String _name = 'Loading';
  String _desig = 'Loading';
  AssetImage acc = AssetImage('images/1mgk.jpeg');
  User us;
  final _auth = FirebaseAuth.instance;
  var firestore = FirebaseFirestore.instance;

  void getCurrentuserinfo() async {
    us = _auth.currentUser;
    uid = us.uid;
    print(uid);
    final snap = await firestore.collection('Usere').doc(uid).get();
    _name = snap.data().values.elementAt(0);
    _bio = snap.data().values.elementAt(1);
    _emal = snap.data().values.elementAt(2);
    _desig = snap.data().values.elementAt(3);
    print(snap.data());
    setState(() {});
  }

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
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
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
                          CircleAvatar(
                            radius: 80.0,
                            //child: _image == null?Text('Enter Image here'):,
                            backgroundImage: image == null
                                ? acc
                                : FileImage(File(image.path)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        _name,
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
                      vertical: 3.0,
                      horizontal: 25.0,
                    ),
                    child: ListTile(
                        leading: Icon(
                          Icons.person,
                          color: Color(0xFF00C2CB),
                        ),
                        title: Text(
                          _desig,
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'Roboc',
                            fontSize: 25.0,
                          ),
                        )),
                  ),
                  Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(
                      vertical: 3.0,
                      horizontal: 25.0,
                    ),
                    child: ListTile(
                        leading: Icon(
                          Icons.assistant,
                          color: Color(0xFF00C2CB),
                        ),
                        title: Text(
                          _bio,
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'Roboc',
                            fontSize: 23.0,
                          ),
                        )),
                  ),
                  Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(
                      vertical: 3.0,
                      horizontal: 25.0,
                    ),
                    child: ListTile(
                        leading: Icon(
                          Icons.email,
                          color: Color(0xFF00C2CB),
                        ),
                        title: Text(
                          _emal,
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'Roboc',
                            fontSize: 25.0,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Container(
                      height: 60.0,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 70.0, right: 70.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF00C2CB),
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
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  )
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
            IconButton(
                icon: Icon(Icons.edit),
                color: Colors.white,
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ProfileUpdate()));
                }),
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
            setState(
              () {
                currid = index;
                if (currid == 0) {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Home()));
                } else if (currid == 1) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Leaves()));
                }
              },
            );
          },
        ),
      ),
    );
  }
}
