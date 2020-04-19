import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/bloc/handy_bloc.dart';
import 'package:handyclientapp/pages/my_requests/my_requests_page.dart';
import 'package:handyclientapp/pages/need_help/request_sucess_confirmation.dart';
import 'package:handyclientapp/pages/widgets/loading.dart';
import 'package:handyclientapp/service_locator.dart';

import 'pages/pages.dart';

void main() {
  setupServiceLocator();
  runApp(HandyClient());
}

class HandyClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (BuildContext context) => HandyBloc(),
        child: BlocBuilder<HandyBloc, HandyState>(builder: (context, state) {
          if (state is HandyInitializingState) {
            return SplashPage(
              onFinish: () {
                context.bloc<HandyBloc>().add(HandyInitializedEvent());
              },
            );
          }

          if (state is LoadState) {
            return Loading();
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
              onHelpSomeoneTap: (){
                context.bloc<HandyBloc>().add(WantToHelpEvent());
              },
              onMyRequestsTap: (){
                context.bloc<HandyBloc>().add(MyRequestsEvent());
              },
              onRequestHelpTap: (){
                context.bloc<HandyBloc>().add(NeedHelpEvent());
              },
            );
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

          if (state is MyRequestsState) {
            return MyRequestsPage(helpRequests: state.helpRequests );
          }          
        }),
      ),
    );
  }
}
