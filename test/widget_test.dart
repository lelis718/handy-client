import 'package:flutter_test/flutter_test.dart';
import 'package:handyclientapp/pages/intro/widgets/intro_card.dart';
import 'package:handyclientapp/pages/pages.dart';

import '../lib/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(HandyClient());

    expect(find.byType(IntroPage), findsOneWidget);
    expect(find.byType(IntroCard), findsNWidgets(5));
  });
}
