import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'loginScreen.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _name;
  String _email;
  String _Ans1;
  String _Ans2;
  String _Ans3;
  String _Ans4;

  final _Firestore = FirebaseFirestore.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 20,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildAnswer1() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Answer'),
      maxLength: 50,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Answer is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _Ans1 = value;
      },
    );
  }

  Widget _buildAnswer2() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Answer'),
      maxLength: 50,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Answer is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _Ans2 = value;
      },
    );
  }

  Widget _buildAnswer3() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Answer'),
      maxLength: 50,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Answer is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _Ans3 = value;
      },
    );
  }

  Widget _buildAnswer4() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Answer'),
      maxLength: 50,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Answer is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _Ans4 = value;
      },
    );
  }

  bool sumbitPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Interview Feedback"),
        backgroundColor: Color(0xFF00C2CB),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Enter your Full Name',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  _buildName(),
                  Text(
                    'Enter your Email-id',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  _buildEmail(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Rate your Interview Experience',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  _buildAnswer1(),
                  Text(
                    'Were you able to get your points across?',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  _buildAnswer2(),
                  Text(
                    'What could you have done better?',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  _buildAnswer3(),
                  Text(
                    'Any personal feedback regarding your interview?',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  _buildAnswer4(),
                  RaisedButton(
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Color(0xFF00C2CB), fontSize: 14),
                    ),
                    onPressed: () {
                      setState(() {
                        sumbitPressed = true;
                      });
                      if (!_formKey.currentState.validate()) {
                        return;
                      }
                      _formKey.currentState.save();
                      _Firestore.collection('feedback').add({
                        'name': _name,
                        'emailid': _email,
                        'answer1': _Ans1,
                        'answer2': _Ans2,
                        'answer3': _Ans3,
                        'answer4': _Ans4
                      });
                      Alert(
                        closeIcon: Icon(Icons.phone_missed,
                        color: Colors.white,) ,
                          context: context,
                          type: AlertType.success,
                          title: 'Response Submitted!',
                          desc: 'Thank you for your response',
                          style: AlertStyle(
                            backgroundColor: Colors.white,
                          )).show();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                      //Send to API
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
