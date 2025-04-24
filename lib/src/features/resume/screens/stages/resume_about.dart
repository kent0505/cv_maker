import 'package:flutter/material.dart';

import '../../../../core/config/constants.dart';
import '../../../../core/widgets/txt_field.dart';
import '../../provider/resume_provider.dart';

class ResumeAbout extends StatelessWidget {
  const ResumeAbout({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final provider = context.watch<ResumeProvider>();

    return Column(
      children: [
        Text(
          l.aboutTitle,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: AppFonts.funnel400,
          ),
        ),
        const SizedBox(height: 8),
        TxtField(
          controller: provider.aboutController,
          hintText: l.aboutYou,
          multiline: true,
          maxLength: 200,
          onChanged: (_) {
            provider.checkActive();
          },
        )
      ],
    );
  }
}
