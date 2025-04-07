import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';
import '../../../core/widgets/ios_date_picker.dart';
import '../../../core/widgets/txt_field.dart';
import '../provider/resume_provider.dart';
import '../widgets/field_title.dart';
import '../widgets/user_image.dart';

class ResumeInformation extends StatelessWidget {
  const ResumeInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final provider = context.watch<ResumeProvider>();

    return Column(
      children: [
        UserImage(),
        const SizedBox(height: 8),
        FieldTitle(l.name),
        const SizedBox(height: 4),
        TxtField(
          initialValue: provider.name,
          hintText: 'Alex',
        ),
        const SizedBox(height: 16),
        FieldTitle(l.mobilePhone),
        const SizedBox(height: 4),
        TxtField(
          initialValue: provider.phone,
          hintText: '(239) 555 - 0108',
        ),
        const SizedBox(height: 16),
        const FieldTitle('Email'),
        const SizedBox(height: 4),
        TxtField(
          initialValue: provider.email,
          hintText: 'yourmail@example.com',
        ),
        const SizedBox(height: 16),
        FieldTitle(l.cityOfResidence),
        const SizedBox(height: 4),
        TxtField(
          initialValue: provider.city,
          hintText: 'Pembroke Pines',
        ),
        const SizedBox(height: 16),
        FieldTitle(l.dateOfBirth),
        const SizedBox(height: 4),
        Consumer<ResumeProvider>(builder: (context, provider, child) {
          return TxtField(
            initialValue: provider.birth,
            hintText: '16/03/25',
            readOnly: true,
            onTap: () {
              Picker.show(
                context,
                DateTime.now(),
                (value) {
                  provider.setBirth(value);
                },
                birthDay: true,
              );
            },
          );
        }),
        const SizedBox(height: 16),
        FieldTitle(l.jobTitle),
        const SizedBox(height: 4),
        TxtField(
          initialValue: provider.job,
          hintText: 'Manager',
        ),
      ],
    );
  }
}
