
import 'package:get_it/get_it.dart';
import 'package:handyclientapp/services/device_info_service.dart';

GetIt locator = GetIt.instance;

setupServiceLocator() {
  locator.registerLazySingleton<DeviceInfoService>(() => DeviceInfoServiceDefault());
}