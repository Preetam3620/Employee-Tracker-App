import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emp_tracker/screens/feed.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final _auth = FirebaseAuth.instance;
final _data = FirebaseFirestore.instance;
String _uid = '';

class Item {
  const Item(this.name);
  final String name;
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isRemember = false;
  Item selectedUser;
  List<Item> users = <Item>[
    const Item('Employee'),
    const Item('Interveiwee'),
  ];

  String email;
  String password;
  bool remMe;
  bool isEmp;
  String uid;
  User us;
  bool spinner = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: spinner,
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      child: Image.asset(
                        'images/logo1.png',
                        width: 200.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.only(left: 35.0, right: 35.0),
                      child: TextField(
                        onChanged: (value) {
                          email = value;
                        },
                        style: TextStyle(color: Colors.black),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.account_circle,
                            color: Colors.black,
                          ),
                          hintText: ('Enter your Email'),
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                  color: Color(0xFF64DD17), width: 2.0)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.only(left: 35.0, right: 35.0),
                      child: TextField(
                        onChanged: (value) {
                          password = value;
                        },
                        style: TextStyle(color: Colors.black),
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          hintText: ('Enter your password'),
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                  color: Color(0xFF00C2CB), width: 2.0)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            '                    ',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          DropdownButton<Item>(
                            hint: Text(
                              "Select User",
                              style: TextStyle(color: Colors.black54),
                            ),
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
                            dropdownColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () async {
                        setState(() {
                          spinner = true;
                        });
                        try {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          print(selectedUser.name);
                          if (user != null) {
                            us = _auth.currentUser;

                            print(us);
                            if (selectedUser.name == 'Employee') {
                              setState(() {
                                spinner = false;
                              });
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            } else if (selectedUser.name == 'Interveiwee') {
                              setState(() {
                                spinner = false;
                              });
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Feed()));
                            } else {
                              setState(() {
                                spinner = false;
                              });
                              Alert(
                                  context: context,
                                  type: AlertType.error,
                                  title: 'Login Failed!',
                                  desc: 'Please Select User Type',
                                  style: AlertStyle(
                                    backgroundColor: Colors.white,
                                  )).show();
                            }
                          }
                          setState(() {
                            spinner = false;
                          });
                        } catch (e) {
                          setState(() {
                            spinner = false;
                          });
                          Alert(
                              context: context,
                              type: AlertType.error,
                              title: 'Login Failed!',
                              desc: 'Invalid Combination of Credentials',
                              style: AlertStyle(
                                backgroundColor: Colors.white,
                              )).show();
                        }
                        ;
                      },
                      child: Container(
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
                          "Login",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
