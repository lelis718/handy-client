import 'package:flutter_udid/flutter_udid.dart';
import 'package:handyclientapp/model/device_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class DeviceInfoService {
  Future<DeviceInfo> getDeviceInfo();
}

class DeviceInfoServiceDefault extends DeviceInfoService {
  
  @override
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
