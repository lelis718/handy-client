import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:handyclientapp/pages/help_list/widgets/action_footer_button.dart';

class ActionFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          ActionFooterButton(
            iconButton: FontAwesomeIcons.stickyNote,
            textButton: "Swipe Left for next card",
          ),
          ActionFooterButton(
            iconButton: FontAwesomeIcons.comments,
            textButton: "Swipe Right to give a hand",
          ),
        ],
      ),
    );
  }
}
