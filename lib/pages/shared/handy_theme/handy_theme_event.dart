import 'package:equatable/equatable.dart';

abstract class HandyThemeEvent extends Equatable{
  const HandyThemeEvent();
}

class HandyThemeUpdateTitle extends HandyThemeEvent{
  final String title;
  const HandyThemeUpdateTitle({this.title});
  @override
  List<Object> get props => [title];
}
