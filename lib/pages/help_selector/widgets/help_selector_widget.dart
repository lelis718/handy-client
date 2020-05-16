import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/navigation/navigation.dart';

import '../help_selector.dart';

class HelpSelectorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HelpSelectorBloc, HelpSelectorState>(
      builder: (context, state) {
        print("state changed $state");
        if (state is HelpSelectorHandyLoggedInState) {
          return HelpSelectorPage(
            onSwipeLeft: () {
              context
                  .bloc<NavigationBloc>()
                  .add(NavigationGoToPageEvent(page: Routes.needHelp));
            },
            onSwipeRight: () {
              context
                  .bloc<NavigationBloc>()
                  .add(NavigationGoToPageEvent(page: Routes.helpList));
            },
            onRequestHelpTap: () {
              context
                  .bloc<NavigationBloc>()
                  .add(NavigationGoToPageEvent(page: Routes.needHelp));
            },
            onMyRequestsTap: () {
              context
                  .bloc<NavigationBloc>()
                  .add(NavigationGoToPageEvent(page: Routes.myHelpRequests));
            },
            onHelpSomeoneTap: () {
              context
                  .bloc<NavigationBloc>()
                  .add(NavigationGoToPageEvent(page: Routes.helpList));
            },
          );
        }
        return Container();
      },
    );
  }
}
