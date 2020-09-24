import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isRemember = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: Image.asset(
                  'images/logo.png',
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
                  //textAlign: TextAlign.center,
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
                        borderSide:
                            BorderSide(color: Colors.black, width: 2.0)),
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
                        borderSide:
                            BorderSide(color: Colors.black, width: 2.0)),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(left: 35.0, right: 35.0),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: _isRemember,
                      onChanged: (bool value) {
                        setState(() {
                          _isRemember = value;
                        });
                      },
                      activeColor: Colors.black54,
                    ),
                    Text(
                      'Remember Me',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Expanded(
              flex: 2,
              child:  GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home())
                  );
                },
                child: Container(
                  padding:  EdgeInsets.only(left:80.0,right: 80.0,top: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                      border: Border.all(color: Colors.black,width: 2.0)
                  ),
                  child: Text("Login",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0
                  ),),
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
    );
  }
}
