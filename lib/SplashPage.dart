import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatelessWidget {
  Future<DeviceInfo> getDeviceInfo() async {
    String uniqueId = await FlutterUdid.udid;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasLoggedIn =
        prefs.containsKey("hasLoggedIn") ? prefs.getBool("hasLoggedIn") : false;
    if (!hasLoggedIn) {
      prefs.setBool("hasLoggedIn", true);
    }
    return DeviceInfo(uniqueId, hasLoggedIn);
  }

  Widget preloader() {
    return Container(
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
              child: Text('Initializing...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 16,
                    color: Colors.lightBlueAccent,
                    fontStyle: FontStyle.normal,
                  )))
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    getDeviceInfo().then((deviceInfo) {
      if (!deviceInfo.hasLoggedIn) {
        //First time user access app
        Navigator.pushReplacementNamed(context, '/intro');
      } else {
        Navigator.pushReplacementNamed(context, '/app');
      }
    });
    return preloader();
  }
}

class DeviceInfo {
  String uuid;
  bool hasLoggedIn;
  DeviceInfo(String uuid, bool hasLoggedIn) {
    this.uuid = uuid;
    this.hasLoggedIn = hasLoggedIn;
  }
}
