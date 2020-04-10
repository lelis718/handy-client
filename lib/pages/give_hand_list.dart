import 'package:flutter/material.dart';

class GiveHandList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Help Cards"),
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Text(
              'WIP - List Help Cards',
              textAlign: TextAlign.center,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 16,
                color: Colors.lightBlueAccent,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
