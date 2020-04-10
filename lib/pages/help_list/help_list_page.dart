import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:handyclientapp/model/help_info.dart';
import 'package:handyclientapp/pages/help_list/widgets/help_card.dart';
import 'package:handyclientapp/services/help_service.dart';

import '../../app_routes.dart';
import '../../service_locator.dart';

class HelpListPage extends StatefulWidget {
  HelpListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HelpListPageState createState() => _HelpListPageState();
}

class _HelpListPageState extends State<HelpListPage> {
  List<HelpCard> cards = new List();
  List<Widget> widgetCards = new List();
  HelpService helpService = locator<HelpService>();

  @override
  void initState() {
    super.initState();
    _loadCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.title),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              width: 600,
              height: 500,
              padding: EdgeInsets.symmetric(vertical: 40),
              color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: _drawDraggableCards(),
              ),
            ),
            HelpBar(),
          ],
        ),
      ),
    );
  }

  _loadCards() async {
    List<HelpInfo> helps = await helpService.listHelpInfo();
    //todo Furfill help cards
    this.cards = new List();
    helps.forEach((item) {
      cards.add(new HelpCard(item.description));
    });
  }

  List<Widget> _drawDraggableCards() {
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
                  if(isDragRight){
                    Navigator.of(context).pushNamed(AppRoutes.chat);
                  } else {
                    setState(
                      () {
                        var card = cards.removeAt((cards.length - 1 - index));
                        cards.add(card);
                      },
                    );
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

    //widgetCards.add(Positioned( left: 110, child: Text( 'a line of text' ) ));
    widgetCards.add(Text(''));
    return widgetCards;
  }
}

class HelpBar extends StatelessWidget {
  const HelpBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Container(
            width: (MediaQuery.of(context).size.width - 40) / 2,
            color: Colors.white,
            child: Center(
              child: Column(
                children: <Widget>[
                  FaIcon(FontAwesomeIcons.stickyNote,
                      color: Colors.lightBlueAccent),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Swipe Left for next card",
                      style: TextStyle(color: Colors.lightBlueAccent),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: (MediaQuery.of(context).size.width - 40) / 2,
            color: Colors.white,
            child: Center(
              child: Column(
                children: <Widget>[
                  FaIcon(
                    FontAwesomeIcons.comments,
                    color: Colors.lightBlueAccent,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Swipe Right to give a hand",
                      style: TextStyle(color: Colors.lightBlueAccent),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
