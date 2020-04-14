import 'package:flutter/material.dart';
import 'package:handyclientapp/model/card_info.dart';

import 'widgets/intro_card.dart';

class IntroPage extends StatefulWidget {
  final List<CardInfo> cardsInfo;
  final VoidCallback onFinishCards;

  IntroPage({Key key, this.cardsInfo, this.onFinishCards}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<IntroCard> cards = new List();
  List<Widget> widgetCards = new List();

  _IntroPageState() {
    for (final cardInfo in widget.cardsInfo) {
      this.cards.add(
            IntroCard(
              color: cardInfo.color,
              icon: cardInfo.icon,
              title: cardInfo.title,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Handy"),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: _getIntroCards(),
          ),
        ),
      ),
    );
  }

  List<Widget> _getIntroCards() {
    double spacingMargin = 10;
    double currentMargin = 60;
    double alphaDecrease = 0.2;

    widgetCards = new List();
    cards.reversed.toList().asMap().forEach(
      (index, element) {
        widgetCards.add(
          Positioned(
            top: currentMargin,
            child: Draggable(
              onDragEnd: (drag) {
                setState(
                  () {
                    cards.removeAt(cards.length - (index + 1));
                    if (cards.length == 0) {
                      widget.onFinishCards();
                    }
                  },
                );
              },
              childWhenDragging: Container(),
              feedback: element.drawCard(true),
              child: Opacity(
                opacity: (1.0 - ((cards.length - 1 - index) * alphaDecrease))
                    .clamp(0.0, 1.0),
                child: element.drawCard(false),
              ),
            ),
          ),
        );
        currentMargin += spacingMargin;
      },
    );

    return widgetCards;
  }
}
