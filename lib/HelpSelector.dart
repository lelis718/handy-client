import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HelpSelector extends StatefulWidget {
  HelpSelector({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HelpSelectorState createState() => _HelpSelectorState();
}

class _HelpSelectorState extends State<HelpSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        //transform: rotate ? Matrix4.rotationZ(-0.05) : null,
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child: Text(
                    "Handy",
                    style: TextStyle(
                        color: Colors.lightBlueAccent,
                        decoration: TextDecoration.none),
                  )),
              Draggable(
                  onDragEnd: (drag) {
                    if(drag.offset.dx.abs() > 30){ //is a valid drag
                      var isDragRight = drag.offset.dx > 0;
                      var pageToNavigate = isDragRight ? "/giveHandList":"/needHelp";
                    debugPrint("Redirecting to ${pageToNavigate}");
                      Navigator.pushReplacementNamed(context, pageToNavigate);
                    } 
                  },
                  childWhenDragging: Container(),
                  feedback: buildCard(),
                  child: buildCard())
            ],
          ),
        ));
  }

  Card buildCard() {
    return Card(
      elevation: 12,
      color: Colors.lightBlueAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        alignment: Alignment.center,
        width: 350,
        height: 350,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: FaIcon(FontAwesomeIcons.arrowCircleLeft,
                        color: Colors.white, size: 100.0)),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text("Need a hand?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text("\nSwipe left\n and describe\n what do you need",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: FaIcon(FontAwesomeIcons.arrowCircleRight,
                        color: Colors.white, size: 100.0)),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text("Wanna help?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text("\nSwipe right\n and discover \nwhat you can do",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
