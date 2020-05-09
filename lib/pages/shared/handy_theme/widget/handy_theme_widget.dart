import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../handy_theme.dart';

class HandyThemeWidget extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Map<String, WidgetBuilder> routes;
  final String initialRoute;
  HandyThemeWidget({this.navigatorKey, this.routes, this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HandyThemeBloc, HandyThemeState>(builder: (context, state) {
      
      String title = "Handy!";
      if (state is HandyThemeTitleUpdated) {
        title = state.title;
      }
      return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Navigator(
          key: navigatorKey,
          initialRoute: this.initialRoute,
          onGenerateRoute: (RouteSettings settings) {
            return MaterialPageRoute(
              builder: (context) => routes[settings.name](context),
              settings: settings,
            );
          },
        ),
        bottomNavigationBar: Text("Aqui vai a barra de navegação"),
      );
    });
  }
}
