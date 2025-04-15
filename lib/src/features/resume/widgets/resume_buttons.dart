import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/data.dart';
import '../../../core/models/resume.dart';
import '../../../core/widgets/main_button.dart';
import '../../home/bloc/home_bloc.dart';
import '../provider/resume_provider.dart';
import '../bloc/resume_bloc.dart';

class ResumeButtons extends StatelessWidget {
  const ResumeButtons({
    super.key,
    required this.id,
    required this.template,
    this.edit = false,
  });

  final int id;
  final int template;
  final bool edit;

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
                  ? onSave(
                      context,
                      provider,
                      id,
                      template,
                      edit,
                    )
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
            i == 9
                ? onSave(
                    context,
                    provider,
                    id,
                    template,
                    edit,
                  )
                : provider.goRight();
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
  int id,
  int template,
  bool edit,
) {
  final data = Data(
    resume: Resume(
      id: id,
      template: template,
      photo: provider.imagePath,
      name: provider.nameController.text,
      phone: provider.phoneController.text,
      email: provider.emailController.text,
      city: provider.cityController.text,
      birth: provider.birthController.text,
      job: provider.jobController.text,
      about: provider.aboutController.text,
    ),
    languages: provider.languages,
    educations: provider.getEducations(),
    experiences: provider.getExperiences(),
    projects: provider.getProjects(),
    skills: provider.skills,
    interests: provider.interests,
    honors: provider.honors,
  );
  context.read<ResumeBloc>().add(
        edit ? EditResume(data: data) : AddResume(data: data),
      );
  context.pop();
  context.read<HomeBloc>().add(ChangeHome(id: 2));
}
