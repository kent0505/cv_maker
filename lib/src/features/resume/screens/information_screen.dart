import 'package:flutter/material.dart';

import '../../../core/widgets/txt_field.dart';
import '../widgets/field_title.dart';
import '../widgets/user_image.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({
    super.key,
    required this.imageController,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.residenceController,
    required this.birthController,
    required this.jobController,
    required this.onImage,
  });

  final TextEditingController imageController;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController residenceController;
  final TextEditingController birthController;
  final TextEditingController jobController;
  final void Function() onImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserImage(
          controller: imageController,
          onPressed: onImage,
        ),
        const SizedBox(height: 8),
        FieldTitle('Name'),
        const SizedBox(height: 4),
        TxtField(
          controller: nameController,
          hintText: 'Alex',
        ),
        const SizedBox(height: 16),
        FieldTitle('Mobile phone'),
        const SizedBox(height: 4),
        TxtField(
          controller: phoneController,
          number: true,
          hintText: '(239) 555 - 0108',
        ),
        const SizedBox(height: 16),
        FieldTitle('Email'),
        const SizedBox(height: 4),
        TxtField(
          controller: emailController,
          hintText: 'yourmail@example.com',
        ),
        const SizedBox(height: 16),
        FieldTitle('City of Residence'),
        const SizedBox(height: 4),
        TxtField(
          controller: residenceController,
          hintText: 'Pembroke Pines',
        ),
        const SizedBox(height: 16),
        FieldTitle('Date of birth'),
        const SizedBox(height: 4),
        TxtField(
          controller: birthController,
          hintText: '3/16/25',
        ),
        const SizedBox(height: 16),
        FieldTitle('Job Title'),
        const SizedBox(height: 4),
        TxtField(
          controller: jobController,
          hintText: 'Manager',
        ),
      ],
    );
  }
}
