import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:handyclientapp/app_routes.dart';
import 'package:handyclientapp/services/help_service.dart';
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(this.widget.title),
          ),
        ),
        body: Center(
          child: Draggable(
            onDragEnd: (drag) {
              if (drag.offset.dx.abs() > 30) {
                var isDragRight = drag.offset.dx > 0;

                Navigator.of(context).pushNamed(
                    isDragRight ? AppRoutes.giveHand : AppRoutes.needHelp);
              }
            },
            childWhenDragging: Container(),
            feedback: buildCard(),
            child: buildCard(),
          ),
        ),
      ),
    );
  }

  Card buildCard() {
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
