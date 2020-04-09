import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NeedHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          'WIP - Do some help',
          textAlign: TextAlign.center,
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 16,
            color: Colors.lightBlueAccent,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }
}
