
import 'package:equatable/equatable.dart';
import 'package:handyclientapp/models/pages_enum.dart';

abstract class NavigationState extends Equatable {
}

class SplashPageShow extends NavigationState{
  @override
  List<Object> get props => null;
}

class PageLoading extends NavigationState{
  @override
  List<Object> get props => null;  
}

class PageSuccess extends NavigationState{
    final Pages pageName;
    PageSuccess(this.pageName);
  @override
  List<Object> get props => [pageName];
}
class PageError extends NavigationState{
    final String error;
    PageError(this.error);
  @override
  List<Object> get props => [error];
}
