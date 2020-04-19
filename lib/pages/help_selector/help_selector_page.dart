import 'package:flutter/material.dart';
import 'package:handyclientapp/pages/help_selector/widgets/action_footer.dart';
import 'widgets/widgets.dart';

class HelpSelectorPage extends StatelessWidget {
  final VoidCallback onSwipeLeft;
  final VoidCallback onSwipeRight;
  final VoidCallback onRequestHelpTap;
  final VoidCallback onMyRequestsTap;
  final VoidCallback onHelpSomeoneTap;

  const HelpSelectorPage({
    this.onSwipeLeft, 
    this.onSwipeRight,
    this.onRequestHelpTap,
    this.onMyRequestsTap,
    this.onHelpSomeoneTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("What do you want to do?")),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              Draggable(
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
              Padding(
                padding: const EdgeInsets.only(top:40),
                child: ActionFooter(
                  onHelpSomeone: onHelpSomeoneTap,
                  onMyRequests: onMyRequestsTap,
                  onRequestHelp: onRequestHelpTap
                ),
              ),
            ],
          ),
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
