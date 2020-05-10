import 'package:get_it/get_it.dart';
import 'pages/intro/intro.dart';
import 'services/services.dart';

GetIt locator = GetIt.instance;

setupServiceLocator() {
  locator.registerLazySingleton<DeviceInfoService>(
      () => DeviceInfoServiceDefault());
  locator.registerLazySingleton<HelpService>(() => HelpServiceDefault());
  locator.registerLazySingleton<IntroService>(() => IntroServiceDefault());
}
