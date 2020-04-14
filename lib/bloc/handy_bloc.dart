import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:handyclientapp/model/card_info.dart';
import 'package:handyclientapp/model/device_info.dart';
import 'package:handyclientapp/model/help.dart';
import 'package:handyclientapp/services/services.dart';

import '../service_locator.dart';

part 'handy_event.dart';
part 'handy_state.dart';

class HandyBloc extends Bloc<HandyEvent, HandyState> {
  final _deviceInfoService = locator<DeviceInfoService>();
  final _helpService = locator<HelpService>();
  final _introService = locator<IntroService>();

  @override
  HandyState get initialState => HandyInitializingState();

  @override
  Stream<HandyState> mapEventToState(
    HandyEvent event,
  ) async* {
    if (event is HandyInitializingEvent) {
      HandyInitializingState();
    }

    if (event is HandyInitializedEvent) {
      final deviceInfo = await _deviceInfoService.getDeviceInfo();
      if (deviceInfo.hasLoggedIn) {
        yield HandyLoggedInState();
      } else {
        yield HandyLoggedOutState(cards: this._introService.getCards());
      }
    }

    if (event is WantToHelpEvent) {
      final helpRequests = await _helpService.getHelp();
      yield WantToHelpState(helpRequests: helpRequests);
    }

    if (event is NeedHelpEvent) {
      final deviceInfo = await _deviceInfoService.getDeviceInfo();
      yield NeedHelpState(deviceInfo: deviceInfo);
    }

    if (event is SendRequestEvent) {
      final isSuccess = await _helpService.askHelp(event.helpRequest);
      yield RequestSentState(isSuccess: isSuccess);
    }

    if (event is StartChatEvent) {
      yield StartChatState();
    }
  }
}
