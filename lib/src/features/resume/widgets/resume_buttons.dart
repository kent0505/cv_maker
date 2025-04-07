import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';
import '../../../core/widgets/main_button.dart';

class ResumeButtons extends StatelessWidget {
  const ResumeButtons({
    super.key,
    required this.index,
    required this.active,
    required this.onSkip,
    required this.onAdd,
    required this.onContinue,
  });

  final int index;
  final bool active;
  final VoidCallback onSkip;
  final VoidCallback onAdd;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final skip = index != 1;
    final addOneMore = index == 3 || index == 4 || index == 5;
    final add =
        index == 2 || index == 6 || index == 7 || index == 8 || index == 9;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (skip) ...[
          MainButton(
            title: l.skip,
            transparent: true,
            onPressed: onSkip,
          ),
          const SizedBox(height: 8),
        ],
        if (addOneMore) ...[
          MainButton(
            title: l.addOneMore,
            active: active,
            onPressed: onAdd,
          ),
          const SizedBox(height: 8),
        ],
        if (add) ...[
          MainButton(
            title: l.add,
            active: active,
            onPressed: onAdd,
          ),
          const SizedBox(height: 8),
        ],
        MainButton(
          title: index == 10 ? l.saveResume : l.continuee,
          white: true,
          onPressed: onContinue,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
