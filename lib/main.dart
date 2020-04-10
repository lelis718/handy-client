import 'package:flutter/material.dart';

import 'app_routes.dart';
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
        AppRoutes.root: (context) => SplashPage(),
        AppRoutes.intro: (context) => IntroPage(title: "Handy"),
        AppRoutes.helpSelector: (context) =>
            HelpSelectorPage(title: "What do you want to do?"),
        AppRoutes.giveHand: (context) => GiveHandList(),
        AppRoutes.needHelp: (context) => NeedHelp()
      },
    );
  }
}
