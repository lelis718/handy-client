import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class HelpSelectorPage extends StatefulWidget {
  HelpSelectorPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HelpSelectorPageState createState() => _HelpSelectorPageState();
}

class _HelpSelectorPageState extends State<HelpSelectorPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: Text(
                "Handy",
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Draggable(
              onDragEnd: (drag) {
                if (drag.offset.dx.abs() > 30) {
                  var isDragRight = drag.offset.dx > 0;
                  var pageToNavigate =
                      isDragRight ? "/giveHandList" : "/needHelp";

                  debugPrint("Redirecting to ${pageToNavigate}");

                  Navigator.pushReplacementNamed(
                    context,
                    pageToNavigate,
                  );
                }
              },
              childWhenDragging: Container(),
              feedback: buildCard(),
              child: buildCard(),
            )
          ],
        ),
      ),
    );
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
            NeedHelp(),
            WannaHelp(),
          ],
        ),
      ),
    );
  }
}
