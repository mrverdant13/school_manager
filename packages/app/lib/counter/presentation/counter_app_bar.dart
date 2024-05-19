import 'package:flutter/material.dart';
import 'package:school_manager/counter/counter.dart';
import 'package:school_manager/l10n/l10n.dart';

class CounterAppBar extends AppBar {
  CounterAppBar({super.key});

  @override
  State<CounterAppBar> createState() => _CounterAppBarState();
}

class _CounterAppBarState extends State<CounterAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        context.l10n.counterAppBarTitle,
        key: const Key('<counter::counter-app-bar::title>'),
      ),
      actions: const [
        ResetCounterIconButton(),
      ],
    );
  }
}
