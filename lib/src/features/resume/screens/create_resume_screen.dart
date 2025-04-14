import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/template.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/bg.dart';
import '../../../core/widgets/dialog_widget.dart';
import '../provider/resume_provider.dart';
import '../widgets/resume_buttons.dart';
import '../widgets/resume_indicator.dart';
import 'resume_information.dart';
import 'resume_languages.dart';
import 'resume_education.dart';
import 'resume_experience.dart';
import 'resume_projects.dart';
import 'resume_skills.dart';
import 'resume_interests.dart';
import 'resume_honors.dart';
import 'resume_about.dart';

class CreateResumeScreen extends StatelessWidget {
  const CreateResumeScreen({super.key, required this.template});

  final Template template;

  static const routePath = '/CreateResumeScreen';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ResumeProvider(),
      builder: (context, child) {
        final l = AppLocalizations.of(context)!;
        final provider = context.watch<ResumeProvider>();

        return Scaffold(
          // resizeToAvoidBottomInset: false,
          appBar: Appbar(
            title: provider.getTitle(l),
            left: AppbarButton(
              asset: provider.index == 1 ? Assets.close : Assets.left,
              onPressed: provider.index == 1
                  ? () {
                      DialogWidget.show(
                        context,
                        title: l.exit,
                        description: l.exitDescription,
                        onYes: () {
                          context.pop();
                        },
                      );
                    }
                  : provider.goLeft,
            ),
            right: provider.canContinue
                ? AppbarButton(
                    asset: provider.index == 9 ? Assets.close : Assets.right,
                    onPressed: provider.index == 9
                        ? () {
                            DialogWidget.show(
                              context,
                              title: l.exit,
                              description: l.exitDescription,
                              onYes: () {
                                context.pop();
                              },
                            );
                          }
                        : provider.goRight,
                  )
                : null,
          ),
          body: Bg(
            topWidgets: [
              ResumeButtons(id: template.id),
            ],
            child: ListView(
              padding: const EdgeInsets.all(16).copyWith(bottom: 200),
              children: [
                const SizedBox(height: 4),
                const ResumeIndicator(),
                const SizedBox(height: 16),
                if (provider.index == 1) const ResumeInformation(),
                if (provider.index == 2) const ResumeLanguages(),
                if (provider.index == 3)
                  ...List.generate(
                    provider.educationControllers.length,
                    (index) {
                      return ResumeEducation(
                        controllers: provider.educationControllers[index],
                        index: index,
                        remove: index != 0,
                      );
                    },
                  ),
                if (provider.index == 4)
                  ...List.generate(
                    provider.experienceControllers.length,
                    (index) {
                      return ResumeExperience(
                        controllers: provider.experienceControllers[index],
                        index: index,
                        remove: index != 0,
                      );
                    },
                  ),
                if (provider.index == 5)
                  ...List.generate(
                    provider.projectControllers.length,
                    (index) {
                      return ResumeProjects(
                        controllers: provider.projectControllers[index],
                        index: index,
                        remove: index != 0,
                      );
                    },
                  ),
                if (provider.index == 6) const ResumeSkills(),
                if (provider.index == 7) const ResumeInterests(),
                if (provider.index == 8) const ResumeHonors(),
                if (provider.index == 9) const ResumeAbout(),
              ],
            ),
          ),
        );
      },
    );
  }
}
