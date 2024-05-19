import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_manager/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      observers: [
        LoggerProviderObserver(),
      ],
      child: MyApp(),
    ),
  );
}
