import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:school_manager/counter/counter.dart';

import '../../helpers/helpers.dart';

class _FakeCounter extends Counter {
  _FakeCounter({
    required int initialValue,
  }) : _initialValue = initialValue;

  final int _initialValue;

  @override
  int build() => _initialValue;
}

void main() {
  {
    final localizationVariant = LocalizationVariant.withCommonSelector(
      localizedTextSelector: (l10n) => l10n.counterPushTimesMessage(0),
      partialCases: {
        const (
          Locale('en'),
          'You have not pushed the button yet.',
        ),
        const (
          Locale('es'),
          // cspell:disable-next-line
          'Aún no has pulsado el botón.',
        ),
      },
    );

    testExhaustiveLocalizationVariant(
      '''

GIVEN a localization variant
AND a counter body
├─ THAT has a count of 0
WHEN testing the counter body
THEN all supported locales should be considered
''',
      localizationVariant,
    );

    testLocalizedWidget(
      '''

GIVEN a counter body
├─ THAT has a count of 0
WHEN it is displayed
THEN the body should include the localized message
''',
      ProviderScope(
        overrides: [
          counterPod.overrideWith(
            () => _FakeCounter(initialValue: 0),
          ),
        ],
        child: const CounterBody(),
      ),
      ancestorFinder: find.byType(PushCountMessage),
      variant: localizationVariant,
    );
  }

  {
    final localizationVariant = LocalizationVariant.withCommonSelector(
      localizedTextSelector: (l10n) => l10n.counterPushTimesMessage(1),
      partialCases: {
        const (
          Locale('en'),
          'You have pushed the button one time.',
        ),
        const (
          Locale('es'),
          // cspell:disable-next-line
          'Has pulsado el botón una vez.',
        ),
      },
    );

    testExhaustiveLocalizationVariant(
      '''

GIVEN a localization variant
AND a counter body
├─ THAT has a count of 1
WHEN testing the counter body
THEN all supported locales should be considered
''',
      localizationVariant,
    );

    testLocalizedWidget(
      '''

GIVEN a counter body
├─ THAT has a count of 1
WHEN it is displayed
THEN the body should include the localized message
''',
      ProviderScope(
        overrides: [
          counterPod.overrideWith(
            () => _FakeCounter(initialValue: 1),
          ),
        ],
        child: const CounterBody(),
      ),
      ancestorFinder: find.byType(PushCountMessage),
      variant: localizationVariant,
    );
  }

  {
    final localizationVariant = LocalizationVariant.withCommonSelector(
      localizedTextSelector: (l10n) => l10n.counterPushTimesMessage(8),
      partialCases: {
        const (
          Locale('en'),
          'You have pushed the button 8 times.',
        ),
        const (
          Locale('es'),
          // cspell:disable-next-line
          'Has pulsado el botón 8 veces.',
        ),
      },
    );

    testExhaustiveLocalizationVariant(
      '''

GIVEN a localization variant
AND a counter body
├─ THAT has a count of 8
WHEN testing the counter body
THEN all supported locales should be considered
''',
      localizationVariant,
    );

    testLocalizedWidget(
      '''

GIVEN a counter body
├─ THAT has a count of 8
WHEN it is displayed
THEN the body should include the localized message
''',
      ProviderScope(
        overrides: [
          counterPod.overrideWith(
            () => _FakeCounter(initialValue: 8),
          ),
        ],
        child: const CounterBody(),
      ),
      ancestorFinder: find.byType(PushCountMessage),
      variant: localizationVariant,
    );
  }
}
