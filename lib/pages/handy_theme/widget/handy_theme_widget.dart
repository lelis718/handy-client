import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/pages/navigation/navigation.dart';

import '../handy_theme.dart';

class HandyThemeWidget extends StatelessWidget {
  final Map<String, WidgetBuilder> routes;
  final String initialRoute;
  HandyThemeWidget({this.routes, this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HandyThemeBloc, HandyThemeState>(
      builder: (context, state) {
        String title = "Handy!";
        if (state is HandyThemeTitleUpdatedState) {
          title = state.title;
        }
        return Scaffold(
          appBar: AppBar(title: Text(title)),
          body: NavigationWidget(
            initialRoute: this.initialRoute,
            routes: routes,
          ),
          bottomNavigationBar: Text("Aqui vai a barra de navegação"),
        );
      },
    );
  }
}
