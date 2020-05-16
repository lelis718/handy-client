import 'package:flutter_test/flutter_test.dart';
import 'package:handyclientapp/main.dart';
import 'package:handyclientapp/pages/home/home.dart';

void main() {
  group('Main Widget', () {
    testWidgets('Ensure that HandyTheme is loaded ',
        (WidgetTester tester) async {
      //Act
      await tester.pumpWidget(HandyClient());
      //Assert
      expect(find.byType(HandyThemeWidget), findsOneWidget);
    });
  });
}
