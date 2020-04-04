import 'package:flutter/material.dart';
import 'package:handyclientapp/IntroCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<IntroCard> cards = new List();
  List<Widget> widgetCards = new List();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
            child: Stack(
          alignment: Alignment.center,
          children: _getIntroCards(),
        )));
  }

  @override
  void didUpdateWidget(IntroPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    cards = new List();
    cards.add(new IntroCard("Welcome to Handy!", FontAwesomeIcons.smileBeam, Colors.lightBlueAccent));
    cards.add(new IntroCard("Need some help?", FontAwesomeIcons.questionCircle, Colors.lightBlueAccent));
    cards.add(new IntroCard("Add local and what you are planning to do", FontAwesomeIcons.searchLocation, Colors.lightBlueAccent));
    cards.add(new IntroCard("Someone will receive your request to give you a hand!", FontAwesomeIcons.smileWink, Colors.lightBlueAccent));
    cards.add(new IntroCard("Want to help someone?", FontAwesomeIcons.peopleCarry, Colors.lightBlueAccent));
    cards.add( new IntroCard("Swipe between the cards for give a hand to someone. ", FontAwesomeIcons.arrowsAltH, Colors.lightBlueAccent));
    cards.add(new IntroCard("Shall we begin?", FontAwesomeIcons.smileBeam, Colors.lightBlueAccent));
  }

  List<Widget> _getIntroCards() {
    double spacingMargin = 10;
    double currentMargin = 200;
    double alphaDecrease = 0.2;
    
    widgetCards = new List();
    cards.reversed.toList().asMap().forEach((index, element) {
      widgetCards.add(Positioned(
          top: currentMargin,
          child: Draggable(
            onDragEnd: (drag) {
              setState(() {
                cards.removeAt(cards.length - (index + 1));
              });
            },
            childWhenDragging: Container(),
            feedback: element.drawCard(true),
            child: Opacity(
              opacity: (1.0-((cards.length-1-index)*alphaDecrease)).clamp(0.0, 1.0),
              child: element.drawCard(false),
            ),
          )
          ));
      currentMargin += spacingMargin;
    });

    return widgetCards;
  }
}
//0,1,2,3,4
//1,2,3,4,5
//(length-index)-(length-index-1)