import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/resume.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/bg.dart';
import '../../../core/widgets/image_widget.dart';
import '../../../core/widgets/main_button.dart';

class ResumePreviewScreen extends StatelessWidget {
  const ResumePreviewScreen({super.key, required this.resume});

  final Resume resume;

  static const routePath = '/ResumePreviewScreen';

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: Appbar(title: l.myResume),
      body: Bg(
        topWidgets: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MainButton(
                title: l.export,
                onPressed: () {},
              ),
              const SizedBox(height: 30),
            ],
          ),
        ],
        child: ListView(
          padding: const EdgeInsets.all(16).copyWith(bottom: 100),
          children: [
            ImageWidget(
              Assets.getTemplate(resume.template),
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
      ),
    );
  }
}
