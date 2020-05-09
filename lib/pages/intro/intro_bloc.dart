import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:handyclientapp/models/models.dart';
import 'package:handyclientapp/pages/intro/intro.dart';
import 'package:handyclientapp/services/services.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  final IntroService introService;

  IntroBloc({@required this.introService});

  @override
  IntroState get initialState {
    return Initialize();
  }

  @override
  Stream<IntroState> mapEventToState(
    IntroEvent event,
  ) async* {
    if (event is LoadCards) {
      
      yield LoadingCards();
      final List<CardInfo> cards = introService.resetAndGetCards();
      yield CardsLoaded(cards);
    
    } else if (event is RemoveCard) {
      
      yield LoadingCards();
      final List<CardInfo> cards =
          introService.removeAndGetCards(event.cardIndex);
      if (cards.length > 0) {
        print("Cards length now on ${cards.length}");
        yield CardsLoaded(cards);
      
      } else {
        yield CardsEnded();
      }
    }
  }
}
