import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WannaHelp extends StatelessWidget {
  const WannaHelp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: FaIcon(FontAwesomeIcons.arrowCircleRight,
              color: Colors.white, size: 100.0),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Text(
                "Wanna help?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "\nSwipe right\n and discover \nwhat you can do",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        )
      ],
    );
  }
}
