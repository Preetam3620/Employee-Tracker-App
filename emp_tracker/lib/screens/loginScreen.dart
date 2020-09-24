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
        backgroundColor: Colors.white,
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
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(

                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.account_circle,
                      color: Colors.lightBlueAccent,
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
                            BorderSide(color: Color(0xFF64DD17), width: 2.0)),
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
                        borderSide:
                            BorderSide(color: Color(0xFF00C2CB), width: 2.0)),
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
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width:20.0,
                      height: 20.0,
                      color: Colors.grey,
                      child: Checkbox(
                        value: _isRemember,
                        onChanged: (bool value) {
                          setState(() {
                            _isRemember = value;
                          });
                        },
                        activeColor: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'Remember Me',
                      style: TextStyle(
                        color: Colors.black54,
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
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 70.0,right: 70.0),
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
                  child: Text("Login",
                  style: TextStyle(
                      color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
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
