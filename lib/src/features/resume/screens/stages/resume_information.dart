import 'package:flutter/material.dart';

import '../../../../core/utils.dart';
import '../../../../core/config/constants.dart';
import '../../../../core/widgets/ios_date_picker.dart';
import '../../../../core/widgets/txt_field.dart';
import '../../provider/resume_provider.dart';
import '../../widgets/field_title.dart';
import '../../widgets/user_image.dart';

class ResumeInformation extends StatelessWidget {
  const ResumeInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final provider = context.watch<ResumeProvider>();

    return Column(
      children: [
        const UserImage(),
        const SizedBox(height: 8),
        FieldTitle(l.name),
        const SizedBox(height: 4),
        TxtField(
          controller: provider.nameController,
          hintText: l.alex,
          maxLength: 30,
          onChanged: (_) {
            provider.checkActive();
          },
        ),
        const SizedBox(height: 16),
        FieldTitle(l.mobilePhone),
        const SizedBox(height: 4),
        TxtField(
          controller: provider.phoneController,
          hintText: '(239) 555 - 0108',
          maxLength: 20,
          onChanged: (_) {
            provider.checkActive();
          },
        ),
        const SizedBox(height: 16),
        const FieldTitle('Email'),
        const SizedBox(height: 4),
        TxtField(
          controller: provider.emailController,
          hintText: 'yourmail@example.com',
          maxLength: 30,
          email: true,
          onChanged: (_) {
            provider.checkActive();
          },
        ),
        const SizedBox(height: 16),
        FieldTitle(l.cityOfResidence),
        const SizedBox(height: 4),
        TxtField(
          controller: provider.cityController,
          hintText: l.city,
          maxLength: 30,
          onChanged: (_) {
            provider.checkActive();
          },
        ),
        const SizedBox(height: 16),
        FieldTitle(l.dateOfBirth),
        const SizedBox(height: 4),
        TxtField(
          controller: provider.birthController,
          hintText: '16/03/25',
          readOnly: true,
          maxLength: 10,
          onTap: () {
            IosDatePicker.show(
              context,
              stringToDate(provider.birthController.text),
              (value) {
                provider.setDate(provider.birthController, value);
              },
              birthDay: true,
            );
          },
        ),
        const SizedBox(height: 16),
        FieldTitle(l.jobTitle),
        const SizedBox(height: 4),
        TxtField(
          controller: provider.jobController,
          hintText: l.manager,
          maxLength: 30,
          onChanged: (_) {
            provider.checkActive();
          },
        ),
      ],
    );
  }
}
