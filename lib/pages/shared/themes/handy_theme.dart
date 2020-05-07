
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HandyTheme extends StatelessWidget{
  final String title;
  final Widget child;

  HandyTheme({this.title, this.child});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(this.title)
          ),
      ),
      body: Column(
        children: <Widget>[
          child,
          Text("Aqui vão os botoes")
        ],
      )
    );
  }

}
