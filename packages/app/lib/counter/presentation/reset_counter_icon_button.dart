import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_manager/counter/counter.dart';
import 'package:school_manager/l10n/l10n.dart';

class ResetCounterIconButton extends ConsumerWidget {
  const ResetCounterIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return IconButton(
      onPressed: () => ref.invalidate(counterPod),
      tooltip: l10n.counterResetButtonTooltip,
      icon: const Icon(Icons.refresh),
    );
  }
}
