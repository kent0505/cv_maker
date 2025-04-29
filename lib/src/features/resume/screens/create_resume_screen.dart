import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/data.dart';
import '../../../core/models/template.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/bg.dart';
import '../../../core/widgets/dialog_widget.dart';
import '../provider/resume_provider.dart';
import '../widgets/resume_buttons.dart';
import '../widgets/resume_indicator.dart';
import 'stages/resume_information.dart';
import 'stages/resume_languages.dart';
import 'stages/resume_education.dart';
import 'stages/resume_experience.dart';
import 'stages/resume_skills.dart';
import 'stages/resume_interests.dart';
import 'stages/resume_about.dart';

class CreateResumeScreen extends StatelessWidget {
  const CreateResumeScreen({super.key, required this.template});

  final Template template;

  static const routePath = '/CreateResumeScreen';

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    void goBack() {
      context.pop();
    }

    void showdialog() {
      DialogWidget.show(
        context,
        title: l.exit,
        description: l.exitDescription,
        onYes: goBack,
      );
    }

    return ChangeNotifierProvider(
      create: (context) => ResumeProvider(emptyData),
      builder: (context, child) {
        final provider = context.watch<ResumeProvider>();

        return Scaffold(
          appBar: Appbar(
            title: provider.getTitle(l),
            left: AppbarButton(
              asset: provider.index == 1 ? Assets.close : Assets.left,
              onPressed: provider.index == 1
                  ? provider.canPop
                      ? goBack
                      : showdialog
                  : provider.goLeft,
            ),
            right: AppbarButton(
              asset: provider.index == 7 ? Assets.close : Assets.right,
              onPressed: provider.index == 7
                  ? provider.canPop
                      ? goBack
                      : showdialog
                  : provider.goRight,
            ),
          ),
          body: Bg(
            topWidgets: [
              ResumeButtons(
                id: provider.id,
                template: template.id,
              ),
            ],
            child: ListView(
              padding: const EdgeInsets.all(16),
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
                if (provider.index == 5) const ResumeSkills(),
                if (provider.index == 6) const ResumeInterests(),
                if (provider.index == 7) const ResumeAbout(),
              ],
            ),
          ),
        );
      },
    );
  }
}
