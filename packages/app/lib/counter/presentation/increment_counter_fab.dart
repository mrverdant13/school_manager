import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_manager/counter/counter.dart';
import 'package:school_manager/l10n/l10n.dart';

class IncrementCounterFab extends ConsumerWidget {
  const IncrementCounterFab({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return FloatingActionButton(
      onPressed: () => ref.read(counterPod.notifier).increment(),
      tooltip: l10n.counterIncrementButtonTooltip,
      child: const Icon(Icons.add),
    );
  }
}
