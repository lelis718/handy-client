
import 'package:flutter_bloc/flutter_bloc.dart';

import '../navigation.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState>{
  
  NavigationBloc();

  @override
  NavigationState get initialState => NavigationChanged(Routes.home);

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
   if(event is NavigateToPage){
      yield NavigationChanged(event.page);

    } else if(event is NavigationPop){
      yield NavigationPopped();
    }   
  }
  
}