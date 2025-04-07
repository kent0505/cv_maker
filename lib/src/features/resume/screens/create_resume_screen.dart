import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/template.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/bg.dart';
import '../provider/resume_provider.dart';
import '../widgets/resume_indicator.dart';
import 'resume_information.dart';

class CreateResumeScreen extends StatelessWidget {
  const CreateResumeScreen({super.key, required this.template});

  final Template template;

  static const routePath = '/CreateResumeScreen';

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final provider = context.watch<ResumeProvider>();
    final left = provider.index == 1;
    final right = provider.index == 10;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Appbar(
        title: provider.getTitle(l),
        left: AppbarButton(
          asset: left ? Assets.close : Assets.left,
          onPressed: left
              ? () {
                  context.pop();
                  provider.onClose();
                }
              : provider.goLeft,
        ),
        right: AppbarButton(
          asset: right ? Assets.close : Assets.right,
          onPressed: right
              ? () {
                  context.pop();
                  provider.onClose();
                }
              : provider.goRight,
        ),
      ),
      body: Bg(
        child: ListView(
          padding: EdgeInsets.all(16).copyWith(bottom: 100),
          children: [
            const SizedBox(height: 4),
            ResumeIndicator(index: provider.index),
            const SizedBox(height: 16),
            if (provider.index == 1) ResumeInformation(),
          ],
        ),
      ),
    );
  }
}
