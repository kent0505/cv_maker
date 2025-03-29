import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/constants.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/bg.dart';
import '../../../core/widgets/button.dart';
import '../bloc/settings_bloc.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({super.key});

  static const routePath = '/LanguagesScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(title: 'Languages'),
      body: Bg(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const _Tile(
              title: '🇺🇸 English',
              locale: Locales.en,
            ),
            const _Tile(
              title: '🇷🇺 Russian',
              locale: Locales.ru,
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
    required this.locale,
  });

  final String title;
  final String locale;

  @override
  Widget build(BuildContext context) {
    final current = context.watch<SettingsBloc>().state.languageCode;
    final active = current == locale;

    return Button(
      onPressed: active
          ? null
          : () {
              context.read<SettingsBloc>().add(SetLanguage(locale: locale));
            },
      child: Container(
        height: 48,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 1,
            color: const Color(0xffDFDFDF),
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
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: active ? Color(0xffB5EF64) : Color(0xffE8E8F2),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(width: 22),
          ],
        ),
      ),
    );
  }
}
