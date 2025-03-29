import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/bg.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  static const routePath = '/TermsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(title: 'Terms of Use'),
      body: Bg(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Terms of Use',
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
