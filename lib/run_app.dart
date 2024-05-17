import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import 'app/d_injection/inject_dependencies.dart';
import 'app/radio_app.dart';
import 'presentation/common/logger/colored_log_printer.dart';

Future<void> runRadioApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  _initLoggy();
  injectDependencies();

  //await dotenv.load(fileName: FlavorConfig.instance.values.envPath);

  _lockOrientation();
  runApp(
    const ProviderScope(
      child: RadioApp(),
    ),
  );
}

void _initLoggy() {
  Loggy.initLoggy(
    logPrinter: const ColoredDeveloperPrinter(),
  );
}

void _lockOrientation() {
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
}
