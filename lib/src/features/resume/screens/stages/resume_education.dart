import 'package:flutter/material.dart';

import '../../../../core/config/constants.dart';
import '../../../../core/widgets/txt_field.dart';
import '../../provider/resume_provider.dart';
import '../../widgets/field_title.dart';
import '../../widgets/remove_button.dart';

class ResumeEducation extends StatelessWidget {
  const ResumeEducation({
    super.key,
    required this.remove,
    required this.index,
    required this.controllers,
  });

  final List<TextEditingController> controllers;
  final int index;
  final bool remove;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final provider = context.watch<ResumeProvider>();

    return Column(
      children: [
        FieldTitle(l.universityName),
        TxtField(
          controller: controllers[0],
          hintText: 'The University of Manchester',
          maxLength: 80,
          onChanged: (_) {
            provider.checkActive();
          },
        ),
        const SizedBox(height: 16),
        FieldTitle(l.universityFaculty),
        TxtField(
          controller: controllers[1],
          hintText: l.marketingAndManagement,
          maxLength: 60,
          onChanged: (_) {
            provider.checkActive();
          },
        ),
        const SizedBox(height: 16),
        FieldTitle(l.universityStartYear),
        TxtField(
          controller: controllers[2],
          hintText: '2025',
          number: true,
          maxLength: 4,
          onChanged: (_) {
            provider.checkActive();
          },
        ),
        const SizedBox(height: 16),
        FieldTitle(l.universityEndYear),
        TxtField(
          controller: controllers[3],
          hintText: '2025',
          number: true,
          maxLength: 4,
          onChanged: (_) {
            provider.checkActive();
          },
        ),
        const SizedBox(height: 16),
        if (remove)
          RemoveButton(
            onPressed: () {
              provider.removeEducation(index);
            },
          ),
        const SizedBox(height: 32),
      ],
    );
  }
}
