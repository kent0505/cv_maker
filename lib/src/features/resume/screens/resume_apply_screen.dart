import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/resume.dart';
import '../../../core/models/template.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/image_widget.dart';
import '../bloc/resume_bloc.dart';

class ResumeApplyScreen extends StatelessWidget {
  const ResumeApplyScreen({super.key, required this.resume});

  final Resume resume;

  static const routePath = '/ResumeApplyScreen';

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    // final t = templates.where((element) {
    //   return element.id >= 11;
    // }).toList(); // временно

    return Scaffold(
      appBar: Appbar(title: l.applyTemplates),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Wrap(
            spacing: 30,
            runSpacing: 10,
            children: List.generate(
              templates.length,
              (index) {
                return _TemplateCard(
                  template: templates[index],
                  resume: resume,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TemplateCard extends StatelessWidget {
  const _TemplateCard({
    required this.template,
    required this.resume,
  });

  final Template template;
  final Resume resume;

  @override
  Widget build(BuildContext context) {
    final total = MediaQuery.sizeOf(context).width;
    final width = (total / (total > 450 ? 3 : 2)) - 31;
    final height = width * 1.4;

    return SizedBox(
      width: width,
      child: Button(
        onPressed: () {
          context.read<ResumeBloc>().add(ApplyResumeTemplate(
                template: template,
                resume: resume,
              ));
          context.pop();
        },
        child: Column(
          children: [
            ImageWidget(
              template.asset,
              width: width,
              height: height,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              borderRadius: BorderRadius.circular(20),
              cacheWidth: total.toInt(),
              cacheHeight: (total * 1.4).toInt(),
            ),
            SizedBox(
              height: 44,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      template.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: AppFonts.funnel800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
