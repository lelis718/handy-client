import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:handyclientapp/models/pages_enum.dart';
import 'package:handyclientapp/services/device_info_service.dart';

import 'navigation_event.dart';
import 'navigation_state.dart';


class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {

  final DeviceInfoService deviceInfoService;
  NavigationBloc({@required this.deviceInfoService});

  @override
  NavigationState get initialState(){
    return SplashPageShow();
  }

  @override
  Stream<NavigationState> mapEventToState(
    NavigationEvent event,
  ) async* {
      yield PageLoading();

      if(event is NavigateToHome){
        final deviceInfo = await deviceInfoService.getDeviceInfo();
        if (deviceInfo.hasLoggedIn) {
          yield PageSuccess(Pages.HelpSelector);
        } else {
          yield PageSuccess(Pages.Intro);
        }
      }

      if(event is NavigateToPage){
        yield PageSuccess(event.page);
      }

      yield PageError("Page not found");
  }
}
