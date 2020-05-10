import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/services/services.dart';

import '../chat.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final HelpService helpService;
  final DeviceInfoService deviceInfoService;

  ChatBloc({this.helpService, this.deviceInfoService});

  @override
  ChatState get initialState => InitializeState();

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is StartChatEvent) {
      final messages = await helpService.getChatMessages();
      final deviceInfo = await this.deviceInfoService.getDeviceInfo();
      yield StartChatState(
          help: event.help, messages: messages, deviceInfo: deviceInfo);
    }
  }
}
