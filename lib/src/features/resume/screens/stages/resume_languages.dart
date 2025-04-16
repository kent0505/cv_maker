import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/constants.dart';
import '../../../../core/models/language.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/svg_widget.dart';
import '../../../../core/widgets/txt_field.dart';
import '../../provider/resume_provider.dart';
import '../../widgets/field_title.dart';
import '../../widgets/remove_button.dart';

class ResumeLanguages extends StatelessWidget {
  const ResumeLanguages({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final provider = context.watch<ResumeProvider>();

    return Column(
      children: [
        FieldTitle(l.enterLanguage),
        const SizedBox(height: 4),
        TxtField(
          controller: provider.languageController,
          hintText: l.english,
          onChanged: (_) {
            provider.checkActive();
          },
        ),
        ...List.generate(
          provider.languages.length,
          (index) {
            return _LanguageCard(
              language: provider.languages[index],
              withTitle: index == 0,
            );
          },
        ),
      ],
    );
  }
}

class _LanguageCard extends StatelessWidget {
  const _LanguageCard({
    required this.language,
    required this.withTitle,
  });

  final Language language;
  final bool withTitle;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final provider = context.watch<ResumeProvider>();

    return Column(
      children: [
        const SizedBox(height: 16),
        if (withTitle) ...[
          Row(
            children: [
              Expanded(
                child: FieldTitle(l.language),
              ),
              SizedBox(
                width: 188,
                child: FieldTitle(l.chooseLevel),
              ),
            ],
          ),
          const SizedBox(height: 6),
        ],
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        language.language,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: AppFonts.funnel400,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              height: 48,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Button(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) {
                      return _LevelDialog(
                        language: language,
                        provider: provider,
                      );
                    },
                  );
                },
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    Text(
                      language.level,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: AppFonts.funnel400,
                      ),
                    ),
                    const Spacer(),
                    const SvgWidget(Assets.bottom),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            RemoveButton(
              onPressed: () {
                provider.removeLanguage(language);
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _LevelDialog extends StatelessWidget {
  const _LevelDialog({
    required this.language,
    required this.provider,
  });

  final Language language;
  final ResumeProvider provider;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 270,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _Level(
              level: Levels.a1,
              language: language,
              provider: provider,
            ),
            _Level(
              level: Levels.a2,
              language: language,
              provider: provider,
            ),
            _Level(
              level: Levels.b1,
              language: language,
              provider: provider,
            ),
            _Level(
              level: Levels.b2,
              language: language,
              provider: provider,
            ),
            _Level(
              level: Levels.c1,
              language: language,
              provider: provider,
            ),
            _Level(
              level: Levels.c2,
              language: language,
              provider: provider,
            ),
          ],
        ),
      ),
    );
  }
}

class _Level extends StatelessWidget {
  const _Level({
    required this.level,
    required this.language,
    required this.provider,
  });

  final String level;
  final Language language;
  final ResumeProvider provider;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: () {
        provider.setLanguageLevel(language, level);
        context.pop();
      },
      child: Center(
        child: Text(
          level,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: AppFonts.funnel400,
          ),
        ),
      ),
    );
  }
}
