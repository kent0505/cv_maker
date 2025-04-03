import 'package:flutter/material.dart';

import '../../../core/widgets/txt_field.dart';
import '../widgets/field_title.dart';

class ResumeEducation extends StatelessWidget {
  const ResumeEducation({
    super.key,
    required this.controllers,
  });

  final List<TextEditingController> controllers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FieldTitle('Name of the University you studied at'),
        const SizedBox(height: 4),
        TxtField(
          controller: controllers[0],
          hintText: 'The University of Manchester',
        ),
        const SizedBox(height: 16),
        FieldTitle('Name of faculty'),
        const SizedBox(height: 4),
        TxtField(
          controller: controllers[1],
          hintText: 'Marketing and management',
        ),
        const SizedBox(height: 16),
        FieldTitle('Specialization'),
        const SizedBox(height: 4),
        TxtField(
          controller: controllers[2],
          hintText: 'Marketing',
        ),
        const SizedBox(height: 16),
        FieldTitle('Year of start'),
        const SizedBox(height: 4),
        TxtField(
          controller: controllers[3],
          hintText: '2025',
        ),
        const SizedBox(height: 16),
        FieldTitle('Year of ending'),
        const SizedBox(height: 4),
        TxtField(
          controller: controllers[4],
          hintText: '2025',
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
