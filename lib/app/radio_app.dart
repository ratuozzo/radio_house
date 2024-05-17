import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../presentation/home/home_screen.dart';

class RadioApp extends StatelessWidget {
  const RadioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme:
            const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark),
      ),
      home: const HomeScreen(),
    );
  }
}
