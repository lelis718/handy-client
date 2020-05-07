import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:handyclientapp/bloc/intro/intro_event.dart';
import 'package:handyclientapp/bloc/intro/intro_state.dart';
import 'package:handyclientapp/services/services.dart';



class IntroBloc extends Bloc<IntroEvent, IntroState> {

  final IntroService introService;
  IntroBloc({@required this.introService});

  @override
  IntroState get initialState(){
    return LoadingCards();
  }

  @override
  Stream<IntroState> mapEventToState(
    IntroEvent event,
  ) async* {
      yield LoadingCards();

      if(event is LoadCards){
        final cards = introService.getCards();
        yield CardsLoaded(cards:cards);
      }
  }
}
