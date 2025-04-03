import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';
import '../../../core/widgets/txt_field.dart';
import '../widgets/field_title.dart';
import '../widgets/user_image.dart';

class ResumeInformation extends StatelessWidget {
  const ResumeInformation({
    super.key,
    required this.controllers,
    required this.onImage,
  });

  final List<TextEditingController> controllers;
  final void Function() onImage;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Column(
      children: [
        UserImage(
          controller: controllers[0],
          onPressed: onImage,
        ),
        const SizedBox(height: 8),
        FieldTitle(l.name),
        const SizedBox(height: 4),
        TxtField(
          controller: controllers[1],
          hintText: 'Alex',
        ),
        const SizedBox(height: 16),
        FieldTitle(l.mobilePhone),
        const SizedBox(height: 4),
        TxtField(
          controller: controllers[2],
          hintText: '(239) 555 - 0108',
        ),
        const SizedBox(height: 16),
        const FieldTitle('Email'),
        const SizedBox(height: 4),
        TxtField(
          controller: controllers[3],
          hintText: 'yourmail@example.com',
        ),
        const SizedBox(height: 16),
        FieldTitle(l.cityOfResidence),
        const SizedBox(height: 4),
        TxtField(
          controller: controllers[4],
          hintText: 'Pembroke Pines',
        ),
        const SizedBox(height: 16),
        FieldTitle(l.dateOfBirth),
        const SizedBox(height: 4),
        TxtField(
          controller: controllers[5],
          hintText: '3/16/25',
        ),
        const SizedBox(height: 16),
        FieldTitle(l.jobTitle),
        const SizedBox(height: 4),
        TxtField(
          controller: controllers[6],
          hintText: 'Manager',
        ),
      ],
    );
  }
}
