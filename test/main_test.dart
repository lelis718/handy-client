

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:handyclientapp/main.dart';
import 'package:handyclientapp/main_bloc.dart';
import 'package:handyclientapp/models/models.dart';
import 'package:handyclientapp/pages/pages.dart';
import 'package:mockito/mockito.dart';

class MainBlocMock extends MockBloc<MainEvent, MainState>
    implements MainBloc {}
void main() {
  MainBloc bloc;

  setUp(() {
    bloc = MainBlocMock();
  });

  tearDown(() {
    bloc.close();
  });

  group('Main Bloc', () {
    MainBloc mainBloc;
    setUp(() {
      mainBloc = MainBloc();
    });

    tearDown(() {
      mainBloc.close();
    });

    test('Initial state sets default navigation to home', () {
      expect(
        mainBloc.initialState,
        NavigationChanged(PageRoutes.home),
      );
    });
    blocTest(
      'NavigateToPage event sets the state to NavigationChanged with the same route',
      build: () {
        return mainBloc;
      },
      act: (bloc) => bloc.add(NavigateToPage(page: PageRoutes.home)),
      expect: [
        NavigationChanged(PageRoutes.home)
      ],
    );
    blocTest(
      'NavigationPop evet sets the NavigationPopped State',
      build: () {
        return mainBloc;
      },
      act: (bloc) => bloc.add(NavigationPop()),
      expect: [
        NavigationPopped()
      ],
    );

  });
 group('Main Widget', () {
    testWidgets('Ensure that navigation is home at application starts ',
        (WidgetTester tester) async {
      //Arrange
      when(bloc.state).thenAnswer((_) => NavigationChanged(PageRoutes.home));

      //Act
      await tester.pumpWidget(HandyClient());
      //Assert
      expect(find.byType(HomePage), findsOneWidget);
    });
  });  
}