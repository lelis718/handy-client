import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ActionFooterButton extends StatelessWidget {
  final String textButton;
  final IconData iconButton;

  const ActionFooterButton({this.textButton, this.iconButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 40) / 2,
      color: Colors.white,
      child: Center(
        child: Column(
          children: <Widget>[
            FaIcon(this.iconButton, color: Colors.lightBlueAccent),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                this.textButton,
                style: TextStyle(color: Colors.lightBlueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
