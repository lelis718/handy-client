import 'package:equatable/equatable.dart';

abstract class HelpSelectorEvent extends Equatable{
  const HelpSelectorEvent();
}

class InitializeEvent extends HelpSelectorEvent{
  @override
  List<Object> get props => null;
}