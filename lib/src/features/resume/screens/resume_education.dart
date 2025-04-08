import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';
import '../../../core/widgets/txt_field.dart';
import '../provider/resume_provider.dart';
import '../widgets/field_title.dart';
import '../widgets/remove_button.dart';

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
        const SizedBox(height: 4),
        TxtField(
          controller: controllers[0],
          hintText: 'The University of Manchester',
          onChanged: (_) {
            provider.checkActive();
          },
        ),
        const SizedBox(height: 16),
        FieldTitle(l.universityFaculty),
        const SizedBox(height: 4),
        TxtField(
          controller: controllers[1],
          hintText: l.marketingAndManagement,
          onChanged: (_) {
            provider.checkActive();
          },
        ),
        const SizedBox(height: 16),
        FieldTitle(l.universitySpecialization),
        const SizedBox(height: 4),
        TxtField(
          controller: controllers[2],
          hintText: l.marketing,
          onChanged: (_) {
            provider.checkActive();
          },
        ),
        const SizedBox(height: 16),
        FieldTitle(l.universityStartYear),
        const SizedBox(height: 4),
        TxtField(
          controller: controllers[3],
          hintText: '2025',
          number: true,
          onChanged: (_) {
            provider.checkActive();
          },
        ),
        const SizedBox(height: 16),
        FieldTitle(l.universityEndYear),
        const SizedBox(height: 4),
        TxtField(
          controller: controllers[4],
          hintText: '2025',
          number: true,
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
