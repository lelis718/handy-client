import 'package:equatable/equatable.dart';
import 'package:handyclientapp/models/models.dart';
import 'package:handyclientapp/pages/help_list/model/help.dart';

import '../chat.dart';

abstract class ChatState extends Equatable{
  const ChatState();
}

class InitializeState extends ChatState{
  @override
  List<Object> get props => null;
}

class StartChatState extends ChatState{

  final Help help;
  final DeviceInfo deviceInfo;
  final List<ChatMessage> messages;

  StartChatState({this.help, this.deviceInfo, this.messages});
  @override
  List<Object> get props => [help, deviceInfo, messages];
}

