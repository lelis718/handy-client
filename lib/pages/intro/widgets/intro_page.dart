import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/main_bloc.dart';
import 'package:handyclientapp/models/models.dart';
import 'package:handyclientapp/pages/intro/intro.dart';
import 'package:handyclientapp/pages/pages.dart';
import 'package:handyclientapp/pages/shared/shared.dart';

import 'widgets.dart';


class IntroPage extends StatelessWidget {
  IntroPage();
 
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HandyThemeBloc>(context).add(HandyThemeUpdateTitle(title: "Welcome to Handy!"));
    return  BlocBuilder<IntroBloc, IntroState>(
      builder: (context, state) {
        print("state changed $state");
        if (state is Initialize) {
          BlocProvider.of<IntroBloc>(context).add(LoadCards());
        }        
        if (state is CardsLoaded) {
          print("Loading cards (${state.cards.length})");
          return Container(
            color: Colors.white,
            child: Center(
              child: IntroCardList(cards: state.cards, onSwipeCard: (int cardIndex){
                  BlocProvider.of<IntroBloc>(context).add(RemoveCard(cardIndex: cardIndex));
                },),
            ),
          );
        }
        if (state is CardsEnded) {
          BlocProvider.of<MainBloc>(context).add(NavigateToPage(page: PageRoutes.helpSelector));
        }            
        return Loading(textToDisplay: "Loading...");
      });
  }

 
}
