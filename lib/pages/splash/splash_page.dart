import 'dart:async';
import 'package:flutter/material.dart';
import 'package:handyclientapp/app_routes.dart';
import 'package:handyclientapp/service_locator.dart';
import 'package:handyclientapp/services/device_info_service.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  
  DeviceInfoService _deviceInfoService = locator<DeviceInfoService>();
  
  @override
  initState() {
    super.initState();
    startTime();
  }

  route() {
    _deviceInfoService.getDeviceInfo().then(
      (deviceInfo) {
        var nextPage;
        if (!deviceInfo.hasLoggedIn) {
          nextPage = AppRoutes.intro;
        } else {
          nextPage = AppRoutes.helpSelector;
        }

        Navigator.pushReplacementNamed(context, nextPage);
      },
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  child: CircularProgressIndicator(),
                  width: 60,
                  height: 60,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'Initializing...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 16,
                      color: Colors.lightBlueAccent,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
