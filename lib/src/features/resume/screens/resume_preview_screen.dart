import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:screenshot/screenshot.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/data.dart';
import '../../../core/models/resume.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/bg.dart';
import '../../../core/widgets/dialog_widget.dart';
import '../../../core/widgets/main_button.dart';
import '../bloc/resume_bloc.dart';
import '../widgets/export_sheet.dart';
import '../widgets/template_widget.dart';

class ResumePreviewScreen extends StatefulWidget {
  const ResumePreviewScreen({super.key, required this.resume});

  final Resume resume;

  static const routePath = '/ResumePreviewScreen';

  @override
  State<ResumePreviewScreen> createState() => _ResumePreviewScreenState();
}

class _ResumePreviewScreenState extends State<ResumePreviewScreen> {
  final screenshotController = ScreenshotController();

  Data data = emptyData;

  void onExport() async {
    ExportSheet.show(
      context,
      screenshotController: screenshotController,
    );
  }

  @override
  void initState() {
    super.initState();
    final data2 = context.read<ResumeBloc>().data;
    final resume = widget.resume;
    data = Data(
      resume: resume,
      languages: data2.languages.where((x) => x.id == resume.id).toList(),
      educations: data2.educations.where((x) => x.id == resume.id).toList(),
      experiences: data2.experiences.where((x) => x.id == resume.id).toList(),
      skills: data2.skills.where((x) => x.id == resume.id).toList(),
      interests: data2.interests.where((x) => x.id == resume.id).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: Appbar(
        title: l.myResume,
        right: AppbarButton(
          asset: Assets.close,
          onPressed: () {
            DialogWidget.show(
              context,
              title: l.delete,
              description: l.deleteDescription,
              onYes: () {
                context
                    .read<ResumeBloc>()
                    .add(DeleteResume(resume: widget.resume));
                context.pop();
              },
            );
          },
        ),
      ),
      body: Bg(
        topWidgets: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MainButton(
                title: l.export,
                onPressed: onExport,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ],
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: FittedBox(
                  child: SizedBox(
                    width: 550,
                    height: 550 * 1.41,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Screenshot(
                        controller: screenshotController,
                        child: TemplateWidget(data: data),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
