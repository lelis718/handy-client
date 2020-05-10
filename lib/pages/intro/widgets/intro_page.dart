import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/pages/handy_theme/handy_theme.dart';
import 'package:handyclientapp/pages/navigation/navigation.dart';
import 'package:handyclientapp/pages/shared/shared.dart';

import '../intro.dart';

class IntroPage extends StatelessWidget {
  IntroPage();

  @override
  Widget build(BuildContext context) {
    context
        .bloc<HandyThemeBloc>()
        .add(HandyThemeUpdateTitleEvent(title: "Welcome to Handy!"));

    return BlocBuilder<IntroBloc, IntroState>(
      builder: (context, state) {
        print("state changed $state");

        if (state is IntroInitializeState) {
          print("Dispatching Event IntroCardsEvent");
          context.bloc<IntroBloc>().add(IntroLoadCardsEvent());
        }

        if (state is IntroCardsLoadedState) {
          print("Loading cards (${state.cards.length})");
          return Container(
            color: Colors.white,
            child: Center(
              child: IntroCardList(
                cards: state.cards,
                onSwipeCard: (int cardIndex) {
                  context
                      .bloc<IntroBloc>()
                      .add(IntroRemoveCardEvent(cardIndex: cardIndex));
                },
              ),
            ),
          );
        }
        if (state is IntroCardsEndedState) {
          context
              .bloc<NavigationBloc>()
              .add(NavigationGoToPageEvent(page: Routes.helpSelector));
        }
        return Loading(textToDisplay: "Loading...");
      },
    );
  }
}
