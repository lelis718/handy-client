import 'package:equatable/equatable.dart';

import '../intro.dart';

abstract class IntroState extends Equatable {
  const IntroState();
}

class Initialize extends IntroState {
  @override
  List<Object> get props => null;
}

class LoadingCards extends IntroState{
  @override
  List<Object> get props => null;
}
class CardsLoaded extends IntroState {
  final List<CardInfo> cards;

  const CardsLoaded({this.cards});

  @override
  List<Object> get props => null;
}
class CardsEnded extends IntroState{
  @override
  List<Object> get props => null;
}
