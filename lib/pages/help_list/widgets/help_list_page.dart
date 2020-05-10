import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/pages/handy_theme/handy_theme.dart';
import 'package:handyclientapp/pages/navigation/navigation.dart';
import 'package:handyclientapp/pages/shared/shared.dart';

import '../help_list.dart';

class HelpListPage extends StatefulWidget {
  HelpListPage({Key key}) : super(key: key);

  @override
  _HelpListPageState createState() => _HelpListPageState();
}

class _HelpListPageState extends State<HelpListPage> {
  List<Help> helpRequests;
  List<HelpCard> cards = new List();
  List<Widget> widgetCards = new List();
  int cardIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context
        .bloc<HandyThemeBloc>()
        .add(HandyThemeUpdateTitle(title: 'Swipe cards to give a hand'));
    return BlocBuilder<HelpListBloc, HelpListState>(
      builder: (context, state) {
        if (state is InitializeState) {
          context.bloc<HelpListBloc>().add(WantToHelpEvent());
        }
        if (state is WantToHelpState) {
          helpRequests = state.helpRequests;
          this.cards = new List();
          helpRequests.forEach((item) {
            cards.add(new HelpCard(item));
          });

          return Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  width: 600,
                  height: 450,
                  padding: EdgeInsets.symmetric(vertical: 0),
                  color: Colors.white,
                  child: Stack(
                    alignment: Alignment.center,
                    children: _drawDraggableCards(context),
                  ),
                ),
                ActionFooter(
                  onHelp: () {
                    final help = this.helpRequests[0];
                    _openCard(context, help);
                  },
                  onNextHelp: () => _switchCards(),
                ),
              ],
            ),
          );
        }
        return Loading(textToDisplay: "Loading...");
      },
    );
  }

  void _openCard(BuildContext context, Help help) {
    context.bloc<NavigationBloc>().add(
          NavigateToPage(
            page: Routes.helpDetail,
            args: help,
          ),
        );
  }

  _switchCards() {
    setState(
      () {
        var card = cards.removeAt(0);
        cards.add(card);
      },
    );
  }

  List<Widget> _drawDraggableCards(BuildContext context) {
    double spacingMargin = 10;
    double currentMargin = 0;
    double alphaDecrease = 0.2;

    widgetCards = new List();
    cards.reversed.toList().asMap().forEach(
      (index, element) {
        widgetCards.add(
          Positioned(
            top: currentMargin,
            child: Draggable(
              onDragEnd: (drag) {
                if (drag.offset.dx.abs() > 30) {
                  var isDragRight = drag.offset.dx > 0;
                  if (isDragRight) {
                    final help = helpRequests[0];
                    _openCard(context, help);
                  } else {
                    _switchCards();
                  }
                }
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

    widgetCards.add(Text(''));
    return widgetCards;
  }
}
