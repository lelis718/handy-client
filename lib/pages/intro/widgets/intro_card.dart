import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IntroCard {
  String title = "";
  IconData icon;
  Color color;

  IntroCard({this.title, this.icon, this.color});

  Widget drawCard(bool rotate) {
    return Container(
      transform: rotate ? Matrix4.rotationZ(-0.05) : null,
      child: Card(
        elevation: 12,
        color: this.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          alignment: Alignment.center,
          width: 350,
          height: 400,
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                ),
                child: FaIcon(
                  this.icon,
                  color: Colors.white,
                  size: 100.0,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 30,
                ),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
