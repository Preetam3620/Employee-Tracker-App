import 'package:flutter/material.dart';

class BottomIcons extends StatelessWidget {
  BottomIcons({this.themeState, this.icon});
  final bool themeState;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          themeState == true ? Colors.blue : Colors.white,
          Colors.white,
          Colors.white,
        ], begin: (Alignment.bottomCenter), end: (Alignment.topCenter)),
      ),
      child: Icon(
        icon,
        color: Colors.black,
      ),
    );
  }
}
