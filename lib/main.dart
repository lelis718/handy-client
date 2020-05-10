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
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final initialRoute = Routes.home;
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
        BlocProvider<HelpSelectorBloc>(
          create: (context) => HelpSelectorBloc(),
        ),
        BlocProvider<HelpListBloc>(
          create: (context) => HelpListBloc(
            deviceInfoService: locator<DeviceInfoService>(),
            helpService: locator<HelpService>(),
          ),
        ),
        BlocProvider<MyRequestsBloc>(
          create: (context) => MyRequestsBloc(
            deviceInfoService: locator<DeviceInfoService>(),
            helpService: locator<HelpService>(),
          ),
        ),
        BlocProvider<ChatBloc>(
          create: (context) => ChatBloc(
            deviceInfoService: locator<DeviceInfoService>(),
            helpService: locator<HelpService>(),
          ),
        ),
        BlocProvider<NeedHelpBloc>(
          create: (context) => NeedHelpBloc(
            deviceInfoService: locator<DeviceInfoService>(),
            helpService: locator<HelpService>(),
          ),
        ),

      ],
      child: MaterialApp(
        home: HandyThemeWidget(
          navigatorKey:navigatorKey,
          initialRoute: initialRoute,
          routes: routes,
        ),
      ),
    );
  }
}
