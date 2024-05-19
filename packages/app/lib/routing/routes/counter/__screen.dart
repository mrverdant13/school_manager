import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:school_manager/counter/counter.dart';

@RoutePage(
  name: 'CounterRoute',
)
class CounterScreen extends StatelessWidget {
  const CounterScreen({
    super.key,
  });

  @visibleForTesting
  static const maxContentWidth = 1200.0;

  @override
  Widget build(BuildContext context) {
    final counterAppBar = CounterAppBar();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: counterAppBar.preferredSize,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: maxContentWidth),
            child: counterAppBar,
          ),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: maxContentWidth),
          child: const CounterBody(),
        ),
      ),
      floatingActionButton: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final padding = math.max<double>(0, (width - maxContentWidth) / 2);
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: const IncrementCounterFab(),
          );
        },
      ),
    );
  }
}
