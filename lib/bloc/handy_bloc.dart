// import 'dart:async';
// import 'dart:html';

// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:handyclientapp/models/models.dart';
// import 'package:handyclientapp/services/location_service.dart';
// import 'package:handyclientapp/services/services.dart';

// part 'handy_event.dart';
// part 'handy_state.dart';

// class HandyBloc extends Bloc<HandyEvent, HandyState> {
//   final DeviceInfoService deviceInfoService;
//   final LocationService locationService;
//   final HelpService helpService;
//   final IntroService introService;
//   DeviceInfo _deviceInfo;

//   HandyBloc({this.deviceInfoService, this.helpService, this.introService, this.locationService});

//   @override
//   HandyState get initialState => HandyInitializingState(secondsToFinish: 3);

//   @override
//   Stream<HandyState> mapEventToState(
//     HandyEvent event,
//   ) async* {
//     if (event is HandyInitializingEvent) {
//       yield HandyInitializingState();
//     }

//     if (event is HandyInitializedEvent) {
//       final deviceInfo = await this._getDeviceInfo();
//       if (deviceInfo.hasLoggedIn) {
//         yield HandyLoggedInState();
//       } else {
//         final cardsInfo = this.introService.getCards();
//         yield HandyLoggedOutState(cards: cardsInfo);
//       }
//     }

//     if (event is WantToHelpEvent) {
//       yield LoadState();
//       final userId = (await this._getDeviceInfo()).uuid;
//       final helpRequests = await helpService.getOtherHelpRequests(userId);
//       yield WantToHelpState(helpRequests: helpRequests);
//     }

//     if (event is NeedHelpEvent) {
//       final deviceInfo = await deviceInfoService.getDeviceInfo();
//       var locationAvailable = await locationService.isLocationAvailable();
      
//       if(!locationAvailable) {
//         yield RequestLocationState(successEvent: NeedHelpEvent(), errorEvent: NeedHelpEvent());
//       }

      


//       yield NeedHelpState(deviceInfo: deviceInfo);
//     }

//     if (event is SendRequestEvent) {
//       final isSuccess = await helpService.askHelp(event.helpRequest);
//       yield RequestSentState(isSuccess: isSuccess);
//     }

//     if (event is StartChatEvent) {
//       final messages = helpService.getChatMessages();
//       final deviceInfo = await this._getDeviceInfo();
//       yield StartChatState(
//           help: event.help, messages: messages, deviceInfo: deviceInfo);
//     }

//     if (event is MyRequestsEvent) {
//       yield LoadState();
//       final userId = (await this._getDeviceInfo()).uuid;
//       final myHelpRequests = await helpService.getMyHelpRequests(userId);
//       yield MyRequestsState(helpRequests: myHelpRequests);
//     }

//   }

//   Future<DeviceInfo> _getDeviceInfo() async {
//     if (_deviceInfo == null || _deviceInfo.hasLoggedIn == false) {
//       _deviceInfo = await deviceInfoService.getDeviceInfo();
//     }
//     return _deviceInfo;
//   }
// }
