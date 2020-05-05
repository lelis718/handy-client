part of 'handy_bloc.dart';

abstract class HandyState extends Equatable {
  const HandyState();
}

class HandyInitializingState extends HandyState {
  final int secondsToFinish;

  const HandyInitializingState({this.secondsToFinish = 0});

  @override
  List get props => [secondsToFinish];
}

class HandyLoggedInState extends HandyState {
  @override
  List get props => [];
}

class HandyLoggedOutState extends HandyState {
  final List<CardInfo> cards;

  HandyLoggedOutState({this.cards});

  @override
  List get props => [cards];
}

class NeedHelpState extends HandyState {
  final DeviceInfo deviceInfo;

  const NeedHelpState({this.deviceInfo});
  @override
  List get props => [deviceInfo];
}

class WantToHelpState extends HandyState {
  final List<Help> helpRequests;

  const WantToHelpState({@required this.helpRequests})
      : assert(helpRequests != null);

  @override
  List get props => [helpRequests];
}

class RequestSentState extends HandyState {
  final bool isSuccess;

  const RequestSentState({this.isSuccess});

  @override
  List get props => [isSuccess];
}

class StartChatState extends HandyState {
  final Help help;
  final List<ChatMessage> messages;
  final DeviceInfo deviceInfo;

  const StartChatState({this.help, this.messages, this.deviceInfo});

  @override
  List get props => [help, messages, deviceInfo];
}

class LoadState extends HandyState {
  @override
  List get props => null;
}

class MyRequestsState extends HandyState {
  final List<Help> helpRequests;

  const MyRequestsState({@required this.helpRequests})
      : assert(helpRequests != null);

  @override
  List<Object> get props => [helpRequests];
}

class RequestLocationState extends HandyState {
  @override
  List get props => [];

  final HandyEvent successEvent;
  final HandyEvent errorEvent;

  const RequestLocationState({@required this.successEvent, @required this.errorEvent})
      : assert(successEvent != null, errorEvent != null);
}