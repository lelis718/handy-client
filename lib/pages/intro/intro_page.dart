import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/bloc/intro/intro.dart';
import 'package:handyclientapp/bloc/navigation/navigation_bloc.dart';
import 'package:handyclientapp/bloc/navigation/navigation_event.dart';

import 'package:handyclientapp/pages/pages.dart';

import 'widgets/intro_card.dart';

class IntroPage extends StatefulWidget {
  final IntroBloc introBloc;

  IntroPage({Key key, this.introBloc}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<IntroCard> cards = new List();
  List<Widget> widgetCards = new List();

  @override
  Widget build(BuildContext context) {
    return HandyTheme(
        title: "Handy",
        child: BlocBuilder<IntroBloc, IntroState>(
            bloc: this.widget.introBloc,
            builder: (context, state) {
              if (state is CardsLoaded) {
                return Container(
                  color: Colors.white,
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: _getIntroCards(),
                    ),
                  ),
                );
              }
              return Container();
            }));
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
                      BlocProvider.of<NavigationBloc>(context).add(NavigateToHome());
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
