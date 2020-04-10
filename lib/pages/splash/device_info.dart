import 'package:flutter_udid/flutter_udid.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceInfo {
  String uuid;
  bool hasLoggedIn;

  DeviceInfo({
    String uuid,
    bool hasLoggedIn,
  }) {
    this.uuid = uuid;
    this.hasLoggedIn = hasLoggedIn;
  }

  Future<DeviceInfo> getDeviceInfo() async {
    String uniqueId = await FlutterUdid.udid;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasLoggedIn =
        prefs.containsKey("hasLoggedIn") ? prefs.getBool("hasLoggedIn") : false;

    if (!hasLoggedIn) {
      prefs.setBool("hasLoggedIn", true);
    }

    return DeviceInfo(uuid: uniqueId, hasLoggedIn: hasLoggedIn);
  }
}
