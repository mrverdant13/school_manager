import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:school_manager/routing/routing.dart';

export 'routes/routes.dart';

part 'router.g.dart';

@AutoRouterConfig(
  generateForDir: ['lib/routing/'],
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  final List<AutoRoute> routes = [
    AdaptiveRoute(
      initial: true,
      path: '/counter',
      title: (context, data) => 'Counter',
      page: CounterRoute.page,
    ),
  ];
}

@Riverpod(
  dependencies: [],
)
RouterConfig<Object> routerConfig(RouterConfigRef ref) {
  final routerConfig = AppRouter().config();
  final delegate = routerConfig.routerDelegate;

  void logCurrentUri() {
    if (!kDebugMode) return;
    final currentUri = delegate.currentConfiguration!.uri;
    log(
      'path: <$currentUri>',
      name: 'Navigation',
    );
  }

  delegate.addListener(logCurrentUri);
  ref.onDispose(() => delegate.removeListener(logCurrentUri));

  return routerConfig;
}
