import 'package:flutter/material.dart';
import 'package:handyclientapp/models/help.dart';
import 'package:handyclientapp/pages/help_list/widgets/action_footer.dart';
import 'package:handyclientapp/pages/help_list/widgets/help_card.dart';

class HelpListPage extends StatefulWidget {
  final List<Help> helpRequests;
  final Function(Help) onHelp;
  HelpListPage({Key key, @required this.helpRequests, this.onHelp})
      : super(key: key);

  @override
  _HelpListPageState createState() => _HelpListPageState();
}

class _HelpListPageState extends State<HelpListPage> {
  List<HelpCard> cards = new List();
  List<Widget> widgetCards = new List();
  int cardIndex = -1;

  @override
  void initState() {
    super.initState();
    _loadCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Swipe cards to give a hand')),
      ),
      body: Container(
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
                children: _drawDraggableCards(),
              ),
            ),
            ActionFooter(
              onHelp: () {
                final help = widget.helpRequests[0];
                widget.onHelp(help);
              },
              onNextHelp: () => _switchCards(),
            ),
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

  _switchCards() {
    setState(
      () {
        var card = cards.removeAt(0);
        cards.add(card);
      },
    );
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
                    final help = widget.helpRequests[0];
                    widget.onHelp(help);
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
