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
        if (state is HomeStateInitialize) {
          BlocProvider.of<HomeBloc>(context).add(
            HomeEventInitialize(),
          );
        } else if (state is HomeStateIntro) {
          BlocProvider.of<NavigationBloc>(context).add(
            NavigateToPage(
              page: Routes.intro,
            ),
          );
        } else if (state is HomeStateHelpSelect) {
          BlocProvider.of<NavigationBloc>(context).add(
            NavigateToPage(
              page: Routes.helpSelector,
            ),
          );
        }
        return Loading(textToDisplay: "loading...");
      },
    );
  }
}
