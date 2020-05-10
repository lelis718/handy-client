import 'package:equatable/equatable.dart';
import 'package:handyclientapp/pages/help_list/model/model.dart';

abstract class ChatEvent extends Equatable{
  const ChatEvent();
}
class SendChatMessageEvent extends ChatEvent{
  @override
  List<Object> get props => null;
}
class StartChatEvent extends ChatEvent{
  final Help help;

  StartChatEvent({this.help}); 
  @override
  List<Object> get props => [help];
}

