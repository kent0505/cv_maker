import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/data.dart';
import '../../../core/models/resume.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/dialog_widget.dart';
import '../../../core/widgets/svg_widget.dart';
import '../../resume/bloc/resume_bloc.dart';
import '../../resume/provider/resume_provider.dart';
import '../../resume/screens/edit_resume_screen.dart';
import '../../resume/screens/resume_apply_screen.dart';
import '../../resume/screens/resume_preview_screen.dart';
import '../../resume/widgets/template_widget.dart';

class ResumeCard extends StatefulWidget {
  const ResumeCard({super.key, required this.resume});

  final Resume resume;

  @override
  State<ResumeCard> createState() => _ResumeCardState();
}

class _ResumeCardState extends State<ResumeCard> {
  bool menuOpened = false;
  double filled = 0;

  void onImage() {
    context.push(
      ResumePreviewScreen.routePath,
      extra: widget.resume,
    );
  }

  void onApply() {
    context.push(
      ResumeApplyScreen.routePath,
      extra: widget.resume,
    );
  }

  void onMenu() {
    setState(() {
      menuOpened = !menuOpened;
    });
  }

  void onDelete() {
    final l = AppLocalizations.of(context)!;
    DialogWidget.show(
      context,
      title: l.delete,
      description: l.deleteDescription,
      onYes: () {
        context.read<ResumeBloc>().add(DeleteResume(resume: widget.resume));
      },
    );
  }

  void onEdit() {
    context.push(
      EditResumeScreen.routePath,
      extra: widget.resume,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    // СЧИТАЕТ ПРОЦЕНТ ЗАПОЛНЕННОСТИ
    int filledSteps = 1;
    final data2 = context.read<ResumeBloc>().data;
    final resume = widget.resume;
    final data = Data(
      resume: resume,
      languages: data2.languages.where((x) => x.id == resume.id).toList(),
      educations: data2.educations.where((x) => x.id == resume.id).toList(),
      experiences: data2.experiences.where((x) => x.id == resume.id).toList(),
      skills: data2.skills.where((x) => x.id == resume.id).toList(),
      interests: data2.interests.where((x) => x.id == resume.id).toList(),
    );
    if (data.languages.isNotEmpty) filledSteps++;
    if (data.educations.isNotEmpty) filledSteps++;
    if (data.experiences.isNotEmpty) filledSteps++;
    if (data.skills.isNotEmpty) filledSteps++;
    if (data.interests.isNotEmpty) filledSteps++;
    if (resume.about.trim().isNotEmpty) filledSteps++;
    filled = (filledSteps / 7 * 100);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Stack(
        children: [
          Positioned.fill(
            right: 134,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Positioned.fill(
            top: 76,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 16),
                  Expanded(
                    child: Button(
                      padding: const EdgeInsets.only(top: 16),
                      onPressed: onImage,
                      child: SizedBox(
                        height: 140,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FittedBox(
                            alignment: Alignment.topLeft,
                            fit: BoxFit.cover,
                            child: SizedBox(
                              width: 550,
                              height: 550 * 1.41,
                              child: TemplateWidget(
                                data: data,
                                id: resume.template,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    height: 54,
                    width: 128,
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xff007AFF),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Button(
                      onPressed: onApply,
                      child: Text(
                        l.applyTemplates,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: AppFonts.funnel700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.resume.name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: AppFonts.funnel700,
                          ),
                        ),
                        Text(
                          widget.resume.job,
                          style: const TextStyle(
                            color: Color(0xffD9D9D9),
                            fontSize: 12,
                            fontFamily: AppFonts.funnel700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Button(
                    onPressed: onMenu,
                    child: const SvgWidget(Assets.menu),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const SizedBox(width: 16),
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          height: 8,
                          decoration: BoxDecoration(
                            color: const Color(0xffD9D9D9),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: filled / 100,
                          child: Container(
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '${filled.toStringAsFixed(2)}% ${l.filled}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: AppFonts.funnel700,
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
              const SizedBox(height: 16),
              if (menuOpened) ...[
                Row(
                  spacing: 8,
                  children: [
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        height: 54,
                        decoration: BoxDecoration(
                          color: const Color(0xffFD9191),
                          borderRadius: BorderRadius.circular(54),
                        ),
                        child: Button(
                          onPressed: onDelete,
                          child: Center(
                            child: Text(
                              l.delete,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: AppFonts.funnel700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 54,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(54),
                        ),
                        child: Button(
                          onPressed: onEdit,
                          child: Center(
                            child: Text(
                              l.edit,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: AppFonts.funnel700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
                const SizedBox(height: 22),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
