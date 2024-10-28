import 'package:clima/utilities/consts.dart';
import 'package:flutter/material.dart';

import '/screens/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: mainColor,
          progressIndicatorTheme:
              const ProgressIndicatorThemeData(color: Colors.white),
        ),
        // home: const LocationScreen());
        home: const LoadingScreen());
  }
}
