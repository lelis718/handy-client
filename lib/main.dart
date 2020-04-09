import 'package:flutter/material.dart';

import 'pages/pages.dart';

void main() => runApp(HandyClient());

class HandyClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Handy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPage(),
        '/intro': (context) => IntroPage(title: "Handy"),
        '/app': (context) => HelpSelectorPage(title: "What do you want to do?"),
        '/giveHandList': (context) => GiveHandList(),
        '/needHelp': (context) => NeedHelp()
      },
    );
  }
}
