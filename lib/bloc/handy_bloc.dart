import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:handyclientapp/models/models.dart';
import 'package:handyclientapp/services/services.dart';

part 'handy_event.dart';
part 'handy_state.dart';

class HandyBloc extends Bloc<HandyEvent, HandyState> {
  final DeviceInfoService deviceInfoService;
  final HelpService helpService;
  final IntroService introService;

  HandyBloc({this.deviceInfoService, this.helpService, this.introService});

  @override
  HandyState get initialState => HandyInitializingState(secondsToFinish: 3);

  @override
  Stream<HandyState> mapEventToState(
    HandyEvent event,
  ) async* {
    if (event is HandyInitializingEvent) {
      yield HandyInitializingState();
    }

    if (event is HandyInitializedEvent) {
      final deviceInfo = await deviceInfoService.getDeviceInfo();
      if (deviceInfo.hasLoggedIn) {
        yield HandyLoggedInState();
      } else {
        final cardsInfo = this.introService.getCards();
        yield HandyLoggedOutState(cards: cardsInfo);
      }
    }

    if (event is WantToHelpEvent) {
      yield LoadState();
      final helpRequests = await helpService.getHelp();
      yield WantToHelpState(helpRequests: helpRequests);
    }

    if (event is NeedHelpEvent) {
      final deviceInfo = await deviceInfoService.getDeviceInfo();
      yield NeedHelpState(deviceInfo: deviceInfo);
    }

    if (event is SendRequestEvent) {
      final isSuccess = await helpService.askHelp(event.helpRequest);
      yield RequestSentState(isSuccess: isSuccess);
    }

    if (event is StartChatEvent) {
      yield StartChatState();
    }
  }
}
