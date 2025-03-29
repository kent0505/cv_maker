import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/constants.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/bg.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/main_button.dart';
import '../bloc/settings_bloc.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({super.key});

  static const routePath = '/LanguagesScreen';

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  late String locale;

  void onLocale(String value) {
    setState(() {
      locale = value;
    });
  }

  void onSave() {
    context.read<SettingsBloc>().add(SetLanguage(locale: locale));
    context.pop();
  }

  @override
  void initState() {
    super.initState();
    locale = context.read<SettingsBloc>().state.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: Appbar(title: l.languages),
      body: Bg(
        topWidgets: [
          Column(
            children: [
              const Spacer(),
              MainButton(
                title: l.save,
                onPressed: onSave,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ],
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _Tile(
              title: '🇺🇸 English',
              locale: Locales.en,
              current: locale,
              onPressed: onLocale,
            ),
            _Tile(
              title: '🇷🇺 Russian',
              locale: Locales.ru,
              current: locale,
              onPressed: onLocale,
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
    required this.current,
    required this.onPressed,
  });

  final String title;
  final String locale;
  final String current;
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    final active = current == locale;

    return Button(
      onPressed: active
          ? null
          : () {
              onPressed(locale);
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
