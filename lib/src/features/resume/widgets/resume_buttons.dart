import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';
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
    final add = i == 2 || i == 6 || i == 7 || i == 8 || i == 9;

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
            active: provider.active,
            onPressed: provider.onAdd,
          ),
          const SizedBox(height: 8),
        ],
        if (add) ...[
          MainButton(
            title: l.add,
            active: provider.active,
            onPressed: provider.onAdd,
          ),
          const SizedBox(height: 8),
        ],
        MainButton(
          title: i == 10 ? l.saveResume : l.continuee,
          white: true,
          onPressed: provider.onContinue,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
