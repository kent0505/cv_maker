import 'package:flutter/material.dart';

import 'src/core/config/router.dart';
import 'src/core/config/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      routerConfig: routerConfig,
    );
  }
}
