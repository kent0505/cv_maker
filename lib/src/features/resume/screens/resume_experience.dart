import 'package:flutter/material.dart';

import '../../../core/utils.dart';
import '../../../core/config/constants.dart';
import '../../../core/widgets/ios_date_picker.dart';
import '../../../core/widgets/txt_field.dart';
import '../provider/resume_provider.dart';
import '../widgets/field_title.dart';
import '../widgets/remove_button.dart';

class ResumeExperience extends StatelessWidget {
  const ResumeExperience({
    super.key,
    required this.controllers,
    required this.index,
    required this.remove,
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
        FieldTitle(l.workCompanyName),
        const SizedBox(height: 4),
        TxtField(
          controller: controllers[0],
          hintText: 'Gilette',
          onChanged: (_) {
            provider.checkActive();
          },
        ),
        const SizedBox(height: 16),
        FieldTitle(l.workCompanyLocation),
        const SizedBox(height: 4),
        TxtField(
          controller: controllers[1],
          hintText: 'London',
          onChanged: (_) {
            provider.checkActive();
          },
        ),
        const SizedBox(height: 16),
        FieldTitle(l.introduction),
        const SizedBox(height: 4),
        TxtField(
          controller: controllers[2],
          hintText: l.headOfMarketing,
          onChanged: (_) {
            provider.checkActive();
          },
        ),
        const SizedBox(height: 16),
        FieldTitle(l.details),
        const SizedBox(height: 4),
        TxtField(
          controller: controllers[3],
          hintText: l.marketing,
          onChanged: (_) {
            provider.checkActive();
          },
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  FieldTitle(l.startDate),
                  const SizedBox(height: 4),
                  TxtField(
                    controller: controllers[4],
                    hintText: '12/09/2020',
                    readOnly: true,
                    onTap: () {
                      Picker.show(
                        context,
                        stringToDate(controllers[4].text),
                        (value) {
                          provider.setDate(controllers[4], value);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                children: [
                  FieldTitle(l.endDate),
                  const SizedBox(height: 4),
                  TxtField(
                    controller: controllers[5],
                    hintText: '12/09/2020',
                    readOnly: true,
                    onTap: () {
                      Picker.show(
                        context,
                        stringToDate(controllers[5].text),
                        (value) {
                          provider.setDate(controllers[5], value);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        if (remove)
          RemoveButton(
            onPressed: () {
              provider.removeExperience(index);
            },
          ),
        const SizedBox(height: 32),
      ],
    );
  }
}
