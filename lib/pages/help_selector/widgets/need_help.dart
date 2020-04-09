import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NeedHelp extends StatelessWidget {
  const NeedHelp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
            ),
            child: FaIcon(
              FontAwesomeIcons.arrowCircleLeft,
              color: Colors.white,
              size: 100.0,
            )),
        Container(
          child: Column(
            children: <Widget>[
              Text(
                "Need a hand?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "\nSwipe left\n and describe\n what do you need",
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
