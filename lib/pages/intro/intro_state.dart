import 'package:equatable/equatable.dart';
import 'package:handyclientapp/models/models.dart';

class IntroState extends Equatable {
  final List<CardInfo> cards;
  const IntroState({this.cards});

  @override
  List<Object> get props => [cards];
}

class LoadingCards extends IntroState {
  LoadingCards() : super(cards:null);
}

class CardsLoaded extends IntroState {
  CardsLoaded(List<CardInfo> cards) : super(cards:cards);

}
class CardsEnded extends IntroState{
    CardsEnded() : super(cards:null);
}
