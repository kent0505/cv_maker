import 'package:flutter/material.dart';

import '../../../core/widgets/txt_field.dart';
import '../widgets/field_title.dart';

class ResumeEducation extends StatelessWidget {
  const ResumeEducation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FieldTitle('Name of the University you studied at'),
        const SizedBox(height: 4),
        TxtField(
          initialValue: '',
          hintText: 'The University of Manchester',
        ),
        const SizedBox(height: 16),
        FieldTitle('Name of faculty'),
        const SizedBox(height: 4),
        TxtField(
          initialValue: '',
          hintText: 'Marketing and management',
        ),
        const SizedBox(height: 16),
        FieldTitle('Specialization'),
        const SizedBox(height: 4),
        TxtField(
          initialValue: '',
          hintText: 'Marketing',
        ),
        const SizedBox(height: 16),
        FieldTitle('Year of start'),
        const SizedBox(height: 4),
        TxtField(
          initialValue: '',
          hintText: '2025',
        ),
        const SizedBox(height: 16),
        FieldTitle('Year of ending'),
        const SizedBox(height: 4),
        TxtField(
          initialValue: '',
          hintText: '2025',
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
