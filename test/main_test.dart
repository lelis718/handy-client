

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:handyclientapp/bloc/navigation/navigation.dart';
import 'package:handyclientapp/main.dart';
import 'package:handyclientapp/models/pages_enum.dart';
import 'package:handyclientapp/pages/pages.dart';
import 'package:mockito/mockito.dart';

class NavigationBlocMock extends MockBloc<NavigationEvent, NavigationState>
    implements NavigationBloc {}

void main() {
  NavigationBloc bloc;

  setUp(() {
    bloc = NavigationBlocMock();
  });

  tearDown(() {
    bloc.close();
  });

  group('Main Widget', () {
    testWidgets('Shows splash page after initialization ',
        (WidgetTester tester) async {
      //Arrange
      when(bloc.state).thenAnswer((_) => SplashPageShow());

      //Act
      await tester.pumpWidget(HandyClient(navigationBloc: bloc));
      //Assert
      expect(find.byType(SplashPage), findsOneWidget);
      expect(find.text('Initializing...'), findsOneWidget);
    });
    testWidgets('Shows Intro Page ',
        (WidgetTester tester) async {
      //Arrange
      when(bloc.state).thenAnswer((_) => PageSuccess(Pages.Intro));

      //Act
      await tester.pumpWidget(HandyClient(navigationBloc: bloc));

      //Assert
      expect(find.byType(IntroPage), findsOneWidget);
      expect(find.byType(Positioned), findsOneWidget);
      expect(find.byType(Draggable), findsOneWidget);
      expect(find.text('Handy'), findsOneWidget);
    });


  });
}