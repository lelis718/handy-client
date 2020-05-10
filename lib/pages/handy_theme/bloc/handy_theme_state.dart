import 'package:equatable/equatable.dart';

abstract class HandyThemeState extends Equatable{
  const HandyThemeState();
}
class HandyThemeInitialize extends HandyThemeState{
  @override
  List<Object> get props => null;
}
class HandyThemeTitleUpdated extends HandyThemeState{
  final String title;
  const HandyThemeTitleUpdated({this.title});
  @override
  List<Object> get props => [title];
}
