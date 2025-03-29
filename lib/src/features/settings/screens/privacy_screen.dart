import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/bg.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  static const routePath = '/PrivacyScreen';

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: Appbar(title: l.privacyPolicy),
      body: Bg(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: AppFonts.funnel400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
