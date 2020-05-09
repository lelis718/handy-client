import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages.dart';
import 'need_help.dart';
import 'wanna_help.dart';

class HelpSelectorPage extends StatelessWidget {

  const HelpSelectorPage();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HandyThemeBloc>(context).add(HandyThemeUpdateTitle(title:"What do you want to do?"));
    
    return Container(
        color: Colors.white,
        child: Center(
          child:Draggable(
                onDragEnd: (drag) {
                  if (drag.offset.dx.abs() > 30) {
                    var isDragRight = drag.offset.dx > 0;
                    if (isDragRight) {
                      //BlocProvider.of...
                      //onSwipeRight();
                    } else {
                      //onSwipeLeft();
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
            Expanded(child: NeedHelp()),
            Expanded(child: WannaHelp()),
          ],
        ),
      ),
    );
  }
}
