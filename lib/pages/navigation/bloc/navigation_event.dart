
import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable{
  const NavigationEvent();
}
class NavigateToHome extends NavigationEvent{
  @override
  List<Object> get props => null;
}
class NavigateToPage extends NavigationEvent{
  final String page;
  final dynamic args;
  NavigateToPage({this.page, this.args});
  @override
  List<Object> get props => [page,args];
}
class NavigationPop extends NavigationEvent{
  @override
  List<Object> get props => null;
}
