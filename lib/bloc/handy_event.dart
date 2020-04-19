part of 'handy_bloc.dart';

abstract class HandyEvent extends Equatable {
  const HandyEvent();
}

class HandyInitializingEvent extends HandyEvent {
  final int secondsToFinish;

  const HandyInitializingEvent({this.secondsToFinish = 0});

  @override
  List<Object> get props => null;
}

class HandyInitializedEvent extends HandyEvent {
  const HandyInitializedEvent();

  @override
  List<Object> get props => null;
}

class NeedHelpEvent extends HandyEvent {
  const NeedHelpEvent();

  @override
  List<Object> get props => null;
}

class WantToHelpEvent extends HandyEvent {
  const WantToHelpEvent();

  @override
  List<Object> get props => null;
}

class SendRequestEvent extends HandyEvent {
  final Help helpRequest;

  const SendRequestEvent({this.helpRequest});

  @override
  List<Object> get props => [helpRequest];
}

class StartChatEvent extends HandyEvent {
  @override
  List<Object> get props => null;
}
class MyRequestsEvent extends HandyEvent {
  const MyRequestsEvent();

  @override
  List<Object> get props => null;
}
