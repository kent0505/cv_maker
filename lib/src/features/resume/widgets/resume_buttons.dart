import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/main_button.dart';
import '../provider/resume_provider.dart';

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
              provider.onSkip();
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
          // white: i == 9 ? false : true,
          // active: i == 9 ? provider.active : true,
          active: provider.canContinue,
          onPressed: i == 9
              ? () {
                  logger('SAVE');
                  // final id = getTimestamp();
                  // context.read<ResumeBloc>().add(
                  //       AddResume(
                  //         resume: Resume(
                  //           id: id,
                  //           photo: provider.imagePath,
                  //           name: provider.nameController.text,
                  //           phone: provider.phoneController.text,
                  //           email: provider.emailController.text,
                  //           city: provider.cityController.text,
                  //           birth: provider.birthController.text,
                  //           job: provider.jobController.text,
                  //           languageID: id,
                  //           educationID: id,
                  //           experienceID: id,
                  //           projectID: id,
                  //           skillID: id,
                  //           interestID: id,
                  //           honorID: id,
                  //           about: provider.aboutController.text,
                  //         ),
                  //         languages: provider.languages,
                  //         educations: [],
                  //         experiences: [],
                  //         projects: [],
                  //         skills: [],
                  //         interests: [],
                  //         honors: [],
                  //       ),
                  //     );
                  // context.pop();
                }
              : provider.goRight,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
