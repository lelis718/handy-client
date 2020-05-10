import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/service_locator.dart';

import 'pages/handy_theme/handy_theme.dart';
import 'pages/navigation/navigation.dart';
import 'pages/pages.dart';
import 'services/services.dart';

void main() {
  setupServiceLocator();
  runApp(HandyClient());
}

class HandyClient extends StatelessWidget {
  final routes = {
    Routes.home: (context) => HomePage(),
    Routes.intro: (context) => IntroPage(),
  };

  HandyClient();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider<HandyThemeBloc>(
          create: (context) => HandyThemeBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(
            deviceInfoService: locator<DeviceInfoService>(),
          ),
        ),
        BlocProvider<IntroBloc>(
          create: (context) => IntroBloc(
            introService: locator<IntroService>(),
          ),
        ),
      ],
      child: MaterialApp(
        home: NavigationWidget(
          routes: routes,
        ),
      ),
    );
  }
}