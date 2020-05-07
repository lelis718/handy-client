
import 'package:equatable/equatable.dart';
import 'package:handyclientapp/models/models.dart';


abstract class IntroState extends Equatable {
  const IntroState();
}

class LoadingCards extends IntroState{
  final int secondsToFinish;
  const LoadingCards({this.secondsToFinish = 0});

  @override
  List get props => [secondsToFinish];
}

class CardsLoaded extends IntroState{
 final List<CardInfo> cards;

  CardsLoaded({this.cards});

  @override
  List get props => [cards];
}
