import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class HelpSelectorPage extends StatelessWidget {
  final VoidCallback onSwipeLeft;
  final VoidCallback onSwipeRight;

  const HelpSelectorPage({this.onSwipeLeft, this.onSwipeRight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("What do you want to do?")),
      ),
      body: Center(
        child: Draggable(
          onDragEnd: (drag) {
            if (drag.offset.dx.abs() > 30) {
              var isDragRight = drag.offset.dx > 0;

              if (isDragRight) {
                onSwipeRight();
              } else {
                onSwipeLeft();
              }
            }
          },
          childWhenDragging: Container(),
          feedback: _buildCard(),
          child: _buildCard(),
        ),
      ),
    );
  }

  Card _buildCard() {
    return Card(
      elevation: 12,
      color: Colors.lightBlueAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
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
