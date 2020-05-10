import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/pages/handy_theme/handy_theme.dart';

import '../navigation.dart';

class NavigationWidget extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  final Map<String, WidgetBuilder> routes;

  NavigationWidget({Key key, this.routes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigationBloc, NavigationState>(
      listener: (context, state) {
        if (state is NavigationChanged) {
          print("Changing route to ${state.route}");
          _navigatorKey.currentState.pushNamed(state.route);
        } else if (state is NavigationPop &&
            _navigatorKey.currentState.canPop()) {
          _navigatorKey.currentState.pop();
        }
      },
      child: HandyThemeWidget(
        navigatorKey: _navigatorKey,
        initialRoute: Routes.home,
        routes: routes,
      ),
    );
  }
}
