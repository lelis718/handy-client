
import 'package:equatable/equatable.dart';
import 'package:handyclientapp/models/pages_enum.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();
}

class NavigateToHome extends NavigationEvent{
  @override
  List<Object> get props => null;
}

class NavigateToPage extends NavigationEvent{
  final Pages page;
  NavigateToPage(this.page); 
  @override
  List<Object> get props => [page];
}

