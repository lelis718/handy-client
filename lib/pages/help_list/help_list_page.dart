import 'package:flutter/material.dart';
import 'package:handyclientapp/model/help.dart';
import 'package:handyclientapp/pages/help_list/widgets/action_footer.dart';
import 'package:handyclientapp/pages/help_list/widgets/help_card.dart';
import 'package:handyclientapp/services/help_service.dart';

import '../../service_locator.dart';

class HelpListPage extends StatefulWidget {
  final List<Help> helpRequests;
  final VoidCallback onHelp;
  HelpListPage({Key key, @required this.helpRequests, this.onHelp})
      : super(key: key);

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
        title: Center(child: Text("Swipe cards to give a hand")),
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
            ActionFooter(),
          ],
        ),
      ),
    );
  }

  _loadCards() async {
    setState(() {
      this.cards = new List();
      widget.helpRequests.forEach((item) {
        cards.add(new HelpCard(item));
      });
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
                  if (isDragRight) {
                    widget.onHelp();
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

    widgetCards.add(Text(''));
    return widgetCards;
  }
}
