import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../navigation.dart';

class NavigationWidget extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  final String initialRoute;
  final Map<String, WidgetBuilder> routes;

  NavigationWidget({Key key, this.routes, this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigationBloc, NavigationState>(
      listener: (context, state) {
        if (state is NavigationChangedState) {
          print("Changing route to ${state.route}");
          _navigatorKey.currentState.pushNamed(state.route);
        }
        if (state is NavigationPoppedState) {
          if (_navigatorKey.currentState.canPop()) {
            _navigatorKey.currentState.pop();
          }
        }
      },
      child:Navigator(
          key: _navigatorKey,
          initialRoute: this.initialRoute,
          onGenerateRoute: (RouteSettings settings) {
            return MaterialPageRoute(
              builder: (context) => routes[settings.name](context),
              settings: settings,
            );
          },
      )
    );
  }
}
