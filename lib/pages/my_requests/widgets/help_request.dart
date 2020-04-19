import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:handyclientapp/model/help.dart';

class HelpRequest extends StatelessWidget {
  final Help helpRequest;
  final VoidCallback onPeopleHelping;
  final VoidCallback onResolveHelp;
  final VoidCallback onMarkSomeoneHelping;

  HelpRequest(
      {Key key,
      @required this.helpRequest,
      this.onPeopleHelping,
      this.onResolveHelp,
      this.onMarkSomeoneHelping})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(width:20, child: FaIcon(FontAwesomeIcons.handPointUp, color: Colors.white, size: 20.0)),
        Container(
          width: 50,
          child: Text(helpRequest.message,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
        ),
        GestureDetector(
          onTap: onPeopleHelping,
          child: Container(
            width: 20,
            child: FaIcon(FontAwesomeIcons.peopleCarry,
                color: Colors.white, size: 20.0),
          ),
        ),
        GestureDetector(
          onTap: onMarkSomeoneHelping,
          child: Container(
            width: 20,
            child: FaIcon(FontAwesomeIcons.user,
                color: Colors.white, size: 20.0),
          ),
        ),
        GestureDetector(
          onTap: onMarkSomeoneHelping,
          child: FaIcon(FontAwesomeIcons.thumbsUp,
              color: Colors.white, size: 40.0),
        ),
      ],
    );
  }
}
