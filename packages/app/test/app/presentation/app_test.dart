import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:school_manager/app/app.dart';
import 'package:school_manager/routing/routing.dart';

void main() {
  testWidgets(
    '''

GIVEN an app
AND an app router
WHEN the app is built
THEN the counter screen should be shown
''',
    (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: const MyApp(),
        ),
      );
      await tester.pumpAndSettle();
      final homeScreenFinder = find.byType(CounterScreen);
      expect(homeScreenFinder, findsOneWidget);
    },
  );
}
