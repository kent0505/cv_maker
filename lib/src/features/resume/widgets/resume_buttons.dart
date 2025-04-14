import 'package:cv_maker/src/core/models/data.dart';
import 'package:cv_maker/src/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/resume.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/main_button.dart';
import '../provider/resume_provider.dart';
import '../bloc/resume_bloc.dart';

class ResumeButtons extends StatelessWidget {
  const ResumeButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final provider = context.watch<ResumeProvider>();
    final i = provider.index;
    final skip = i != 1;
    final addOneMore = i == 3 || i == 4 || i == 5;
    final add = i == 2 || i == 6 || i == 7 || i == 8;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (skip) ...[
          MainButton(
            title: l.skip,
            transparent: true,
            onPressed: () {
              provider.index == 9
                  ? onSave(context, provider)
                  : provider.onSkip();
            },
          ),
          const SizedBox(height: 8),
        ],
        if (addOneMore) ...[
          MainButton(
            title: l.addOneMore,
            active: provider.canAdd,
            onPressed: provider.onAdd,
          ),
          const SizedBox(height: 8),
        ],
        if (add) ...[
          MainButton(
            title: l.add,
            active: provider.canAdd,
            onPressed: provider.onAdd,
          ),
          const SizedBox(height: 8),
        ],
        MainButton(
          title: i == 9 ? l.saveResume : l.continuee,
          active: provider.canContinue,
          onPressed: () {
            i == 9 ? onSave(context, provider) : provider.goRight();
          },
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}

void onSave(
  BuildContext context,
  ResumeProvider provider,
) {
  final id = getTimestamp();
  context.read<ResumeBloc>().add(
        AddResume(
          data: Data(
            resume: Resume(
              id: id,
              template: provider.template,
              photo: provider.imagePath,
              name: provider.nameController.text,
              phone: provider.phoneController.text,
              email: provider.emailController.text,
              city: provider.cityController.text,
              birth: provider.birthController.text,
              job: provider.jobController.text,
              about: provider.aboutController.text,
            ),
            languages: provider.getLanguages(id),
            educations: provider.getEducations(id),
            experiences: provider.getExperiences(id),
            projects: provider.getProjects(id),
            skills: provider.getSkills(id),
            interests: provider.getInterests(id),
            honors: provider.getHonors(id),
          ),
        ),
      );
  context.pop();
  context.read<HomeBloc>().add(ChangeHome(id: 2));
}
