import 'package:equatable/equatable.dart';

abstract class HelpListEvent extends Equatable{
  const HelpListEvent();
} 
class WantToHelpEvent extends HelpListEvent{
  @override
  List<Object> get props => null;
}

