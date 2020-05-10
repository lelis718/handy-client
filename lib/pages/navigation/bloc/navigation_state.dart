import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable{
}
class NavigationChanged extends NavigationState{
  final String route;
  NavigationChanged(this.route);
  @override
  List<Object> get props => [route];
}
class NavigationPopped extends NavigationState{
  @override
  List<Object> get props => null;
}

