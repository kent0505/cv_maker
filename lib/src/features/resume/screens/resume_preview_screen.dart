import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/resume.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/image_widget.dart';

class ResumePreviewScreen extends StatelessWidget {
  const ResumePreviewScreen({super.key, required this.resume});

  final Resume resume;

  static const routePath = '/ResumePreviewScreen';

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: Appbar(title: l.myResume),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ImageWidget(
            Assets.getTemplate(resume.template),
            // height: 140,
            // width: 180,
            fit: BoxFit.cover,
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
    );
  }
}
