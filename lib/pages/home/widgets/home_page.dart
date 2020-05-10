import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/pages/navigation/navigation.dart';
import 'package:handyclientapp/pages/shared/shared.dart';

import '../home.dart';

class HomePage extends StatelessWidget {
  HomePage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeInitializeState) {
          BlocProvider.of<HomeBloc>(context).add(
            HomeInitializeEvent(),
          );
        } else if (state is HomeIntroState) {
          BlocProvider.of<NavigationBloc>(context).add(
            NavigationGoToPageEvent(
              page: Routes.intro,
            ),
          );
        } else if (state is HomeHelpSelectState) {
          BlocProvider.of<NavigationBloc>(context).add(
            NavigationGoToPageEvent(
              page: Routes.helpSelector,
            ),
          );
        }
        return Loading(textToDisplay: "loading (home)...");
      },
    );
  }
}
