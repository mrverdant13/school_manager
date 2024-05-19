import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:school_manager/app/app.dart';
import 'package:school_manager/routing/routing.dart';

void main() {
  testWidgets(
    '''

GIVEN a routed app
├─ THAT starts with the counter path
WHEN the app starts
THEN the counter screen should be shown
''',
    (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            routerConfigPod.overrideWithValue(
              AppRouter().config(
                deepLinkBuilder: (_) => const DeepLink.path('/counter'),
              ),
            ),
          ],
          child: const MyApp(),
        ),
      );
      await tester.pumpAndSettle();
      final counterScreenFinder = find.byType(CounterScreen);
      expect(counterScreenFinder, findsOneWidget);
    },
  );
}
