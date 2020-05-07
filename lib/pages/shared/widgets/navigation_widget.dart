import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/bloc/navigation/navigation.dart';
import 'package:handyclientapp/models/models.dart';

import '../../pages.dart';

class NavigationWidget extends StatelessWidget {
  final NavigationBloc navigationBloc;
  NavigationWidget({this.navigationBloc});

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
        return Container();
      }),
    );
  }
}