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
    return  Container(
        color: Colors.white,
        child:Center(
            child: Stack(
              alignment: Alignment.center,
              children: _getIntroCards(),
            )
        )
    );

  }

  @override void didUpdateWidget(IntroPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    cards = new List();
    cards.add(new IntroCard(
        "Bem vindo ao Handy!",  FontAwesomeIcons.smileBeam, Colors.blue));
    cards.add(new IntroCard("Aqui você pode ajudar", FontAwesomeIcons.peopleCarry, Colors.lightBlue));
    cards.add(new IntroCard("Ou ser ajudado", FontAwesomeIcons.handHoldingHeart, Colors.lightBlueAccent));

  }

  List<Widget> _getIntroCards() {
    double spacingMargin = 10;
    double currentMargin = 200;
    widgetCards = new List();

    cards.reversed.toList().asMap().forEach((index, element) {
      currentMargin += spacingMargin;
      widgetCards.add(Positioned(
          top: currentMargin,
          child: Draggable(
            onDragEnd: (drag) {
              setState((){
                cards.removeAt(cards.length-(index+1));
              });
            },
            childWhenDragging: Container(),
            feedback: element.drawCard(true),
            child: element.drawCard(false),
          )));
    });
    return widgetCards;
  }
}
