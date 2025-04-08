import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/skill.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/svg_widget.dart';
import '../../../core/widgets/txt_field.dart';
import '../provider/resume_provider.dart';
import '../widgets/field_title.dart';

class ResumeSkills extends StatelessWidget {
  const ResumeSkills({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final provider = context.watch<ResumeProvider>();

    return Column(
      children: [
        FieldTitle(l.enterSkill),
        const SizedBox(height: 4),
        TxtField(
          controller: provider.skillController,
          hintText: 'Patience',
          onChanged: (_) {
            provider.checkActive();
          },
        ),
        if (provider.skills.isEmpty)
          Padding(
            padding: const EdgeInsets.only(
              top: 100,
              left: 32,
              right: 32,
            ),
            child: Text(
              l.only30Skill,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: AppFonts.funnel700,
              ),
            ),
          )
        else
          ...List.generate(
            provider.skills.length,
            (index) {
              return _SkillCard(
                skill: provider.skills[index],
              );
            },
          ),
      ],
    );
  }
}

class _SkillCard extends StatelessWidget {
  const _SkillCard({required this.skill});

  final Skill skill;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          width: 1,
          color: Color(0xffDFDFDF),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              skill.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: AppFonts.funnel600,
              ),
            ),
          ),
          Button(
            onPressed: () {
              context.read<ResumeProvider>().removeSkill(skill);
            },
            minSize: 20,
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Color(0xffFD9191),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Center(
                child: SvgWidget(Assets.close),
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
