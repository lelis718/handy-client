import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/bloc/handy_bloc.dart';
import 'package:handyclientapp/pages/need_help/request_sucess_confirmation.dart';
import 'package:handyclientapp/pages/widget/loading.dart';
import 'package:handyclientapp/service_locator.dart';

import 'pages/pages.dart';
import 'services/services.dart';

void main() {
  setupServiceLocator();
  runApp(
    HandyClient(
      handyBloc: HandyBloc(
        deviceInfoService: locator<DeviceInfoService>(),
        helpService: locator<HelpService>(),
        introService: locator<IntroService>(),
      ),
    ),
  );
}

class HandyClient extends StatelessWidget {
  final HandyBloc handyBloc;

  HandyClient({this.handyBloc});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (BuildContext context) => handyBloc,
        child: BlocBuilder<HandyBloc, HandyState>(builder: (context, state) {
          if (state is HandyInitializingState) {
            return SplashPage(
              secondsToFinish: state.secondsToFinish,
              onFinish: () {
                context.bloc<HandyBloc>().add(HandyInitializedEvent());
              },
            );
          }

          if (state is HandyLoggedOutState) {
            return IntroPage(
              cardsInfo: state.cards,
              onFinishCards: () {
                context.bloc<HandyBloc>().add(HandyInitializedEvent());
              },
            );
          }

          if (state is HandyLoggedInState) {
            return HelpSelectorPage(
              onSwipeLeft: () {
                context.bloc<HandyBloc>().add(NeedHelpEvent());
              },
              onSwipeRight: () {
                context.bloc<HandyBloc>().add(WantToHelpEvent());
              },
            );
          }

          if (state is LoadState) {
            return Loading();
          }

          if (state is WantToHelpState) {
            return HelpListPage(
              helpRequests: state.helpRequests,
              onHelp: () {
                context.bloc<HandyBloc>().add(StartChatEvent());
              },
            );
          }

          if (state is NeedHelpState) {
            return NeedHelpPage(
              deviceInfo: state.deviceInfo,
              onReturning: () {
                context.bloc<HandyBloc>().add(HandyInitializedEvent());
              },
              onSubmit: (helpRequest) {
                context
                    .bloc<HandyBloc>()
                    .add(SendRequestEvent(helpRequest: helpRequest));
              },
            );
          }

          if (state is RequestSentState) {
            if (state.isSuccess) {
              return RequestSucessConfirmation(
                onClose: () {
                  context.bloc<HandyBloc>().add(HandyInitializedEvent());
                },
              );
            }
          }

          if (state is StartChatState) {
            return ChatPage(
              onReturning: () {
                context.bloc<HandyBloc>().add(HandyInitializedEvent());
              },
            );
          }

          return Container();
        }),
      ),
    );
  }
}
