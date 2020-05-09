import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/modules/handy_theme/handy_theme_event.dart';
import 'package:handyclientapp/modules/handy_theme/handy_theme_state.dart';

class HandyThemeBloc extends Bloc<HandyThemeEvent, HandyThemeState>{
  @override
  HandyThemeState get initialState => HandyThemeInitialize();

  @override
  Stream<HandyThemeState> mapEventToState(HandyThemeEvent event) async* {
    if(event is HandyThemeUpdateTitle){
      yield HandyThemeTitleUpdated(title: event.title);
    }
  }
  
}