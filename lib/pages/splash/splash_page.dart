import 'dart:async';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  final int secondsToFinish;
  final VoidCallback onFinish;

  SplashPage({this.onFinish, this.secondsToFinish}) {
    if (this.secondsToFinish != null && this.secondsToFinish > 0) {
      Timer(Duration(seconds: this.secondsToFinish), onFinish);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                child: CircularProgressIndicator(),
                width: 60,
                height: 60,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'Initializing...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 16,
                    color: Colors.lightBlueAccent,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
