import 'package:flutter/material.dart';

import '../../../core/widgets/bg.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  static const routePath = '/OnboardScreen';

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    // final l = AppLocalizations.of(context)!;

    return Scaffold(
      body: Bg(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ONBOARD'),
          ],
        ),
      ),
    );
  }
}
