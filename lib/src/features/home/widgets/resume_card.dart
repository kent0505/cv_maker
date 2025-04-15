import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/resume.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/dialog_widget.dart';
import '../../../core/widgets/image_widget.dart';
import '../../../core/widgets/svg_widget.dart';
import '../../resume/bloc/resume_bloc.dart';
import '../../resume/provider/resume_provider.dart';
import '../../resume/screens/edit_resume_screen.dart';

class ResumeCard extends StatefulWidget {
  const ResumeCard({super.key, required this.resume});

  final Resume resume;

  @override
  State<ResumeCard> createState() => _ResumeCardState();
}

class _ResumeCardState extends State<ResumeCard> {
  bool menuOpened = false;

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

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          ImageWidget(
            'assets/templates/${widget.resume.template}.png',
            height: 140,
            width: 180,
            fit: BoxFit.cover,
            borderRadius: BorderRadius.circular(10),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.resume.name,
                      style: TextStyle(
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
              Expanded(
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '100% ${l.filled}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: AppFonts.funnel700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (menuOpened) ...[
            Row(
              children: [
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
                const SizedBox(width: 8),
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
              ],
            ),
            const SizedBox(height: 22),
          ],
        ],
      ),
    );
  }
}
