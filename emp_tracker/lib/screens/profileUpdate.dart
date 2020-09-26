import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'profile.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileUpdate extends StatefulWidget {
  @override
  _ProfileUpdateState createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  File image;

  void pickimage() async {
    PickedFile pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    image = File(pickedFile.path);
    setState(() {});
  }

  void Storageimg() {
    FirebaseStorage(storageBucket: 'gs://emptrack-3f0b6.appspot.com');
  }

  String _bio = '';
  String uid;
  String _name = '';
  String _desig = '';
  String _emal;
  AssetImage acc = AssetImage('images/1mgk.jpeg');
  User us;
  final _auth = FirebaseAuth.instance;
  final _Firestore = FirebaseFirestore.instance;
  void getCurrentuserinfo() {
    us = _auth.currentUser;
    uid = us.uid;

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
                    height: 30.0,
                  ),
                  Center(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 25.0,
                          ),
                          CircleAvatar(
                            radius: 80.0,
                            //child: _image == null?Text('Enter Image here'):,
                            backgroundImage: image == null
                                ? acc
                                : FileImage(File(image.path)),
                          ),
                          IconButton(
                            icon: Icon(Icons.add,
                                size: 40.0, color: Colors.white),
                            onPressed: () {
                              pickimage();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    height: 40.0,
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Expanded(
                      child: Center(
                        child: TextField(
                          onChanged: (value) {
                            _name = value;
                          },
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 35.0,
                            fontFamily: 'Roboc',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            hintText: "Enter your Name",
                          ),
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
                      title: TextField(
                        decoration: InputDecoration(
                            hintText: "Designation",
                            hintStyle: TextStyle(
                              color: Colors.black38,
                            )),
                        style: TextStyle(
                          color: Colors.black54,
                          fontFamily: 'Roboc',
                          fontSize: 25.0,
                        ),
                        onChanged: (value) {
                          _desig = value;
                        },
                      ),
                    ),
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
                      title: TextField(
                        decoration: InputDecoration(
                            hintText: "Bio",
                            hintStyle: TextStyle(
                              color: Colors.black38,
                            )),
                        maxLines: 4,
                        style: TextStyle(
                          color: Colors.black54,
                          fontFamily: 'Roboc',
                          fontSize: 25.0,
                        ),
                        onChanged: (value) {
                          _bio = value;
                        },
                      ),
                    ),
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
                      title: TextField(
                        decoration: InputDecoration(
                            hintText: "Email Id",
                            hintStyle: TextStyle(
                              color: Colors.black38,
                            )),
                        style: TextStyle(
                          color: Colors.black54,
                          fontFamily: 'Roboc',
                          fontSize: 25.0,
                        ),
                        onChanged: (value) {
                          _emal = value;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      _Firestore.collection('Usere').doc(uid).set({
                        'bio': _bio,
                        'designation': _desig,
                        'displayname': _name,
                        'emailId': _emal,
                      });
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                      Alert(
                          closeIcon: Icon(
                            Icons.phone_missed,
                            color: Colors.white,
                          ),
                          context: context,
                          type: AlertType.success,
                          title: 'Profile Updated',
                          desc: 'Changes have been saved',
                          style: AlertStyle(
                            backgroundColor: Colors.white,
                          )).show();
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
                        "Update",
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
          title: Text('Profile Update'),
        ),
      ),
    );
  }
}
