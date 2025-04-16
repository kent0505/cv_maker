import 'package:flutter/material.dart';

import '../../../../core/config/constants.dart';
import '../../../../core/models/skill.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/my_divider.dart';
import '../../../../core/widgets/svg_widget.dart';
import '../../../../core/widgets/txt_field.dart';
import '../../provider/resume_provider.dart';
import '../../widgets/field_title.dart';

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
          hintText: l.patience,
          onChanged: (_) {
            provider.checkActive();
          },
        ),
        const SizedBox(height: 14),
        _SkillCard(skills: provider.skills),
        const SizedBox(height: 100),
        Text(
          l.only30Skill,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: AppFonts.funnel700,
          ),
        ),
      ],
    );
  }
}

class _SkillCard extends StatelessWidget {
  const _SkillCard({required this.skills});

  final List<Skill> skills;

  @override
  Widget build(BuildContext context) {
    return skills.isEmpty
        ? const SizedBox()
        : Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: List.generate(
                skills.length * 2 - 1,
                (index) {
                  return index.isEven
                      ? _Skill(skill: skills[index ~/ 2])
                      : const MyDivider();
                },
              ),
            ),
          );
  }
}

class _Skill extends StatelessWidget {
  const _Skill({required this.skill});

  final Skill skill;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              skill.title,
              style: const TextStyle(
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
                color: const Color(0xffFD9191),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Center(
                child: SvgWidget(Assets.close),
              ),
            ),
          ),
          const SizedBox(width: 14),
        ],
      ),
    );
  }
}
