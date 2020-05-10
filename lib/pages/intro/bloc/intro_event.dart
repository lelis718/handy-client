
import 'package:equatable/equatable.dart';

abstract class IntroEvent extends Equatable {
  const IntroEvent();
}

class LoadCards extends IntroEvent{
  @override
  List<Object> get props => null;
}
class RemoveCard extends IntroEvent{

  final int cardIndex;
  RemoveCard({this.cardIndex});

  @override
  List<Object> get props => [cardIndex];

}


