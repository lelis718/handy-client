import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/pages/navigation/navigation.dart';
import 'package:handyclientapp/pages/shared/shared.dart';

import '../chat.dart';

class ChatWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        if (state is ChatStartState) {
          return ChatPage(
            help: state.help,
            messages: state.messages,
            deviceInfo: state.deviceInfo,
            onReturning: () {
              context.bloc<NavigationBloc>().add(
                    NavigationGoToPageEvent(
                      page: Routes.helpDetail,
                      args: state.help,
                    ),
                  );
            },
            onSendMessage: (message) {
              context.bloc<ChatBloc>().add(ChatSendMessageEvent());
            },
          );
        }
        return Loading(textToDisplay:"Loading...");
      },
    );
  }
}
