import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int theme = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        bottomNavigationBar: Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    theme = 0;
                  });
                },
                child: Container(
                  height: 60.0,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            theme == 0 ? Colors.blue: Colors.white,
                            Colors.white,
                            Colors.white,
                          ],
                          begin: (Alignment.bottomCenter),
                          end: (Alignment.topCenter)
                      ),
                  ),
                  child: Icon(
                    Icons.home,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    theme = 1;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            theme == 1 ? Colors.blue : Colors.white,
                            Colors.white,
                            Colors.white,
                          ],
                          begin: (Alignment.bottomCenter),
                          end: (Alignment.topCenter)
                      ),

                  ),
                  height: 60.0,
                  child: Icon(
                    Icons.work,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    theme = 2;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            theme == 2 ? Colors.blue: Colors.white,
                            Colors.white,
                            Colors.white,
                          ],
                          begin: (Alignment.bottomCenter),
                          end: (Alignment.topCenter)
                      ),

                  ),
                  height: 60.0,
                  child: Icon(
                    Icons.pregnant_woman,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    theme = 3;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            theme == 3 ? Colors.blue : Colors.white,
                            Colors.white,
                            Colors.white,
                          ],
                          begin: (Alignment.bottomCenter),
                          end: (Alignment.topCenter))),
                  height: 60.0,
                  child: Icon(
                    Icons.email,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    theme = 4;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            theme == 4 ? Colors.blue : Colors.white,
                            Colors.white,
                            Colors.white,
                          ],
                          begin: (Alignment.bottomCenter),
                          end: (Alignment.topCenter))),
                  height: 60.0,
                  child: Icon(
                    Icons.account_circle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
