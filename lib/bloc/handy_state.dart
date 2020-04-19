part of 'handy_bloc.dart';

abstract class HandyState extends Equatable {
  const HandyState();
}

class HandyInitializingState extends HandyState {
  @override
  List<Object> get props => [];
}

class HandyLoggedInState extends HandyState {
  @override
  List<Object> get props => [];
}

class HandyLoggedOutState extends HandyState {
  final List<CardInfo> cards;

  HandyLoggedOutState({this.cards});

  @override
  List<Object> get props => [cards];
}

class NeedHelpState extends HandyState {
  final DeviceInfo deviceInfo;

  const NeedHelpState({this.deviceInfo});
  @override
  List<Object> get props => [deviceInfo];
}

class WantToHelpState extends HandyState {
  final List<Help> helpRequests;

  const WantToHelpState({@required this.helpRequests})
      : assert(helpRequests != null);

  @override
  List<Object> get props => [helpRequests];
}

class RequestSentState extends HandyState {
  final bool isSuccess;

  const RequestSentState({this.isSuccess});

  @override
  List<Object> get props => [isSuccess];
}

class StartChatState extends HandyState {
  @override
  List<Object> get props => [];
}

class LoadState extends HandyState {
  @override
  List<Object> get props => [];
}
