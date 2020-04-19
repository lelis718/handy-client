import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:handyclientapp/bloc/handy_bloc.dart';
import 'package:handyclientapp/models/models.dart';
import 'package:handyclientapp/services/services.dart';
import 'package:mockito/mockito.dart';

class MockDeviceInfoService extends Mock implements DeviceInfoService {}

class MockHelpService extends Mock implements HelpService {}

class MockIntroService extends Mock implements IntroService {}

void main() {
  group('Handy bloc', () {
    HandyBloc handyBloc;
    MockDeviceInfoService deviceInfoService = MockDeviceInfoService();
    MockHelpService helpService = MockHelpService();
    MockIntroService introService = MockIntroService();

    setUp(() {
      handyBloc = HandyBloc(
        deviceInfoService: deviceInfoService,
        helpService: helpService,
        introService: introService,
      );
    });

    tearDown(() {
      handyBloc.close();
    });

    test('Initial state is Loading', () {
      expect(
        handyBloc.initialState,
        HandyInitializingState(secondsToFinish: 3),
      );
    });

    blocTest('Initialize the app with user logged in',
        build: () {
          when(deviceInfoService.getDeviceInfo()).thenAnswer(
            (_) => Future.value(
              DeviceInfo(
                hasLoggedIn: true,
              ),
            ),
          );
          return handyBloc;
        },
        act: (bloc) => bloc.add(HandyInitializedEvent()),
        expect: [HandyInitializingState(), HandyLoggedInState()]);
  });
}
