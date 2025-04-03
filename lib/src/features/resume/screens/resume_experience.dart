import 'package:flutter/material.dart';

import '../../../core/widgets/txt_field.dart';
import '../widgets/field_title.dart';

class ResumeWork extends StatelessWidget {
  const ResumeWork({super.key, required this.controllers});

  final List<TextEditingController> controllers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FieldTitle('Name of the company'),
        const SizedBox(height: 4),
        TxtField(
          controller: controllers[0],
          hintText: 'Gilette',
        ),
        const SizedBox(height: 16),
        FieldTitle('Company location'),
        const SizedBox(height: 4),
        TxtField(
          controller: controllers[1],
          hintText: 'London',
        ),
        const SizedBox(height: 16),
        FieldTitle('Introduction'),
        const SizedBox(height: 4),
        TxtField(
          controller: controllers[2],
          hintText: 'Head of Marketing',
        ),
        const SizedBox(height: 16),
        FieldTitle('Details'),
        const SizedBox(height: 4),
        TxtField(
          controller: controllers[3],
          hintText: 'Marketing',
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  FieldTitle('Start Date'),
                  const SizedBox(height: 4),
                  TxtField(
                    controller: controllers[4],
                    hintText: '12/09/2020',
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                children: [
                  FieldTitle('End Date'),
                  const SizedBox(height: 4),
                  TxtField(
                    controller: controllers[5],
                    hintText: '12/09/2020',
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
