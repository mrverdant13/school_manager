import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:school_manager/routing/routing.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test(
    '''

GIVEN a router config pod
WHEN the pod is built
THEN the config is injected
''',
    () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final routerConfig = container.read(routerConfigPod);
      expect(routerConfig, isA<RouterConfig<UrlState>>());
    },
  );

  test(
    '''

GIVEN a router
WHEN the router is built
THEN the router uses an adaptive route type
''',
    () {
      final router = AppRouter();
      expect(router.defaultRouteType, isA<AdaptiveRouteType>());
    },
  );
}
