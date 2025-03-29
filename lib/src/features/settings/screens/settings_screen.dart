import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/constants.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/bg.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/svg_widget.dart';
import 'languages_screen.dart';
import 'privacy_screen.dart';
import 'terms_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const routePath = '/SettingsScreen';

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: Appbar(title: l.settings),
      body: Bg(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _Tile(
              title: l.share,
              onPressed: () {},
            ),
            _Tile(
              title: l.contactUs,
              onPressed: () {},
            ),
            _Tile(
              title: l.termsOfUse,
              onPressed: () {
                context.push(TermsScreen.routePath);
              },
            ),
            _Tile(
              title: l.privacyPolicy,
              onPressed: () {
                context.push(PrivacyScreen.routePath);
              },
            ),
            _Tile(
              title: l.languages,
              onPressed: () {
                context.push(LanguagesScreen.routePath);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed,
      child: Container(
        height: 48,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 1,
            color: Color(0xffDFDFDF),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 14),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: AppFonts.funnel600,
              ),
            ),
            const Spacer(),
            const SvgWidget(
              Assets.arrow,
              width: 20,
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
