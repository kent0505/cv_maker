import 'package:flutter/material.dart';

import '../../../core/widgets/txt_field.dart';
import '../widgets/field_title.dart';

class ResumeLanguages extends StatelessWidget {
  const ResumeLanguages({super.key, required this.languageController});

  final TextEditingController languageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FieldTitle('Enter language'),
        const SizedBox(height: 4),
        TxtField(
          controller: languageController,
          hintText: 'English',
        ),
      ],
    );
  }
}
