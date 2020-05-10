import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/pages/navigation/navigation.dart';

import '../help_selector.dart';

class HelpSelectorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HelpSelectorBloc, HelpSelectorState>(
      builder: (context, state) {

          if (state is HandyLoggedInState) {
            return HelpSelectorPage(
              onSwipeLeft: () {
                context.bloc<NavigationBloc>().add(NavigateToPage(page: Routes.helpList));
              },
              onSwipeRight: () {
                context.bloc<NavigationBloc>().add(NavigateToPage(page: Routes.needHelp));
              },
              onRequestHelpTap: () {
                context.bloc<NavigationBloc>().add(NavigateToPage(page: Routes.needHelp));
              },
              onMyRequestsTap: () {
                context.bloc<NavigationBloc>().add(NavigateToPage(page: Routes.myHelpRequests));
              },
              onHelpSomeoneTap: () {
                context.bloc<NavigationBloc>().add(NavigateToPage(page: Routes.helpList));
              },
            );
          }       
          return Container(); 
      },
    );
  }
}
