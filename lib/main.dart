import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/bloc/intro/intro_event.dart';
import 'package:handyclientapp/bloc/navigation/navigation_state.dart';
import 'package:handyclientapp/service_locator.dart';

import 'bloc/intro/intro_bloc.dart';
import 'bloc/navigation/navigation_bloc.dart';
import 'models/pages.dart';
import 'pages/pages.dart';
import 'services/services.dart';

void main() {
  setupServiceLocator();
  runApp(

    HandyClient(
        navigationBloc:
            NavigationBloc(deviceInfoService: locator<DeviceInfoService>())),
  );
}


class HandyClient extends StatelessWidget {
  final NavigationBloc navigationBloc;
  HandyClient({this.navigationBloc});

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: navigationBloc,
      listener: (context, state) {
        if (state is PageSuccess) {
          Navigator.of(context).pushNamed(HandyPageRoute.mapTo(state.pageName));
        }
      },
      child: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
        if (state is SplashPageShow) {
          return SplashPage();
        }
        if (state is PageLoading) {
          return Loading();
        }
        if (state is PageError) {
          return Text(state.error);
        }
        return MaterialApp(
          routes: {
            HandyPageRoute.mapTo(Pages.Intro):(context){
              final bloc = BlocProvider.of<IntroBloc>(context);
              bloc.add(LoadCards());
              return IntroPage(introBloc: bloc);
            }
          },
        );
      }),
    );
  }
}

/*
Old code

    MaterialApp(
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
                context.bloc<HandyBloc>().add(WantToHelpEvent());
              },
              onSwipeRight: () {
                context.bloc<HandyBloc>().add(NeedHelpEvent());
              },
              onRequestHelpTap: () {
                context.bloc<HandyBloc>().add(NeedHelpEvent());
              },
              onMyRequestsTap: () {
                context.bloc<HandyBloc>().add(MyRequestsEvent());
              },
              onHelpSomeoneTap: () {
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
              onHelp: (help) {
                context.bloc<HandyBloc>().add(StartChatEvent(help: help));
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
              help: state.help,
              messages: state.messages,
              deviceInfo: state.deviceInfo,
              onReturning: () {
                context.bloc<HandyBloc>().add(HandyInitializedEvent());
              },
              onSendMessage: (message) {
                context.bloc<HandyBloc>().add(SendChatMessageEvent());
              },
            );
          }

          if (state is MyRequestsState) {
            return MyRequestsPage(helpRequests: state.helpRequests);
          }
        
          return Container();
        }),
      ),
    );
  }
}
*/
